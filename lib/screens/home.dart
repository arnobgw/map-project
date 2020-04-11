import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

Flushbar flush;
bool _wasButtonClicked;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/pic.png"),
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
    );
  }
}
