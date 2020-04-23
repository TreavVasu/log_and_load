import 'package:flutter/material.dart';

void main() => runApp(getConnect());

class getConnect extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(":("),
      ),
      body: Container(
        padding: EdgeInsets.all(100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            Padding(padding: EdgeInsets.all(50)),
            Icon(Icons.network_locked,size: 100,),
            Text("You need Internet to continue\n :<)",textAlign: TextAlign.center,
            style: TextStyle(fontSize: 32),),
          ],
        ),
      )
    );
  }

}
