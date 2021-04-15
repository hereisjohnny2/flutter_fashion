import 'package:flutter/material.dart';
import 'package:flutter_fashion/models/product.dart';
import 'package:flutter_fashion/screens/category_list/components/product_card_text_content.dart';

class GridViewProductCard extends StatelessWidget {
  const GridViewProductCard({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 0.8,
          child: Image.network(product.images[0], fit: BoxFit.cover),
        ),
        Expanded(child: ProductCardTextContent(product: product)),
      ],
    );
  }
}
