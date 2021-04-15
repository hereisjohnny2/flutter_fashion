import 'package:flutter/material.dart';
import 'package:flutter_fashion/models/product.dart';
import 'package:flutter_fashion/screens/category_list/components/product_card_text_content.dart';

class ListViewProductCard extends StatelessWidget {
  const ListViewProductCard({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: Image.network(
            product.images[0],
            fit: BoxFit.cover,
            height: 250.0,
          ),
        ),
        Flexible(
          flex: 1,
          child: ProductCardTextContent(product: product),
        )
      ],
    );
  }
}
