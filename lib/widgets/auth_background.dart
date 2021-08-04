import 'package:flutter/material.dart';


class AuthBackground extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,

      child: Stack(
        children: [

          _BoxMorado(),

          SafeArea( child: _icono() ),

        ],
      ),

    );
  }

  Container _icono() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 30),
      child: Icon( Icons.person_pin, color: Colors.white, size: 100,),
    );
  }
}

class _BoxMorado extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    var boxDecoration = BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color.fromRGBO(63, 63, 156, 1),
          Color.fromRGBO(90, 70, 178, 1)
        ]
      )
    );

    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: boxDecoration,

      child: Stack(
        children: [
          Positioned(child: circulo(), top: 100, left: 10,),
          Positioned(child: circulo(), top: 10, left: 100,),
          Positioned(child: circulo(), top: -10, right: -30,),
          Positioned(child: circulo(), bottom: -30, right: -10,),
          
        ],
      ),

    );
  }

  Container circulo()=> Container(
    width: 100,
    height: 100,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(100),
      color: Color.fromRGBO(255, 255, 255, 0.05)
    ),
  );

}