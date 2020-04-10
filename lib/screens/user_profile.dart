import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new MyProfile(),
    );
  }
}

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  String user = 'Lisa';
  double expense = 1553;
  Icon actionIcon = new Icon(Icons.settings);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(150.0),
          child: AppBar(
            backgroundColor: Colors.orange[900],
            title: Row(
              children: <Widget>[
                Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40.0)),
                    color: Colors.black,
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://pbs.twimg.com/profile_images/1036730403514736650/PCRxFiEt_400x400.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: 50.0,
                  child: Text('  $user'),
                ),
              ],
            ),
            actions: <Widget>[
              new IconButton(
                icon: actionIcon,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Setting()),
                  );
                },
              ),
            ],
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  text: 'My Mood',
                  icon: Icon(Icons.mood),
                ),
                Tab(
                  text: 'My Finance',
                  icon: Icon(Icons.monetization_on),
                ),
                Tab(
                  text: 'Notifications',
                  icon: Icon(Icons.new_releases),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(children: [
          Container(
            child: Image.network('https://i.imgflip.com/2560zv.png'),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Image.network(
                    'https://i2.wp.com/www.savespendsplurge.com/wp-content/uploads/How-much-to-save-household-budget-pie-chart-percentages-general-600x360.png?resize=600%2C360'),
                Text('Your total expenditure for the month was: RM$expense'),
              ],
            ),
          ),
          Container(
            child: Center(child: Text('Your Notifications are Empty')),
          ),
        ]),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 1,
          backgroundColor: Colors.orange[900],
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              title: Text('Messages'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Friends'),
            ),
          ],
        ),
      ),
    );
  }
}

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

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[900],
        centerTitle: true,
        title: Text('Edit Profile'),
      ),
      body: Column(children: <Widget>[
        Container(
          child: Image.network(
              'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
        ),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Username',
          ),
        ),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Password',
          ),
        ),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Email',
          ),
        ),
        FlatButton(
          color: Colors.orange[900],
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyProfile()),
            );
          },
          child: Text('Save'),
        ),
      ]),
    );
  }
}
