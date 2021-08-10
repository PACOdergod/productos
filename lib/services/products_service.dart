import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import 'package:productos_app/models/models.dart';


class ProductService extends ChangeNotifier{

  final String _urlbase = 'flutterproducts-867c9-default-rtdb.firebaseio.com';
  final List<Product> products = [];
  bool isLoading = true;

  late Product selectedProduct;

  ProductService(){
    this.loadProducts();
  }

  Future<List<Product>> loadProducts() async {

    this.isLoading = true;
    notifyListeners();

    final url  = Uri.https(_urlbase, 'products.json');
    final res = await http.get(url);

    final Map<String,dynamic> productsMap = jsonDecode(res.body);

    productsMap.forEach((key, value) {
      final tempProduct = Product.fromMap(value);
      tempProduct.id = key;
      this.products.add(tempProduct);

    });

    this.isLoading = false;
    notifyListeners();

    return this.products;
  }

  bool isSaving = false;
  Future saveOrCreate( Product product ) async {
    isSaving = true;
    notifyListeners();

    if(product.id == null){
      // Se debe crear
    } else {
      // actualizar
      update(product);
    }

    isSaving = false;
    notifyListeners();
  }
  Future<String> update(Product product) async {
    final url = Uri.https(_urlbase, 'products/${product.id}.json');
    final res = await http.put(url, body: product.toJson());

    print(res.body);

    return product.id!;
  }
  
}