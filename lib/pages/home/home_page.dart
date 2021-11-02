import 'package:controle_financeiro/pages/home/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          MyappBar()
        ],
      ),
    );
  }
}