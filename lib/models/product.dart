import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String category;
  final String id;
  final String title;
  final String description;
  final double price;
  final List<dynamic> images;
  final List<dynamic> sizes;

  Product(
    this.id,
    this.title,
    this.description,
    this.price,
    this.images,
    this.sizes, {
    this.category,
  });

  factory Product.fromDocument(DocumentSnapshot document) {
    return Product(
      document.documentID,
      document.data["title"],
      document.data["description"],
      document.data["price"] + 0.0,
      document.data["images"],
      document.data["sizes"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "price": price,
      "images": images,
      "sizes": sizes,
    };
  }

  Map<String, dynamic> toResumedMap() {
    return {"title": title, "description": description, "price": price};
  }
}
