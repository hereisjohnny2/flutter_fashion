import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final PageController pageController;
  final int page;

  const DrawerTile(
      {Key key, this.icon, this.label, this.pageController, this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop();
          pageController.jumpToPage(page);
        },
        child: Container(
          height: 60.0,
          child: Row(
            children: [
              Icon(
                icon,
                size: 32.0,
                color: pageController.page.round() == page
                    ? Theme.of(context).primaryColor
                    : Colors.grey[700],
              ),
              SizedBox(
                width: 32.0,
              ),
              Text(
                label,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
