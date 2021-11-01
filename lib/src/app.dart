import 'package:flutter/material.dart';

class ControleFinancas extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Controle de Finanças",
      theme: ThemeData(
        accentColor: Colors.blueAccent
      ),
    );
  }
}