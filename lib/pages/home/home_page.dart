import 'package:controle_financeiro/pages/home/widgets/item_menu_bottom.dart';
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
  late double _yPosition = 215;

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
                _yPosition = _showMenu ? _screenHeigth * .81 : _screenHeigth * .31;
              });
            },
          ),
          MenuApp(
            top: _screenHeigth * 0.29,
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
              double positionBottomLimit = _screenHeigth * .81;
              double positionTopLimit = _screenHeigth * .31;
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
            top: _screenHeigth * 0.805,
            currentIndex: _currentIndex
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            bottom: !_showMenu ? 0 + MediaQuery.of(context).padding.bottom : -50,
            left: 0,
            right: 0,
            height: 120,
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 400),
              opacity: !_showMenu ? 1 : 0,
              child: Container(
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    ItemMenuBottom(
                      icon: Icons.person_add,
                      text: 'Indicar amigos',
                    ),   
                    ItemMenuBottom(
                      icon: Icons.phone_android_rounded,
                      text: 'Recarga de celular',
                    ),
                    ItemMenuBottom(
                      icon: Icons.chat,
                      text: 'Cobrar',
                    ),
                    ItemMenuBottom(
                      icon: Icons.monetization_on,
                      text: 'Empréstimos',
                    ), 
                    ItemMenuBottom(
                      icon: Icons.move_to_inbox,
                      text: 'Depositar',
                    ),
                    ItemMenuBottom(
                      icon: Icons.transform,
                      text: 'Transferir',
                    ),    
                    ItemMenuBottom(
                      icon: Icons.auto_graph_rounded,
                      text: 'Ajustar limite',
                    ),  
                    ItemMenuBottom(
                      icon: Icons.money_rounded,
                      text: 'Pagar',
                    ),  
                    ItemMenuBottom(
                      icon: Icons.lock_open,
                      text: 'Bloquear cartão',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


//double positionBottomLimit = _screenHeigth * .90;
//double positionTopLimit = _screenHeigth * .30;