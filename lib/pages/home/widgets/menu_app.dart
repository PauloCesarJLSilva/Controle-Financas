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
        duration: Duration(milliseconds: 300),
        opacity: showMenu ? 1: 0,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.5,
          child: Column(
            children: <Widget>[
              Container(height: 80),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: <Widget>[
                      ItemMenu(icon: Icons.info, text: 'Ajuda'),
                      SizedBox(height: 12,),
                      ItemMenu(icon: Icons.person, text: 'Perfil'),
                      SizedBox(height: 12,),
                      ItemMenu(icon: Icons.settings, text: 'Conta'),
                      SizedBox(height: 12,),
                      ItemMenu(icon: Icons.credit_card, text: 'Cartão'),
                      SizedBox(height: 12,),
                      ItemMenu(icon: Icons.phone_android, text: 'Configuração'),
                      SizedBox(height: 12,),
                      ItemMenu(icon: Icons.exit_to_app, text: 'SAIR'),
                      SizedBox(height: 12,),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}