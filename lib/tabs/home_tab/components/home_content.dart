import 'package:flutter/material.dart';
import 'package:flutter_fashion/tabs/home_tab/components/floating_app_bar.dart';
import 'package:flutter_fashion/tabs/home_tab/components/new_products_grid.dart';

class HomeContent extends StatelessWidget {
  HomeContent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        FloatingAppBar(),
        NewProductsGrid(),
      ],
    );
  }
}
