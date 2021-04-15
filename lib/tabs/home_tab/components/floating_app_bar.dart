import 'package:flutter/material.dart';

class FloatingAppBar extends StatelessWidget {
  const FloatingAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      snap: true,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      flexibleSpace: FlexibleSpaceBar(
        title: const Text("Novidades"),
        centerTitle: true,
      ),
    );
  }
}
