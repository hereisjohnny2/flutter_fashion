import 'package:flutter/material.dart';

class BodyBack extends StatelessWidget {
  const BodyBack({
    Key key,
    this.gradColors,
  }) : super(key: key);

  final List<Color> gradColors;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    );
  }
}
