import 'package:flutter/material.dart';
import 'package:flutter_fashion/components/body_back.dart';
import 'package:flutter_fashion/components/custom_drawer_header.dart';
import 'package:flutter_fashion/components/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  final PageController pageController;

  const CustomDrawer({Key key, this.pageController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          BodyBack(
            gradColors: [Color.fromARGB(255, 203, 236, 241), Colors.white],
          ),
          ListView(
            padding:
                const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
            children: [
              CustomDrawerHeader(),
              Divider(),
              DrawerTile(
                icon: Icons.home,
                label: "Início",
                pageController: pageController,
                page: 0,
              ),
              DrawerTile(
                icon: Icons.list,
                label: "Produtos",
                pageController: pageController,
                page: 1,
              ),
              DrawerTile(
                icon: Icons.location_on,
                label: "Lojas",
                pageController: pageController,
                page: 2,
              ),
              DrawerTile(
                icon: Icons.playlist_add_check,
                label: "Pedidos",
                pageController: pageController,
                page: 3,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
