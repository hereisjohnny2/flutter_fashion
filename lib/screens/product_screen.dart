import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fashion/models/cart.dart';
import 'package:flutter_fashion/models/cart_product.dart';
import 'package:flutter_fashion/models/product.dart';
import 'package:flutter_fashion/models/user.dart';
import 'package:flutter_fashion/screens/login_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;

  const ProductDetailsScreen({Key key, this.product}) : super(key: key);

  @override
  _ProductDetailsScreenState createState() =>
      _ProductDetailsScreenState(product);
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final Product product;
  String selectedSize;

  _ProductDetailsScreenState(this.product);

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          AspectRatio(
            aspectRatio: 0.9,
            child: Carousel(
              images: product.images.map((url) => NetworkImage(url)).toList(),
              dotSize: 4.0,
              dotSpacing: 15.0,
              dotBgColor: Colors.transparent,
              dotColor: primaryColor,
              dotIncreasedColor: primaryColor,
              autoplay: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  product.title,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                  maxLines: 3,
                ),
                Text(
                  'R\$ ${product.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                  maxLines: 3,
                ),
                SizedBox(height: 16.0),
                Text(
                  'Tamanho',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 34.0,
                  child: GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      crossAxisSpacing: 8.0,
                      childAspectRatio: 0.5,
                    ),
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    children: product.sizes.map((size) {
                      return _buildGestureDetector(size, primaryColor);
                    }).toList(),
                  ),
                ),
                SizedBox(height: 16.0),
                SizedBox(
                  height: 44.0,
                  child: ScopedModelDescendant<User>(
                    builder: (context, child, model) => ElevatedButton(
                      onPressed: selectedSize != null
                          ? () => _addProductToCart(model, context)
                          : null,
                      child: Text(
                        model.isLoggedIn()
                            ? 'Adicionar ao Carrinho'
                            : 'Entre para Comprar',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(primaryColor),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Descrição',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                ),
                Text(
                  product.description,
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildGestureDetector(size, Color primaryColor) {
    return GestureDetector(
      onTap: () => setState(() => selectedSize = size),
      child: Container(
        margin: const EdgeInsets.only(right: 5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(4.0),
          ),
          border: Border.all(
            color: size == selectedSize ? primaryColor : Colors.grey,
            width: 3.0,
          ),
        ),
        width: 500.0,
        alignment: Alignment.center,
        child: Text(size),
      ),
    );
  }

  void _addProductToCart(User model, BuildContext context) {
    if (!model.isLoggedIn()) {
      _pushToLoginScreen(context);
    }
    CartProduct cartProduct = CartProduct();
    cartProduct.size = selectedSize;
    cartProduct.quantity = 1;
    cartProduct.storeProductId = product.id;
    cartProduct.category = product.category;
    Cart.of(context).addCartItem(cartProduct);
  }

  void _pushToLoginScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return LoginScreen();
        },
      ),
    );
  }
}
