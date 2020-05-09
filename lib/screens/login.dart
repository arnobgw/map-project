import 'package:flutter/material.dart';
import 'package:map_project/Models/mock_Data.dart';
import 'package:map_project/screens/Dashboard.dart';
import 'package:flushbar/flushbar.dart';
import 'package:map_project/screens/home.dart';
import 'package:map_project/screens/settings.dart';
import 'package:map_project/screens/signup.dart';
import 'package:map_project/screens/Journal.dart';
import 'package:map_project/screens/todo.dart';

Flushbar flush;
bool _wasButtonClicked;

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
              onTap: () {
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
    Navigator.push(context, MaterialPageRoute(builder: (context) => AfterSplash()));
  }
}

class SubPage extends StatefulWidget {
  @override
  _SubPageState createState() => _SubPageState();
}

class _SubPageState extends State<SubPage> {
  int _currentIndex = 0;

  final List<Widget> _children = [Home(mockData), Dashboard(), Journal()];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Re-Life'),
        backgroundColor: Colors.redAccent,
        actions: <Widget>[
          IconButton(
            color: Colors.white,
            icon: Icon(Icons.list),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => TodoList()));
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            title: Text('Financial'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(
              Icons.favorite,
            ),
            title: new Text('Journal'),
          ),
        ],
      ),
      body: _children[_currentIndex],
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("User"),
              accountEmail: Text("user1@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                        ? Colors.blue
                        : Colors.white,
                child: Text(
                  "A",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              title: Text("Settings"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Setting()));
              },
            ),
            ListTile(
                title: Text("Log out"),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  navigateToSubPage2(context);
                }),
            ListTile(
              title: Text(
                "Push Notification",
              ),
              trailing: Icon(Icons.arrow_downward),
              onTap: () {
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
                  });
              },
            ),
          ],
        ),
      ),
    );
  }

  Future navigateToSubPage2(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  }
}

Future navigateToSubPage3(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => SubPage()));
}

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
            alignment: Alignment.center,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              new Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.white,
                    width: 20,
                  ),
                ),
                child: Column(children: [
                  new Image.asset(
                    'assets/images/fin.png',
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: 90.0,
                  ),
                  Text(
                    "Have a big picture view of your finance",
                    style: new TextStyle(
                        fontWeight: FontWeight.normal, fontSize: 15.0),
                  ),
                  Text(
                    "Your financian records are tracked and monitorized to give you a big picture of what us going on in your waller ",
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                        fontWeight: FontWeight.normal, fontSize: 10.0),
                  ),
                ]),
              ),
              new Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.white,
                      width: 20,
                    ),
                  ),
                  child: Column(children: [
                    new Image.asset(
                      'assets/images/journal.png',
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: 90.0,
                    ),
                    new Text(
                      "Write pieces of your life , Everyday",
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 15.0),
                    ),
                    new Text(
                      "Have brief moment to reflect your feelings and write it down , so that you can always get back to things that inspire you",
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 10.0),
                    ),
                  ])),
              new Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.white,
                      width: 20,
                    ),
                  ),
                  child: Column(children: [
                    new Image.asset(
                      'assets/images/Reminder.png',
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: 90.0,
                    ),
                    new Text(
                      "Control your day, Task by task",
                      style: new TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 15.0),
                    ),
                    new Text(
                      "All of your tasks has important value to you , remember your task in a minimal way with keeping only tasks in focus                                        ",
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 10.0),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    MaterialButton(
                        color: Colors.red,
                        splashColor: Colors.blueAccent,
                        shape: StadiumBorder(),
                        clipBehavior: Clip.antiAlias,
                        child: Text("Get Started"),
                        textColor: Colors.white,
                        onPressed: () {
                          navigateToSubPage3(context);
                        },
                        height: MediaQuery.of(context).size.height * 0.1,
                        minWidth: 500,
                        padding: EdgeInsets.all(20.0)),
                  ])),
            ])));
  }
}
