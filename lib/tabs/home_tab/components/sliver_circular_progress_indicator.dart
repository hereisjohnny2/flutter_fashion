import 'package:flutter/material.dart';

class SliverCircularIndicatorProgress extends StatelessWidget {
  const SliverCircularIndicatorProgress({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 200,
        alignment: Alignment.center,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      ),
    );
  }
}
