import 'package:flutter/material.dart';

class MyappBar extends StatelessWidget {
  final bool showMenu;
  final VoidCallback onTap;

  const MyappBar({Key? key, required this.showMenu, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).padding.top,
        ),
        GestureDetector(
          onTap: onTap,
          child: Container(
            color: Colors.blue[900],
            height: MediaQuery.of(context).size.height * 0.31,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget>[
                    Image.asset('assets/images/logo.png',
                      height: 160,
                    ),
                    SizedBox(width: 10,),
                  ],
                ),
                Icon(!showMenu ? Icons.expand_more : Icons.expand_less)
              ],
            ),
          ),
        ),
      ],
    );
  }
}