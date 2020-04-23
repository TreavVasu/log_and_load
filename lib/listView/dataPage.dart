import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'DisplayData.dart';
import '../data/post_api_service.dart';
void main() => runApp(new dataPage());

class dataPage extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Provider(
      create:(_) => PostApiService.create(),
      dispose: (_,PostApiService service) => service.client.dispose(),
      child:new MaterialApp(
        home: new DisplayData(),
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
      ) ,
    );
  }
}

