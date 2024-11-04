import 'package:flutter/material.dart';

class Sebha extends StatelessWidget {
 ThemeMode mode = ThemeMode.system;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Image(image:  AssetImage( 'assets/images/head_sebha_dark.png')),
        
      ]),
    );
  }
}
