import 'package:controle_financeiro/pages/home/widgets/item_menu.dart';
import 'package:flutter/material.dart';

class MenuApp extends StatelessWidget {
  final double top;
  final bool showMenu;

  const MenuApp({Key? key, required this.top, required this.showMenu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: 0,
      right: 0,
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 200),
        opacity: showMenu ? 1: 0,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.5,
          child: Column(
            children: <Widget>[
              Image.asset('assets/images/logo.png',height: 120),
              Container(height: 20),
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    ItemMenu(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}