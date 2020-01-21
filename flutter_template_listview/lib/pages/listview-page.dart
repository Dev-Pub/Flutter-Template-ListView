import 'package:flutter/material.dart';
import 'package:flutter_template_listview/animations/fade-move.dart';
import 'package:flutter_template_listview/components/listview-boxes.dart';

class ListViewPage extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  final double _heightDistanceTop = 250;
  
  Function(double) onScrollListView;
  double _heightDistanceTopTemp;

  double leftAnimation = 0;
  double opacityAnimation = 1;

  @override
  void initState() {
    this._heightDistanceTopTemp = _heightDistanceTop;
    this.onScrollListView = (double offset) {
      print('ScrollEvent: $offset');
      setState(() {
        this._heightDistanceTopTemp = this._heightDistanceTop - offset;
        
        leftAnimation = offset;
        opacityAnimation = 1 - ((offset/50) > 1.0 ? 1.0 : (offset/50));//1 - (offset/10);
      });
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: _heightDistanceTopTemp,
            color: Colors.blue,
          ),
          FadeMoveAnimation(
            top: this._heightDistanceTop - 100,
            left: 20 - leftAnimation,
            bottom: 20,
            opacity: opacityAnimation,
            child: Text('Rafael Kenji Nagai', style: TextStyle(fontSize: 20, color: Colors.white)),
          ),
          // Positioned(
          //   top: this._heightDistanceTop - 100,
          //   left: 20 - leftAnimation,
          //   bottom: 20,
          //   child: Opacity(
          //     child: Text('Rafael Kenji Nagai', style: TextStyle(fontSize: 20, color: Colors.white)),
          //     opacity: opacityAnimation,
          //   ),
          // ),
          // Positioned(
          //   top: this._heightDistanceTop - 80,
          //   left: 20 - leftAnimation,
          //   bottom: 20,
          //   child: Opacity(
          //     child: Container(
          //       padding: EdgeInsets.only(top: 10),
          //       child: Text('21/01/2020', style: TextStyle(fontSize: 15, color: Colors.white70))
          //     ),
          //     opacity: opacityAnimation,
          //   ),
          // ),
          // Container(
          //   height: _heightDistanceTop,
          //   padding: EdgeInsets.all(20),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //     children: [
          //       Center(child: Text('TEMPLATE', style: TextStyle(fontSize: 30, color: Colors.white))),
          //       Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         mainAxisAlignment: MainAxisAlignment.start,
          //         children: [
          //           Opacity(
          //             child: Text('Rafael Kenji Nagai', style: TextStyle(fontSize: 20, color: Colors.white)),
          //             opacity: opacityAnimation,
          //             //left: leftAnimation, 
          //           ),
          //           Opacity(
          //             child: Container(
          //               padding: EdgeInsets.only(top: 10),
          //               child: Text('21/01/2020', style: TextStyle(fontSize: 15, color: Colors.white70))
          //             ),
          //             opacity: opacityAnimation,
          //           )
          //         ]),
          //     ],
          //   ),
          // ),
          Container(
            //color: Color.fromRGBO(255, 255, 255, 1),
            child: ListViewBoxes(
              onScroll: onScrollListView,
              marginHeader: _heightDistanceTop,
            ),
          )
        ],
      ),
    );
  }
}