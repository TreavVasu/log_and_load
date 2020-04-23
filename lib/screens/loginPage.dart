


import 'package:flutter/material.dart';
import 'package:loginpage/screens/Register.dart';
import 'package:loginpage/screens/Workstation.dart';
import 'package:loginpage/screens/anim/AnimationBuilder.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  bool nolookPassword=true;
  TextEditingController controller = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  showPwd(){
    setState(() {
      if(nolookPassword){
        nolookPassword=false;
      }else{
        nolookPassword=true;
      }

      });
      }


  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 800));
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
  var colorLabel=Colors.white;
  var colorLogin=Colors.teal;
  Future<bool> saveData()async{
    if(controller.text=='' || controller.text==null){
      print("E m p t y V a l u e ###");
      setState(() {
        colorLabel=Colors.redAccent;
        colorLogin=Colors.red;
      });

    }
    else {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString(prefKey_name, controller.text);
      print(":UserName SPfs Working");
      loadData();
      toWorkstation();

    }
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
        builder: (context)=>AnimationPage(),//Workstation()
    ));

  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.blueGrey,
      bottomNavigationBar:
          SizedBox(
            width: double.infinity,
            child: MaterialButton(
              onPressed: ()=>{
                saveData(),
              },
              color: colorLogin,
              textColor: Colors.black,
              child: new Text("Login"),
              //child: new Icon(Icons.arrow_right),
              splashColor: Colors.redAccent,

              height: 50,
            ),

          ),

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
                  width:_iconAnimation.value * 180.0,
                  height: _iconAnimation.value * 180.0,

                ),
                new Form(
                  child: new Theme(
                    data: new ThemeData(
                        brightness: Brightness.dark,
                        primarySwatch: Colors.teal,
                        inputDecorationTheme: new InputDecorationTheme(
                            labelStyle: new TextStyle(
                                color: colorLabel,fontSize: 20.0
                            )
                        )
                    ),
                    child: Container(

                      padding: const EdgeInsets.fromLTRB(60,10,60,60),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                         // Padding(padding: EdgeInsets.only(top: 45)),
                          new TextFormField(
                            decoration: new InputDecoration(
                              labelText: "Username",
                                icon: const Padding(
                                  padding: const EdgeInsets.only(top: 15.0),
                                  child: const Icon(Icons.contacts),
                                )
                            ),
                            keyboardType: TextInputType.emailAddress,
                            controller: controller,
                          ),
                          Padding(padding: EdgeInsets.only(top: 5)),
                          new TextFormField(
                            decoration: const InputDecoration(
                                labelText: 'Password',
                                icon: const Padding(
                                  padding: const EdgeInsets.only(top: 15.0),
                                  child: const Icon(Icons.lock),
                                )),
                            cursorColor: Colors.redAccent,
                            cursorRadius: Radius.circular(16),
                            cursorWidth: 16,
                            keyboardType: TextInputType.text,
                            obscureText: nolookPassword,
                            controller: passwordController,
                            onTap: (){showPwd();},
                          ),
                          new Padding(
                            padding: const EdgeInsets.only(top: 40.0),
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