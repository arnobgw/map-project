import 'package:flutter/material.dart';
import 'package:map_project/screens/user_profile.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange[900],
          centerTitle: true,
          title: Text('Settings'),
        ),
        body: ListView(children: <Widget>[
          Card(
            child: ListTile(
              leading: Icon(Icons.edit),
              title: Text('Edit Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfile()),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.photo_camera),
              title: Text('Edit Profile Picture'),
              onTap: () {},
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.receipt),
              title: Text('View Tutorial'),
              enabled: false,
              onTap: () {},
            ),
          ),
        ]));
  }
}