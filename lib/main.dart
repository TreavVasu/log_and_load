import 'package:flutter/material.dart';
import 'package:loginpage/Register.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Register.dart';
import 'Workstation.dart';

void main()=>runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return new MaterialApp(
     home: new LoginPage(),
     theme: new ThemeData(
       primarySwatch: Colors.blue,

     ),
   );
  }
}

class LoginPage extends StatefulWidget{
  @override
  State createState()=>new LoginPageState();
  /*State<StatefulWidget> createState() {

  }
  */
}

class LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;
  String prefKey_name="name";
  String tempData ="";
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 300));
    _iconAnimation = new CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.easeOut,
    );
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();

/*
    loadData().then(
            (value){
      controller.text=value;
    },onError: (e){
              print(e.toString());
    });*/

  }

  Future<String> loadData()async{

    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.getString(prefKey_name)??'';
    print("Load Spf Executes");
    return preferences.getString(prefKey_name)??'';
  }
  Future<bool> saveData()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(prefKey_name, controller.text);
    print(":UserName SPfs Working");

  }


  toRegisterPage() {
    Navigator.push(
        context,new MaterialPageRoute(
        builder: (context)=>Register()
    ));
  }
  toWorkstation(){
    Navigator.push(
        context,new MaterialPageRoute(
        builder: (context)=>Workstation()
    ));

  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.blueGrey,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.green, Colors.blue])
        ),
        child: new Stack(


          fit:StackFit.expand,
          children: <Widget>[
            /*new Image(
                image: new AssetImage("assets/floor.png"),
                fit : BoxFit.cover,
                color: Colors.redAccent,
                colorBlendMode: BlendMode.darken,
            ),
            */

            new Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Image(
                  image: new AssetImage("assets/ecelllogo.png"),
                  width:_iconAnimation.value * 170.0,
                  height: _iconAnimation.value * 170.0,
                ),
                new Form(
                  child: new Theme(
                    data: new ThemeData(
                      brightness: Brightness.dark, primarySwatch: Colors.teal,
                      inputDecorationTheme: new InputDecorationTheme(
                        labelStyle: new TextStyle(
                          color: Colors.white,fontSize: 20.0
                        )
                      )
                    ),
                    child: Container(

                      padding: const EdgeInsets.all(60.0),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                           new TextFormField(
                            decoration: new InputDecoration(
                              labelText: "Username",

                            ),
                            keyboardType: TextInputType.emailAddress,
                            controller: controller,
                          ),
                          new TextFormField(
                            decoration: new InputDecoration(
                              labelText: "Password",
                            ),
                            keyboardType: TextInputType.text,
                            obscureText: true,
                          ),
                          new Padding(
                              padding: const EdgeInsets.only(top: 40.0),
                          ),

                          new MaterialButton(
                              height: 40.0,
                              minWidth: 100.0,
                              onPressed: ()=>{
                                saveData(),
                                loadData(),
                              toWorkstation(),
                          },
                              color: Colors.teal,
                              textColor: Colors.white,
                              child: new Text("Login"),
                              //child: new Icon(Icons.arrow_right),
                              splashColor: Colors.redAccent,

                          ),
                          new Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                          ),

                          GestureDetector(
                            onTap: () {
                              print("New Page Directed");
                              toRegisterPage();
                              },

                            child: new Text("New User? Register Here !",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,

                                ),
                              ),
                          ),
                        ],
                      ),
                    ),
                  ),)
              ],
            )
           ],
        ),
      ),
    );
  }

}