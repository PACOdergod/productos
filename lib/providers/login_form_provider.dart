import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  
  var globalKey = new GlobalKey<FormState>();

  String email = '';
  String password = '';

  bool isValidForm(){
    print(globalKey.currentState?.validate() ?? false);
    print(email);
    print(password);
    return globalKey.currentState?.validate() ?? false;

  }
}