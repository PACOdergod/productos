import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:productos_app/main.dart';
import 'package:productos_app/services/services.dart';


class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: _MyCircularProgress()
      ),
    );
  }
}


class LoadingProductPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final productService = Provider.of<ProductService>(context);

    Future.delayed( Duration(seconds: 1),
      productService.isSaving
      ? null
      : ()=>Navigator.pushNamed(context, Rutas.myProducts)
    );

    return Scaffold(
      body: Center(
        child: _MyCircularProgress(),
      ),
    );

  }
}

class _MyCircularProgress extends StatelessWidget {
  const _MyCircularProgress({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width/2,
      width:  MediaQuery.of(context).size.width/2,
      child: CircularProgressIndicator(
        color: Colors.green,
        backgroundColor: Colors.pink,
        strokeWidth: 10,
      ),
    );
  }
} 