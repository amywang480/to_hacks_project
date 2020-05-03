import 'package:flutter/material.dart';

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
  Home home() => new Home();
  Physical physical() => new Physical();
  Mental mental() => new Mental();
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
                  new Tab(
                    text: 'Home',
                    icon: new Icon(Icons.home)),
                  new Tab(
                      text: 'Physical Health',
                      icon: new Icon(Icons.directions_bike)),
                  new Tab(
                      text: 'Mental Health',
                      icon: new Icon(Icons.favorite_border)),
                ]
            )
        ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[home().build(context), physical().build(context), mental().build(context)],
      )
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Text('Fuck')
    );
  }
  int calculateOverall(int ment, int phys){
    int ove = ((ment+phys)/2).round();
    return ove;
  }
}

class Mental extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container();
  }
}

class Physical extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container();
  }
}