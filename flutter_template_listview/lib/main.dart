import 'package:flutter/material.dart';
import 'package:flutter_template_listview/pages/listview-page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Template - ListView',
      home: ListViewPage(),
    );
  }
}