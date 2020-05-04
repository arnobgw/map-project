import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flushbar/flushbar.dart';
import 'package:map_project/screens/financial.dart';
import 'package:map_project/screens/home.dart';
import 'package:map_project/screens/settings.dart';
import 'package:map_project/screens/signup.dart';
import 'package:map_project/screens/Journal.dart';
import 'package:map_project/screens/todo.dart';

class Journal extends StatefulWidget {
  @override
  _JournalState createState() => _JournalState();
}

class _JournalState extends State<Journal> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter login UI',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'RE-LIFE Login'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.
  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

@override
class _MyHomePageState extends State<MyHomePage> {
  String value = "";
  double pi = 3.1416;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/stars.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/book.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: TextField(
                  textAlign: TextAlign.center,
                  maxLines: 30,
                ),
                width: 300,
                height: 400,
                alignment: Alignment.center,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    MaterialButton(
                      child: Text(
                        '🙁',
                        style: TextStyle(fontSize: 50.0),
                      ),
                      onPressed: () => null,
                      height: 100.0,
                    ),
                    MaterialButton(
                        child: Text(
                          '😐',
                          style: TextStyle(fontSize: 50.0),
                        ),
                        onPressed: () => null),
                    MaterialButton(
                        child: Text(
                          '😄',
                          style: TextStyle(fontSize: 50.0),
                        ),
                        onPressed: () => null),
                  ],
                ),
                alignment: Alignment.center,
              ),
              Container(
                padding: EdgeInsets.all(1),
                decoration: BoxDecoration(
                  color: Colors.green,
                  boxShadow: null,
                  border: Border.all(
                    color: Colors.green,
                    width: 10,
                  ),
                  borderRadius: BorderRadius.circular(0),
                ),
                child: MaterialButton(
                    child: Text(
                      'Save Your Journal',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    onPressed: () => null),
                width: 500,
                height: 50,
                alignment: Alignment.center,
              ),
            ],
          )),
    );
  }
}
