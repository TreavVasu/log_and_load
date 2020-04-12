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
  String prefKey_name="name";


  TextEditingController controller = TextEditingController();


  @override
  void initState() {
    super.initState();
  }

  Future<String> loadData()async{

    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.getString(prefKey_name)??'';
    print("Load Spf Executes");
    return preferences.getString(prefKey_name)??'';
  }
  var colorLabel=Colors.white;
  Future<bool> saveData()async{
    if(controller.text=='' || controller.text==null){
      print("E m p t y V a l u e ###");
      setState(() {
        colorLabel=Colors.redAccent;

      });

    }
    else {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString(prefKey_name, controller.text);
      print(":UserName SPfs Working");
      loadData();
      Navigator.push(
          context, new MaterialPageRoute(
          builder: (context) => Workstation()
      )
      );
    }
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: Stack(children: <Widget>[
                new Container(
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
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                        Padding(padding: EdgeInsets.only(top: 15.0)),
                        TextFormField(
                          decoration: new InputDecoration(
                            labelText: "Confirm Password",
                            hintText: "confirm",
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                        Padding(padding: EdgeInsets.only(top: 15.0)),
                        new MaterialButton(
                          height: 40.0,
                          minWidth: 100.0,
                          color: Colors.teal,
                          textColor: Colors.white,
                          child: new Text("Submit and Load"),
                          //child: new Icon(Icons.arrow_right),
                          splashColor: Colors.redAccent,
                          onPressed: () {
                              saveData(); //Here
                          },
                        )
                      ],
                    )),
              ])),
        ));
  }
}
