import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fashion/tabs/products_tab/components/category_tile.dart';

class ProductsTab extends StatelessWidget {
  final CollectionReference _productsCollection =
      Firestore.instance.collection("products");

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: _productsCollection.getDocuments(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<DocumentSnapshot> documents = snapshot.data.documents;
          return ListView.separated(
            itemCount: documents.length,
            itemBuilder: (context, index) => CategoryTile(
              categoryDocument: documents[index],
            ),
            separatorBuilder: (context, index) => Divider(),
            padding: EdgeInsets.zero,
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
