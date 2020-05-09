import 'package:flutter/material.dart';

class Journal extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Journal> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'RE-LIFE Login'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

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
      body: Center(
          child: SizedBox.expand(
        child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bac.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Text(
                  'Write Your Story',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
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
      )),
    );
  }
}