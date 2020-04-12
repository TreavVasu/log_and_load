import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:chopper/chopper.dart';
import 'package:provider/provider.dart';
import 'data/post_api_service.dart';
import 'SinglePostPage.dart';

class DisplayData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("List of BlaBlas"),
      ),
      body: _buildBody(context),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () async {
            /*final response = await Provider.of<PostApiService>(context)
                .postPost({'key':'value'});

            print(""+response.body);
            */
            print(
                "Kya MAtlab Isko DDDabaaaaaaaaaaaaaaaaaaaaaaane kaaaaaaaaaaaaaaaaa ");
          }),
    );
  }
}

FutureBuilder<Response> _buildBody(BuildContext context) {
  return FutureBuilder<Response>(
      future: Provider.of<PostApiService>(context).getPosts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final List posts = json.decode(snapshot.data.bodyString);
          return _buildPosts(context, posts);
        } else {
          return Center(
           child: CircularProgressIndicator(),
          );
        }
      });
}

ListView _buildPosts(BuildContext context, List posts) {
  return ListView.builder(
    itemCount: posts.length,
    padding: EdgeInsets.all(8),
    itemBuilder: (context, index) {
      return  Card(
        elevation: 4,
        child: ListTile(

          title:  Hero(
          tag: posts[index]['title'],
            transitionOnUserGestures: true,
            child:Text(
            posts[index]['title'],
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),


          ),

          ),

          leading:Image.network(
            posts[index]['thumbnailUrl'],
          ),

          onTap: () => _navigateToPost(context, posts[index]['id']),

        )
      );

    },
  );
}

void _navigateToPost(BuildContext context, int id) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => SinglePostPage(postId: id),
    ),
  );
}
