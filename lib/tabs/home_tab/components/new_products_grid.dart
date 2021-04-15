import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fashion/tabs/home_tab/components/sliver_circular_progress_indicator.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';

class NewProductsGrid extends StatelessWidget {
  const NewProductsGrid({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: Firestore.instance
          .collection("home")
          .orderBy("position")
          .getDocuments(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<DocumentSnapshot> documents = snapshot.data.documents;
          return SliverStaggeredGrid.count(
            crossAxisCount: 2,
            mainAxisSpacing: 1.0,
            crossAxisSpacing: 1.0,
            staggeredTiles: documents.map(
              (doc) {
                return StaggeredTile.count(
                    doc.data["width"], doc.data["height"]);
              },
            ).toList(),
            children: documents.map((doc) {
              return FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: doc.data["image_link"],
                fit: BoxFit.cover,
              );
            }).toList(),
          );
        }
        return SliverCircularIndicatorProgress();
      },
    );
  }
}
