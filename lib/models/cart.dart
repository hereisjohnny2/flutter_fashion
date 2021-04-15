import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fashion/models/cart_product.dart';
import 'package:flutter_fashion/models/user.dart';
import 'package:scoped_model/scoped_model.dart';

class Cart extends Model {
  final User user;
  List<CartProduct> products = [];

  Cart(this.user);

  CollectionReference usersCollection = Firestore.instance.collection("users");

  static Cart of(BuildContext context) {
    return ScopedModel.of<Cart>(context);
  }

  void addCartItem(CartProduct product) async {
    products.add(product);
    final productRef = await usersCollection
        .document(user.firebaseUser.uid)
        .collection("cart")
        .add(product.toMap());
    product.cartProductId = productRef.documentID;
    notifyListeners();
  }

  void removeCartItem(CartProduct product) async {
    await usersCollection
        .document(user.firebaseUser.uid)
        .collection("cart")
        .document(product.cartProductId)
        .delete();
    products.remove(product);
    notifyListeners();
  }
}
