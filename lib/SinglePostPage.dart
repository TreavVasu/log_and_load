import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:chopper/chopper.dart';
import 'package:provider/provider.dart';
import 'data/post_api_service.dart';

class SinglePostPage extends StatelessWidget {
  final int postId;

  const SinglePostPage({
    Key key,
    this.postId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: FutureBuilder<Response>(
          future: Provider.of<PostApiService>(context).getPost(postId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              final Map post = json.decode(snapshot.data.bodyString);
              return _buildPost(post);
            } else {
              return Center(
               child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  Padding _buildPost(Map post) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[



          SizedBox(
            height: 400,
            width: 400,
            child: Image.network(
              post['url'],
            ),
          ),
      Hero(
        tag: post['title'],
        transitionOnUserGestures: true,
        child:Text(
            post['title'],
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),

      ),
        ],
      ),
    );
  }
}
