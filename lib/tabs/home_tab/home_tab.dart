import 'package:flutter/material.dart';
import 'package:flutter_fashion/components/body_back.dart';
import 'package:flutter_fashion/tabs/home_tab/components/home_content.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BodyBack(
          gradColors: [
            Color.fromARGB(255, 211, 118, 130),
            Color.fromARGB(255, 253, 181, 168),
          ],
        ),
        HomeContent(),
      ],
    );
  }
}
