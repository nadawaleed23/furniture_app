import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
              child: CircleAvatar(
                child: Image.asset("assets/images/searrch.png"),
                radius: 50,
              ),
      ),
    );
  }
}
