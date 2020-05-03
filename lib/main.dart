import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Home home() => new Home();
Physical physical() => new Physical();
Mental mental() => new Mental();

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
      color: Colors.orange,
      child: Text('Overall Balance: '),
    );
  }
  int calculateOverall(int ment, int phys){
    int ove = ((ment+phys)/2).round();
    return ove;
  }
}

class Mental extends StatelessWidget {
  int hourInput, timesInput, moodInput;
  int currentSleep;
  int currentMood;
  int currentMental;
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        Container(
          color: Colors.orange,
          child: Text("Please enter the number of hours you slept below: "),
        ),
        Container(
          color: Colors.orange,
          child: TextField(onSubmitted: (hourly) {setHourly(int.parse(hourly));},)
          ),
        Container(
          color: Colors.orange,
          child: Text("Please indicate the number of times you got up during the night: "),
        ),
        Container(
          color:Colors.orange,
          child: TextField(onSubmitted: (nightly) {setNightly(int.parse(nightly));},)
        ),
        Container(
          color: Colors.orange,
          child: Text("Please enter your mood on a scale of 0-10: "),
        ),
        Container(
          color:Colors.orange,
          child: TextField(onSubmitted: (moodE) {setMoodE(int.parse(moodE));},)
        ),
        Container(
          color:Colors.orange,
          child: RaisedButton(
              onPressed: () => calculate(),
              child: new Text("Calculate")),
        ),
        Container(
          color:Colors.orange,
          child: _mentalityState().build(context),
        ),
        ],
      );
  }
  void setHourly(int hrs){
    hourInput = hrs;
    print(hourInput);
  }
  void setNightly(int nghtly){
    timesInput = nghtly;
    print(timesInput);
  }
  void setMoodE(int mdE){
    moodInput = mdE;
    print(moodInput);
  }
  int calculateMental(int moody, int sleepy){
    int r = ((moody+sleepy)/2).round();
    return r;
  }
  int calculateMood(int mood){
    int q= 10*(mood);
    return q;
  }
  int calculateSleep(int hours, int timesUp){
    int a, b;
    if((hours/8)>1){
      a=100;
    }
    else{
      a=(100*hours/8).round();
    }
    b = a - 12 * timesUp;
    if(b<0){
      b=0;
    }
    return b;
  }
  void calculate(){
    currentSleep = calculateSleep(hourInput, timesInput);
    currentMood = calculateMood(moodInput);
    currentMental = calculateMental(currentMood, currentSleep);
    print(currentSleep);
    print(currentMood);
    print(currentMental);
  }
}

class mentality extends StatefulWidget {
  _mentalityState createState() => _mentalityState();
}
class _mentalityState extends State<mentality>{
  @override
  Widget build(BuildContext context){
    return new Column(
      children: <Widget>[
        Container(
            color:Colors.orange,
            child: Text("Your Sleep Score out of 100: ")
        ),
        Container(
          color:Colors.orange,
          child: Text(mental().currentSleep.toString()),
        ),
        Container(
            color:Colors.orange,
            child: Text("Your Mood Score out of 100: ")
        ),
        Container(
          color:Colors.orange,
          child: Text(mental().currentMood.toString()),
        ),
        Container(
            color:Colors.orange,
            child: Text("Overall Mental Health Score out of 100: ")
        ),
        Container(
          color:Colors.orange,
          child: Text(mental().currentMental.toString()),
        ),
      ],
    );
  }
}

class Physical extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container();
  }
}