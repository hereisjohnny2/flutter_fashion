import 'package:flutter/material.dart';
import 'package:flutter_fashion/models/product.dart';
import 'package:flutter_fashion/screens/category_list/components/grid_view_product_card.dart';
import 'package:flutter_fashion/screens/category_list/components/list_view_product_card.dart';
import 'package:flutter_fashion/screens/product_screen.dart';

class ProductTile extends StatelessWidget {
  final bool isGrid;
  final Product product;

  const ProductTile({Key key, this.isGrid = true, this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        return Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProductDetailsScreen(product: product),
        ));
      },
      child: Card(
        child: isGrid
            ? GridViewProductCard(product: product)
            : ListViewProductCard(product: product),
      ),
    );
  }
}
