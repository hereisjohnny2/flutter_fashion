import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fashion/models/product.dart';
import 'package:flutter_fashion/screens/category_list/components/product_title.dart';

class CategoryList extends StatelessWidget {
  final DocumentSnapshot document;

  const CategoryList({Key key, this.document}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CollectionReference itemsCollection = Firestore.instance
        .collection('products')
        .document(document.documentID)
        .collection('items');

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(document.data["title"]),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(icon: Icon(Icons.grid_on)),
              Tab(icon: Icon(Icons.list)),
            ],
          ),
        ),
        body: FutureBuilder<QuerySnapshot>(
          future: itemsCollection.getDocuments(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<DocumentSnapshot> documentsList = snapshot.data.documents;
              return TabBarView(
                children: [
                  GridView.builder(
                    padding: const EdgeInsets.all(4.0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 4.0,
                      crossAxisSpacing: 4.0,
                      childAspectRatio: 0.65,
                    ),
                    itemCount: documentsList.length,
                    itemBuilder: (context, index) {
                      Product data =
                          Product.fromDocument(documentsList.elementAt(index));
                      data.category = this.document.documentID;
                      return ProductTile(
                        product: data,
                      );
                    },
                  ),
                  ListView.builder(
                    padding: const EdgeInsets.all(4.0),
                    itemCount: documentsList.length,
                    itemBuilder: (context, index) {
                      Product data =
                          Product.fromDocument(documentsList.elementAt(index));
                      data.category = this.document.documentID;
                      return ProductTile(
                        isGrid: false,
                        product: data,
                      );
                    },
                  ),
                ],
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
