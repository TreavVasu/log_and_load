import 'dart:core';
import 'dart:core';
import 'dart:core';
import 'dart:core';
import 'dart:core';

import 'package:meta/dart2js.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main()=>runApp(new Register());

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

class RegisterPage extends StatefulWidget{
  @override
  State createState()=>new RegisterPageState();
/*State<StatefulWidget> createState() {

  }
  */
}

class RegisterPageState extends State<RegisterPage>
    with SingleTickerProviderStateMixin {


  String data='';
  String User;
  String Password;
  String College;
  int PhoneNum;

  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: DefaultTabController(

          length: 3,

          child: Scaffold(

            bottomNavigationBar:
            TabBar(

              unselectedLabelColor: Colors.teal,
              indicatorPadding: EdgeInsets.only(left: 30,right: 30),
              indicator: ShapeDecoration(
                color: Colors.redAccent,
                shape: BeveledRectangleBorder(

                 //borderRadius: BorderRadius.circular(5.0),
                  side: BorderSide(
                    color: Colors.redAccent,
                  )
                )
              ),
              tabs: <Widget>[
                Tab(text: "1",),
                Tab(text: "2",),
                Tab(text: "3",)
              ],
            ) ,
            body: Stack(


              children: <Widget>[
                new TabBarView(
                  //physics: NeverScrollableScrollPhysics(),

                    children:[
                      new Container(
                          padding: const EdgeInsets.all(60.0),
                          child:new Column(
                            children: <Widget>[

                              Padding(padding: EdgeInsets.only(top:150.0)),
                              TextFormField(
                                decoration: new InputDecoration(
                                  labelText: "User Name",
                                ),
                                keyboardType: TextInputType.text,
                              ),
                              Padding(padding: EdgeInsets.only(top:15.0)),

                              TextFormField(
                                decoration: new InputDecoration(
                                  labelText: "Email",
                                  hintText: "your@email.com",
                                ),
                                keyboardType: TextInputType.emailAddress,
                              ),

                              Padding(padding: EdgeInsets.only(top:15.0)),
                              new Text(data,
                              style:TextStyle(
                                fontSize: 20.0,

                              ),),
                              Padding(padding: EdgeInsets.only(top:15.0)),

                              new MaterialButton(
                                height: 40.0,
                                minWidth: 100.0,
                                color: Colors.teal,
                                textColor: Colors.white,
                                child: new Text("Submit and Load"),
                                //child: new Icon(Icons.arrow_right),
                                splashColor: Colors.redAccent,
                                onPressed:(){
            //Here
                                },
                              )
                            ],
                          )
                      ),
                      new Container(
                          padding: const EdgeInsets.all(60.0),
                          child:new Column(
                            children: <Widget>[
                              TextFormField(
                                decoration: new InputDecoration(
                                  labelText: "Phone Number",
                                  prefixText: "+91-",
                                ),
                                keyboardType: TextInputType.phone,

                              ),
                              TextFormField(
                                decoration: new InputDecoration(
                                  labelText: "College",
                                  hintText: "NIT RR",
                                ),
                                keyboardType: TextInputType.text,
                              ),

                            ],
                          )
                      ),
                      new Container(
                          padding: const EdgeInsets.all(60.0),
                          child:new Column(
                            children: <Widget>[
                              TextFormField(
                                decoration: new InputDecoration(
                                  labelText: "Password :",
                                ),
                                keyboardType: TextInputType.text,
                                obscureText: true,
                              ),
                              TextFormField(
                                decoration: new InputDecoration(
                                  labelText: "Confirm Password",
                                  hintText: "confirm",
                                ),
                                keyboardType: TextInputType.text,
                                obscureText: true,
                              ),

                            ],
                          )
                      ),
                    ]),

              ],
            )
      ),
    )
    );
  }


  void LoadValue() {
  }
}