import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import 'package:productos_app/models/models.dart';


class ProductService extends ChangeNotifier{

  final String _urlbase = 
    'flutterproducts-867c9-default-rtdb.firebaseio.com';
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

    if(product.id == null) await _create(product);
    else await _update(product);

    isSaving = false;
    notifyListeners();
  }

  Future<String> _create(Product product) async {
    final url = Uri.https(_urlbase, 'products.json');
    final res = await http.post(url, body: product.toJson());
    final decodedData = json.decode(res.body);

    product.id = decodedData["name"];
    this.products.insert(0, product);

    return product.id!;
  }

  Future<String> _update(Product product) async {
    final url = Uri.https(_urlbase, 'products/${product.id}.json');
    await http.put(url, body: product.toJson());

    int i = this.products.indexWhere((p) => p.id == product.id);
    this.products[i] = product;

    return product.id!;
  }

  
  File? newPictureFile;

  void updateProductImage(String path) {
    this.selectedProduct.picture = path;
    this.newPictureFile = File.fromUri( Uri(path: path) );

    notifyListeners();
  }

  Future<String?> uploadImage()async{
    if (this.newPictureFile == null) return null;

    this.isSaving = true;
    notifyListeners();

    final url = Uri.parse(
      'https://api.cloudinary.com/v1_1/dg2trkkq7/image/upload?upload_preset=wv6igt2k'
    );
    final imageRequest = http.MultipartRequest('POST', url);
    final file = await http.MultipartFile.fromPath('file', newPictureFile!.path);
    imageRequest.files.add(file);

    final streamRes = await imageRequest.send();
    final resp = await http.Response.fromStream(streamRes);

    if (resp.statusCode != 200 && resp.statusCode != 201) {
      return null;
    }

    this.newPictureFile = null;
    isSaving = false;

    final decodedData = json.decode(resp.body);
    return decodedData['secure_url'];
  }
}