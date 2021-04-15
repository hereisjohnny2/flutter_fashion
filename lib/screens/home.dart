import 'package:flutter/material.dart';
import 'package:flutter_fashion/components/custom_drawer.dart';
import 'package:flutter_fashion/tabs/home_tab/home_tab.dart';
import 'package:flutter_fashion/tabs/products_tab/products_tab.dart';

class HomeScreen extends StatelessWidget {
  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Scaffold(
          drawer: CustomDrawer(pageController: _pageController),
          body: HomeTab(),
        ),
        Scaffold(
          appBar: AppBar(title: Text("Produtos"), centerTitle: true),
          drawer: CustomDrawer(pageController: _pageController),
          body: ProductsTab(),
        ),
      ],
    );
  }
}
