import 'package:flutter/material.dart';


class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // Future.delayed( Duration(seconds: 2), 
    //   ()=> Navigator.pushReplacementNamed(context, 'home')
    // );

    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.green,
          backgroundColor: Colors.pink,
        ),
      ),
    );
  }
}