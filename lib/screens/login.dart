import 'package:flutter/material.dart';

import 'package:flushbar/flushbar.dart';
import 'package:map_project/screens/signup.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
            InkWell(
              child: new Text('"Dont have a account ?" Sign Up here'),
              onTap:  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SigningUp()),
                );
              },
            ),
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
    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  }
}
