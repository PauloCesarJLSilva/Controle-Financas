import 'package:flutter/material.dart';

class MyDotsApp extends StatelessWidget {
  final int currentIndex;
  final double top;
  final bool showMenu;

  Color getColor(int index){
    return index  == currentIndex ? Colors.white : Colors.white24;
  }

  const MyDotsApp({ Key? key, required this.currentIndex, required this.top, required this.showMenu }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 200),
        opacity: showMenu ? 0 : 1,
        child: Row(
          children:<Widget>[
            AnimatedContainer(
              duration: Duration(microseconds: 300),
              height: 10, 
              width: 10, 
              decoration: BoxDecoration(
                color: getColor(0),
                shape: BoxShape.rectangle
              ),
            ),
            SizedBox(width: 8,),
            AnimatedContainer(
              duration: Duration(microseconds: 300),
              height: 10, 
              width: 10, 
              decoration: BoxDecoration(
                color: getColor(1),
                shape: BoxShape.rectangle
              ),
            ),
            SizedBox(width: 8,),
            AnimatedContainer(
              duration: Duration(microseconds: 300),
              height: 10, 
              width: 10, 
              decoration: BoxDecoration(
                color: getColor(2),
                shape: BoxShape.rectangle
              ),
            ),
          ],
        ),
      ),
    );
  }
}