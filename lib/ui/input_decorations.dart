import 'package:flutter/material.dart';

class InputDecorations {

  static InputDecoration loginInputDeco({
    required String labelText, 
    required String hintText,
    required Widget prefixIcon,
  })=> InputDecoration(
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.deepPurple,
      )
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.deepPurple,
        width: 2
      )
    ),
    labelText: labelText,
    hintText: hintText,
    prefixIcon: prefixIcon
  );


  static InputDecoration loginInputMail()=> loginInputDeco(
    labelText: 'Correo',
    hintText: 'ejemplo@mail.com',
    prefixIcon: Icon( Icons.email, color: Colors.deepPurple )
  );

  static InputDecoration loginInputPass()=> loginInputDeco(
    labelText: 'Contraseña', 
    hintText: '******', 
    prefixIcon: Icon( Icons.lock_outline, color: Colors.deepPurple )
  );

}