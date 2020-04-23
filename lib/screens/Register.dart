import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Workstation.dart';

void main() => runApp(new Register());

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new RegisterPage(),
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class RegisterPage extends StatefulWidget {
  @override
  State createState() => new RegisterPageState();
/*State<StatefulWidget> createState() {

  }
  */
}

class RegisterPageState extends State<RegisterPage>
    with SingleTickerProviderStateMixin {
  String data = '';
  String User;
  String Password;
  String College;
  int PhoneNum;
  String prefKey_name = "name";

  TextEditingController controller = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  TextEditingController cfrmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Future<String> loadData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.getString(prefKey_name) ?? '';
    print("Load Spf Executes");
    return preferences.getString(prefKey_name) ?? '';
  }

  var colorLabel = Colors.white;

  Future<bool> saveData() async {
    if (controller.text == '' || controller.text == null) {
      print("E m p t y V a l u e ###");
      setState(() {
        colorLabel = Colors.redAccent;
      });
    } else {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString(prefKey_name, controller.text);
      print(":UserName SPfs Working");
      loadData();
      Navigator.push(
          context, new MaterialPageRoute(builder: (context) => Workstation()));
    }
  }

  var passok = Colors.green;
  bool passhidden = true;

  PassPeek() {
    if (passhidden) {
      passhidden = false;
    } else {
      passhidden = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: Scaffold(
          body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: new Container(
            padding: const EdgeInsets.all(60.0),
            child: new Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 15.0)),
                TextFormField(
                  decoration: new InputDecoration(
                    labelText: "User Name",
                  ),
                  keyboardType: TextInputType.text,
                  controller: controller,
                ),
                Padding(padding: EdgeInsets.only(top: 15.0)),
                TextFormField(
                  decoration: new InputDecoration(
                    labelText: "Email",
                    hintText: "your@email.com",
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                Padding(padding: EdgeInsets.only(top: 15.0)),
                new Text(
                  data,
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 15.0)),
                TextFormField(
                  decoration: new InputDecoration(
                    labelText: "Phone Number",
                    prefixText: "+91-",
                  ),
                  keyboardType: TextInputType.phone,
                ),
                Padding(padding: EdgeInsets.only(top: 15.0)),
                TextFormField(
                  decoration: new InputDecoration(
                    labelText: "College",
                    hintText: "NIT RR",
                  ),
                  keyboardType: TextInputType.text,
                ),
                Padding(padding: EdgeInsets.only(top: 15.0)),
                TextFormField(
                  decoration: new InputDecoration(
                    labelText: "Password :",
                  ),
                  onTap: () {
                    setState(() {
                      PassPeek();
                    });
                  },
                  controller: PasswordController,
                  keyboardType: TextInputType.text,
                  obscureText: passhidden,
                  cursorColor: Colors.green,
                  cursorRadius: Radius.circular(16),
                  cursorWidth: 16,
                ),
                Padding(padding: EdgeInsets.only(top: 15.0)),
                TextFormField(
                  decoration: new InputDecoration(
                    labelText: "Confirm Password",
                    hintText: "confirm",
                  ),
                  onTap: () {
                    setState(() {
                      PassPeek();
                    });
                  },
                  controller: cfrmPasswordController,
                  keyboardType: TextInputType.text,
                  obscureText: passhidden,
                  cursorColor: Colors.redAccent,
                  cursorRadius: Radius.circular(16),
                  cursorWidth: 16,
                ),
                Padding(padding: EdgeInsets.only(top: 15.0)),
                new MaterialButton(
                  height: 40.0,
                  minWidth: 100.0,
                  color: passok,
                  textColor: Colors.white70,
                  child: new Text("Submit and Load"),
                  //child: new Icon(Icons.arrow_right),
                  splashColor: Colors.black54,
                  onPressed: () {
                    if (PasswordController.text !=
                        cfrmPasswordController.text) {
                      setState(() {
                        passok = Colors.red;
                      });
                    } else {
                      saveData(); //Here
                    }
                  },
                )
              ],
            )),
      )),
    );
  }
}
