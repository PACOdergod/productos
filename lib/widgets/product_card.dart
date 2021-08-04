import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Container(
        width: double.infinity,
        height: 300,
        decoration: _cardDecoration(),
        child: Stack(
          children: [
            _BackImage()
          ],
        ),
      ),
    );
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 10,
          offset: Offset(0, 7)
        )
      ]
    );
  }
}

class _BackImage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 300,
        child: FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'), 
          image: NetworkImage('https://via.placeholder.com/400x300/f6f6f6'),
          fit: BoxFit.cover,
        )
      ),
    );
  }
}