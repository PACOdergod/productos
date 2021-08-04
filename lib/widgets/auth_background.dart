import 'package:flutter/material.dart';


class AuthBackground extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,

      child: Stack(
        children: [

          _BoxColor(),

          SafeArea( child: _icono(context) ),

        ],
      ),

    );
  }

  Container _icono(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 30),
      child: Icon( 
        Icons.person_pin, 
        color: Theme.of(context).colorScheme.surface,
        size: 100,
      ),
    );
  }
}

class _BoxColor extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    var boxDecoration = BoxDecoration(
      color: Theme.of(context).colorScheme.primary
    );

    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: boxDecoration,

      child: Stack(
        children: [
          Positioned(child: circulo(context), top: 100, left: 10,),
          Positioned(child: circulo(context), top: 10, left: 100,),
          Positioned(child: circulo(context), top: -10, right: -30,),
          Positioned(child: circulo(context), bottom: -30, right: -10,),
          
        ],
      ),

    );
  }

  Container circulo(BuildContext context)=> Container(
    width: 100,
    height: 100,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(100),
      color: Theme.of(context).colorScheme.primaryVariant
    ),
  );

}