import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Fav extends StatelessWidget {
  const Fav({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Icon(Icons.favorite,size: 100,color: Colors.grey,),
      ),
    );
  }
}
