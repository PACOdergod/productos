
import 'dart:convert';

class Product {
  Product({
    required this.cantidad,
    required this.name,
    required this.price,
    this.picture,
    this.id
  });

  int cantidad;
  String name;
  double price;
  String? picture;
  String? id;

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
    cantidad: json["cantidad"],
    name: json["name"],
    picture: json["picture"],
    price: json["price"].toDouble(),
  );

  Map<String, dynamic> toMap() => {
    "cantidad": cantidad,
    "name": name,
    "picture": picture,
    "price": price,
  };

  Product copy()=> Product(
    cantidad: this.cantidad, 
    name: this.name, 
    price: this.price,
    picture: this.picture,
    id: this.id
  );

  static Product empty()=> Product(
    cantidad: 0, name: '', price: 0
  );
}
