import 'dart:ui';
import 'package:loginpage/dataPage.dart';

import 'data/post_api_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(new Workstation());
  getUserData();
}

String prefKey_name = "name";

Future<String> getUserData() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  print("Future Output Spf");
  return preferences.getString(prefKey_name);
}

class Workstation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new WorkingPlace(),
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class WorkingPlace extends StatefulWidget {
  @override
  State createState() => new Work();
}

class Work extends State<WorkingPlace> {
  String data = 'User';

  TextEditingController controller = TextEditingController();

  void initState() {
    super.initState();
  }

  changeText() {
    getUserData().then((val) {
      data = val;
      print("SharedPref Working !");
    }, onError: (e) {
      data = "Error";
      print(data + "=" + "Error");
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.blueGrey,
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.green, Colors.blue])),
            child: new Stack(
              fit: StackFit.expand,
              children: <Widget>[
                new Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 160.0),
                    ),
                    new Text(
                      data,
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                    new MaterialButton(
                        height: 40.0,
                        minWidth: 100.0,
                        color: Colors.teal,
                        textColor: Colors.white,
                        child: new Text("Get Value"),
                        //child: new Icon(Icons.arrow_right),
                        splashColor: Colors.redAccent,
                        onPressed: () {
                          setState(() {
                            changeText();
                          });
                        }),
                    new MaterialButton(
                        height: 40.0,
                        minWidth: 100.0,
                        color: Colors.teal,
                        textColor: Colors.white,
                        child: new Text("LogOut"),
                        //child: new Icon(Icons.arrow_right),
                        splashColor: Colors.redAccent,
                        onPressed: () {
                          Navigator.push(
                              context,new MaterialPageRoute(
                              builder: (context)=>dataPage()
                          ));

                        }
                          ),

                        ]),
                  ],
                )

            ));
  }
}
