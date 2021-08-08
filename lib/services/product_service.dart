import 'package:flutter/widgets.dart';
import 'package:productos_app/models/models.dart';


class ProductService extends ChangeNotifier{

  final String _urlbase = 'flutterproducts-867c9-default-rtdb.firebaseio.com';
  final List<Product> products = [];
  
}