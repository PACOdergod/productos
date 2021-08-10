import 'package:flutter/widgets.dart';
import 'package:productos_app/models/models.dart';

class ProductFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey();
  Product product;

  ProductFormProvider(this.product);

  bool isValid(){

    return formKey.currentState?.validate()?? false;
  }
}