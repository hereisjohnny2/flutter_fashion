import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_fashion/models/product.dart';

class CartProduct {
  String cartProductId;
  String category;
  String storeProductId;
  int quantity;
  String size;

  Product productData;

  CartProduct();

  CartProduct.fromDocument(DocumentSnapshot document) {
    cartProductId = document.documentID;
    category = document.data["category"];
    storeProductId = document.data["storeProductId"];
    quantity = document.data["quantity"];
    size = document.data["size"];
  }

  Map<String, dynamic> toMap() {
    return {
      "category": category,
      "storeProductId": storeProductId,
      "quantity": quantity,
      "size": size,
      // "product": productData.toResumedMap()
    };
  }
}
