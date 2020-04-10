import 'package:flutter/material.dart';
import 'package:loginpage/Register.dart';

import 'Register.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Colors.greenAccent,
      body: new Stack(
        fit:StackFit.expand,
        children: <Widget>[
          new Image(
              image: new AssetImage("assets/floor.png"),
              fit : BoxFit.cover,
              color: Colors.black54,
              colorBlendMode: BlendMode.darken,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new FlutterLogo(
                size:_iconAnimation.value * 140.0,
              ),
              new Form(
                child: new Theme(
                  data: new ThemeData(
                    brightness: Brightness.dark, primarySwatch: Colors.teal,
                    inputDecorationTheme: new InputDecorationTheme(
                      labelStyle: new TextStyle(
                        color: Colors.teal,fontSize: 20.0
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
                            labelText: "Enter Email",

                          ),
                          keyboardType: TextInputType.emailAddress,
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
                            onPressed: ()=>{},
                            color: Colors.teal,
                            textColor: Colors.white,
                            child: new Text("Login"),
                            //child: new Icon(Icons.arrow_right),
                            splashColor: Colors.redAccent,

                        ),
                        GestureDetector(
                          onTap: () {
                            print("New Page Directed");
                            Navigator.push(
                                context,new MaterialPageRoute(
                                builder: (context)=>Register()
                            ));
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
    );
  }
}