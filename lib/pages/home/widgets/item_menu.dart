import 'package:flutter/material.dart';

class ItemMenu extends StatelessWidget {

  final IconData icon;
  final String text;

  const ItemMenu({ Key? key, required this.icon, required this.text }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 0.5, color: Colors.white54),
          top: BorderSide(width: 0.5, color: Colors.white54),
        ),
      ),
      child: ElevatedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(icon),
                SizedBox(width: 10,),
                Text(text, style: TextStyle(fontSize: 20),),
              ]
            ),
            Icon(Icons.chevron_right)
          ],
        ),
        onPressed: (){},
      ),
    );
  }
}