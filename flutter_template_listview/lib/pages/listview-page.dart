import 'package:flutter/material.dart';
import 'package:flutter_template_listview/animations/fade-move.dart';
import 'package:flutter_template_listview/components/listview-boxes.dart';

class ListViewPage extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  final double _heightDistanceTop = 300;
  
  Function(double) onScrollListView;
  double _heightDistanceTopTemp;

  double leftAnimation = 0;
  double leftFastAnimation = 0;
  double topAnimation = 0;
  double topFastAnimation = 0;
  double opacityAnimation = 1;

  @override
  void initState() {
    _heightDistanceTopTemp = _heightDistanceTop;
    onScrollListView = (double offset) {
      setState(() {
        _heightDistanceTopTemp = _heightDistanceTop - offset;
        
        double speedAnimation = offset * 0.4;
        leftAnimation = speedAnimation;
        leftFastAnimation = speedAnimation * 1.6;
        topAnimation = speedAnimation;
        topFastAnimation = speedAnimation * 1.6;
        opacityAnimation = 1 - ((speedAnimation/50) > 1.0 ? 1.0 : (speedAnimation/50));
      });
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: _heightDistanceTopTemp <= 0 ? 0 : _heightDistanceTopTemp,
            color: Colors.blue,
          ),
          FadeMoveAnimation(
            top: _heightDistanceTop - 75,
            left: 20 - leftAnimation,
            bottom: 20,
            opacity: opacityAnimation,
            child: Text('Rafael Kenji Nagai', style: TextStyle(fontSize: 20, color: Colors.white)),
          ),
          FadeMoveAnimation(
            top: _heightDistanceTop - 50,
            left: 20 - leftFastAnimation,
            bottom: 20,
            opacity: opacityAnimation,
            child: Text('21/01/2020', style: TextStyle(fontSize: 15, color: Colors.white70))
          ),
          FadeMoveAnimation(
            top: 115 - topFastAnimation,
            left: 0,
            opacity: opacityAnimation,
            child: Container(
              width: widthScreen,
              child: Center(
                child: Text('Bem-Vindo', style: TextStyle(fontSize: 25, color: Colors.white70)) 
              ,)
            ,)
          ),
          FadeMoveAnimation(
            top: 145 - topAnimation,
            left: 0,
            opacity: opacityAnimation,
            child: Container(
              width: widthScreen,
              child: Center(
                child: Text('Rafael Kenji Nagai', style: TextStyle(fontSize: 35, color: Colors.white)) 
              ,)
            ,) 
          ),
          Container(
            child: ListViewBoxes(
              onScroll: onScrollListView,
              marginHeader: _heightDistanceTop,
            ),
          ),
          FadeMoveAnimation(
            top: positionHeader(topAnimation - 50),
            left: 0,
            opacity: 1 - opacityAnimation,
            child: Container(
              width: widthScreen,
              height: 120,
              color: Colors.blue,
              padding: EdgeInsets.only(top: 60),
              child: Center(
                child: Text('Template App', style: TextStyle(fontSize: 35, color: Colors.white)) 
              ,)
            ,) 
          ),
        ],
      ),
    );
  }

  double positionHeader(double top){
    return top > 0 ? 0 : top;
  }
}