import 'package:flutter/material.dart';

class InputDecorations {

  static InputDecoration loginInputDeco({
    required String labelText, 
    required String hintText,
    required Widget prefixIcon,
    required Color borderColor
  })=> InputDecoration(
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: borderColor,
      )
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: borderColor,
        width: 2
      )
    ),
    labelText: labelText,
    hintText: hintText,
    prefixIcon: prefixIcon
  );


  static InputDecoration loginInputMail(BuildContext context)=> loginInputDeco(
    labelText: 'Correo',
    hintText: 'ejemplo@mail.com',
    prefixIcon: Icon( Icons.email, 
      color: Theme.of(context).colorScheme.primary),
    borderColor: Theme.of(context).colorScheme.primary
  );

  static InputDecoration loginInputPass(BuildContext context)=> loginInputDeco(
    labelText: 'Contraseña', 
    hintText: '******', 
    prefixIcon: Icon( Icons.lock_outline, 
      color: Theme.of(context).colorScheme.primary ),
    borderColor: Theme.of(context).colorScheme.primary
  );

}