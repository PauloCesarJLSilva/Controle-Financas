import 'package:flutter/material.dart';

class ItemMenu extends StatelessWidget {
  const ItemMenu({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 0.5, color: Colors.white54),
          top: BorderSide(width: 0.5, color: Colors.white54),
        ),
      ),
    );
  }
}