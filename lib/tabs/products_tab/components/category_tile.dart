import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fashion/screens/category_list/category_list.dart';

class CategoryTile extends StatelessWidget {
  final DocumentSnapshot categoryDocument;

  const CategoryTile({Key key, this.categoryDocument}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(categoryDocument.data["title"]),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => CategoryList(
          document: categoryDocument,
        ),
      )),
    );
  }
}
