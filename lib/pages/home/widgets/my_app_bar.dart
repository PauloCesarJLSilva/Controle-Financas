import 'package:flutter/material.dart';

class MyappBar extends StatelessWidget {
  const MyappBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).padding.top,
        ),
        Container(
          color: Colors.red,
          height: 200,
          child: Row(
            children:<Widget>[
              //image.
              SizedBox(width: 10,),
              Text(
                "Texto",
                style: TextStyle(
                  fontWeight: FontWeight.bold, 
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}