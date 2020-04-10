import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flushbar/flushbar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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

class _MyHomePageState extends State<MyHomePage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final passwordField = TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          navigateToSubPage2(context);
        },
        child: Text("Sign In",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final SignUp = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xf29481),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {},
        child: Text("Sign Up",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/pic.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(36.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 100.0,
            ),
            SizedBox(height: 45.0),
            emailField,
            SizedBox(height: 25.0),
            passwordField,
            SizedBox(
              height: 35.0,
            ),
            loginButon,
            SizedBox(
              height: 15.0,
            ),
            new InkWell(
                child: new Text('"Dont have a account ?" Sign Up here'),
                onTap: () => {}),
          ],
        ),
      ),
    );
  }

  Future navigateToSubPage2(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SubPage()));
  }
}

Flushbar flush;
bool _wasButtonClicked;

class SubPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Re-Life'),
        backgroundColor: Colors.redAccent,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(
              Icons.favorite,
            ),
            title: new Text('Journal'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('Profile'))
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/pic.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: RaisedButton(
            child: Text(
              "Update",
              textAlign: TextAlign.center,
            ),
            onPressed: () {
              flush = Flushbar<bool>(
                flushbarPosition: FlushbarPosition.TOP,
                title: "Hey User",
                message: "Have you added today's journal ?",
                icon: Icon(
                  Icons.info_outline,
                  color: Colors.blue,
                ),
                mainButton: FlatButton(
                  onPressed: () {
                    flush.dismiss(true); // result = true
                  },
                  child: Text(
                    "ADD",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ) // <bool> is the type of the result passed to dismiss() and collected by show().then((result){})
                ..show(context).then((result) {
                  {
                    // setState() is optional here
                    _wasButtonClicked = result;
                  }
                  ;
                });
            },
          ),
        ),
      ),
      drawer: RaisedButton(
          child: Text(
            "log out",
            textAlign: TextAlign.center,
          ),
          onPressed: () {
            navigateToSubPage2(context);
          }),
    );
  }

  Future navigateToSubPage2(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MyHomePage()));
  }
}
