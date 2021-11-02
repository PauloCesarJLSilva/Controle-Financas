import 'package:controle_financeiro/pages/home/widgets/my_app_bar.dart';
import 'package:controle_financeiro/pages/home/widgets/my_dots_app.dart';
import 'package:controle_financeiro/pages/home/widgets/page_view_app.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late bool _showMenu;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _showMenu = false;
    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    double _screenHeigth = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          MyappBar(
            showMenu: _showMenu,
            onTap: (){
              setState(() {
                _showMenu = !_showMenu;
              });
            },
          ),
          PageViewApp(
            top: _screenHeigth * 0.30,
            onChanged: (index){
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          Positioned(
            top: _screenHeigth * 0.91,
            child: MyDotsApp(currentIndex: _currentIndex),
          )
        ],
      ),
    );
  }
}