import 'package:controle_financeiro/pages/home/widgets/menu_app.dart';
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
  late double _yPosition = 220;

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
                _yPosition = _showMenu ? _screenHeigth * .82 : _screenHeigth * .29;
              });
            },
          ),
          MenuApp(
            top: _screenHeigth * 0.30,
            showMenu: _showMenu,
          ),
          PageViewApp(
            showMenu: _showMenu,
            top: _yPosition,
            onChanged: (index){
              setState(() {
                _currentIndex = index;
              });
            },
            onPanUpdate: (details){
              double positionBottomLimit = _screenHeigth * .82;
              double positionTopLimit = _screenHeigth * .30;
              double midlePosition = (positionBottomLimit-positionTopLimit)/2;
              setState(() {
                print(_yPosition.toString());

                _yPosition += details.delta.dy;
                
                _yPosition = _yPosition < positionTopLimit
                  ? positionTopLimit
                  : _yPosition;

                _yPosition = _yPosition > positionBottomLimit
                  ? positionBottomLimit
                  : _yPosition;
                
                if (_yPosition != positionBottomLimit && details.delta.dy > 0){
                  _yPosition = _yPosition > positionTopLimit + midlePosition - 50
                  ? positionBottomLimit
                  : _yPosition;
                }

                if (_yPosition != positionTopLimit && details.delta.dy < 0){
                  _yPosition = _yPosition < positionBottomLimit - midlePosition
                  ? positionTopLimit
                  : _yPosition;
                }

                if (_yPosition == positionBottomLimit){
                  _showMenu =true;
                } else if (_yPosition == positionTopLimit){
                  _showMenu =false;
                }
              });            
            },
          ),
          MyDotsApp(
            showMenu: _showMenu,
            top: _screenHeigth * 0.82,
            currentIndex: _currentIndex
          ),
        ],
      ),
    );
  }
}


//double positionBottomLimit = _screenHeigth * .90;
//double positionTopLimit = _screenHeigth * .30;