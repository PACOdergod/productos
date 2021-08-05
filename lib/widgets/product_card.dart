import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      height: 350,

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 7)
          )
        ]
      ),

      child: Stack(
        children: [

          _BackImage(),

          Positioned(
            child: _Description(),
            bottom: 0,
          )

        ],
      ),
    );
  }

}

class _Description extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: MediaQuery.of(context).size.width-40,

      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        )
      ),
      
      child: Row(
        children: [

          _Name(),

          _Price(),

        ],
      ),

    );
  }
}

class _Name extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ( MediaQuery.of(context).size.width-40 )/2 + 50,
      alignment: Alignment.center,

      child: Text( 'Disco duro',
        style: TextStyle( 
          color: Colors.white, 
          fontWeight: FontWeight.bold,
          fontSize: 20
        ),
        textAlign: TextAlign.center,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class _Price extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ( MediaQuery.of(context).size.width-40 )/2 - 50,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 10),

      child: FittedBox(
        fit: BoxFit.contain,
        child: Text( '\$100',
          style: TextStyle( 
            color: Colors.white, 
            fontWeight: FontWeight.bold,
            fontSize: 20
          ),
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
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