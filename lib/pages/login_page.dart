import 'package:flutter/material.dart';

import 'package:productos_app/widgets/widgets.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(

        children: [
          AuthBackground(),

          SingleChildScrollView( child: _LoginCard() )
        ],
      )

    );
  }
}

class _LoginCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox( height: MediaQuery.of(context).size.height*0.3 ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: CardContainer()
        ),

        SizedBox(height: 30),

        Text('Crear una nueva cuenta', style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold
        ),),

        SizedBox(height: 20),

      ],
    );
  }
}