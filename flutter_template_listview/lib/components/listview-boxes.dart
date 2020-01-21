import 'package:flutter/material.dart';

class ListViewBoxes extends StatefulWidget {

  Function(double) onScroll;
  double marginHeader = 0;

  ListViewBoxes({
    this.onScroll,
    this.marginHeader
  });

  @override
  _ListViewBoxesState createState() => _ListViewBoxesState(
    onScroll: this.onScroll,
    marginHeader: this.marginHeader - 20
  );
}

class _ListViewBoxesState extends State<ListViewBoxes> {

  Function(double) onScroll;
  double marginHeader;

  ScrollController _scrolListViewController = new ScrollController();
  final List<String> _boxes = <String>['A', 'B', 'C', 'D', 'E', 'F'];

  _ListViewBoxesState({
    this.onScroll,
    this.marginHeader
  });

  @override
  void initState() {
    _scrolListViewController.addListener((){
      this.onScroll(_scrolListViewController.offset);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrolListViewController,
      padding: const EdgeInsets.all(5),
      itemCount: _boxes.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 100,
          margin: EdgeInsets.only(
            top: index == 0 ? this.marginHeader : 20,
            bottom: index == (_boxes.length - 1) ? 0 : 20,
            left: 20,
            right: 20
          ),
          color: Colors.amber[300],
          child: Center(
            child: Text('${_boxes[index]}')
          ),
        );
      },
    ); 
  }
}