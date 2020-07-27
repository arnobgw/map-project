import 'package:flutter/material.dart';
import 'package:map_project/Models/user_model.dart';
import 'package:map_project/services/user_data_service.dart';

class MyProfile extends StatefulWidget {
  MyProfile({Key key}) : super(key: key);
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

class EditProfile extends StatefulWidget {
  final User user;
  EditProfile(this.user);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final userEmail = TextEditingController();
  final userPassword = TextEditingController();
  final userName = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    userEmail.text = widget.user.email;
    userName.text = widget.user.name;
    userPassword.text = widget.user.password;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[900],
        centerTitle: true,
        title: Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: <Widget>[
          Container(
            child: Image.asset("assets/images/profile.png"),
          ),
          TextField(
            controller: userName,
            obscureText: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Username',
            ),
          ),
          TextField(            
            controller: userPassword,
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
          ),
          TextField(
            controller: userEmail,
            obscureText: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email',
            ),
          ),
          FlatButton(
            color: Colors.orange[900],
            onPressed: () async {
              User user = widget.user;
              user.name = userName.text;
              user.email = userEmail.text;
              user.password = userPassword.text;

              await dataService.updateUser(id: user.id, user: user);
              Navigator.pop(context);
            },
            child: Text('Save'),
          ),
        ]),
      ),
    );
  }
}

final dataService = UserDataService();