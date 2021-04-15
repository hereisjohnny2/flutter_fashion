import 'package:flutter/material.dart';
import 'package:flutter_fashion/models/product.dart';

class ProductCardTextContent extends StatelessWidget {
  const ProductCardTextContent({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.title,
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          Text(
            'R\$ ${product.price.toStringAsFixed(2)}',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Theme.of(context).primaryColor,
              fontSize: 17.0,
            ),
          ),
        ],
      ),
    );
  }
}
