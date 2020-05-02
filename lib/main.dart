import 'package:flutter/material.dart';
import './HomeTab.dart' as first;
import './PhysicalTab.dart' as second;
import './MentalTab.dart' as third;

void main() {
  runApp(new MaterialApp(
      home: new MyTabs()
  ));
}

class MyTabs extends StatefulWidget {
  @override
  MyTabsState createState() => new MyTabsState();
}

class MyTabsState extends State<MyTabs> with SingleTickerProviderStateMixin {


  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            title: new Text("eHealth"),
            centerTitle: true,
            backgroundColor: Colors.blue,
            bottom: new TabBar(
                controller: controller,
                tabs: <Tab>[
                  new Tab(icon: new Icon(Icons.home), text: 'Home'),
                  new Tab(icon: new Icon(Icons.directions_bike), text: 'Physical Health'),
                  new Tab(icon: new Icon(Icons.favorite_border), text: 'Mental Health'),
                ]
            )
        ),
    );
  }
}