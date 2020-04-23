import 'dart:io';
import 'dart:ui';
import 'package:loginpage/listView/dataPage.dart';
import 'package:loginpage/screens/getConnect.dart';

import '../data/post_api_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(new Workstation());
  }
var colorTexts=Colors.white70;
String prefKey_name = "name";
String data= "Guest";
int chalaki=0;
Future<String> getUserData() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  print("Future Output Spf");
  data=preferences.getString(prefKey_name);
  if(data!=null || data!="Guest") {
    print(data);
    //data=changeText().toString();
    return preferences.getString(prefKey_name);
  }else{
    print("Failed");
  }
  }

changeText() {
  getUserData().then((val) {
    data = val;
    return data;
    print("SharedPref Working !");
  }, onError: (e) {
    data = "Error";
  });
}

anotherExploit(){
  if(chalaki==0){
    chalaki++;
  }else{
    colorTexts=Colors.black54;
  }
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

  TextEditingController controller = TextEditingController();

  void initState() {
    super.initState();
  }

  var textforSPF='';

  toDataPage(){
    Navigator.push(
        context, new MaterialPageRoute(
        builder: (context) => dataPage(),
    )
    );
  }

  toGetConnceted(){
    Navigator.push(
        context, new MaterialPageRoute(
        builder: (context) => getConnect(),
    )
    );
  }


  chkInternet()async{
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        toDataPage();
      }
    } on SocketException catch (_) {
      print('not connected');
      toGetConnceted();
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,

      body: Container(
        //color: Colors.blueGrey,
        alignment: Alignment.center,

        child: Container(

          child: Welcomwidgets(),
        ),
      ),
    )

    ;
  }

  Welcomwidgets() {

    return Column(

      children: <Widget>[
        Padding(padding: EdgeInsets.only(top: 200)),

        Text(textforSPF,style: TextStyle(fontSize: 32,color: colorTexts,),
        ),

        FlatButton(
            onPressed:(){
              changeText();
              setState(() {
                changeText();
                anotherExploit();
                textforSPF="Hi,"+data;
              });
            }, child: Text("Knock knock")
        ),

        Text("Tap the logo to begin\n;)",
          style: TextStyle(
            fontSize: 32,
            color: colorTexts,
            wordSpacing: 2,
          ),textAlign: TextAlign.center,),

        Padding(padding: EdgeInsets.only(top: 20)),

        GestureDetector(
            child: new Column(

              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 40)),

                Image(image: AssetImage("assets/ecellblack.png"),
                  width:250 ,
                  height: 250,
                ),


              ],
            ),
            onTap: () {
              Text("Hi"+changeText().toString());

              chkInternet();

}),
      ],
    );

  }



















  }


/*
            child: new Stack(
              fit: StackFit.expand,
              children: <Widget>[
                new Column(
                  children: <Widget>[
*/

/*
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.green, Colors.blue])),
                    */


/*Padding(
                      padding: EdgeInsets.only(top: 160.0),
                    ),
                    new Text(
                      "\t Hi, "+data,
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


           */