import 'dart:convert';

import 'package:api_demo/model/post_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../constants/app_urls.dart';
import '../service/post_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PostModel> samplePosts = [];
  var isLoaded = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    // await posts
  }
  @override
  Widget build(BuildContext context) {
    List<PostModel> _postmodel = [];
    return Scaffold(
      appBar: AppBar(title: Text("Baap")),
      body: FutureBuilder(
          future: getPosts(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(

                  // itemCount: postModelFromJson(posts.length),
                  itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: 200,
                      color: Colors.grey,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Center(
                            //   child: Container(
                            //     height: 65,
                            //     width: 65,
                            //     decoration: BoxDecoration(
                            //         borderRadius: BorderRadius.circular(100),
                            //         // color: Colors.black,
                            //         image:
                            //             DecorationImage(image: NetworkImage(''))),
                            //   ),
                            // ),
                            // SizedBox(
                            //   width: 20,
                            // ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  overflow: TextOverflow
                                      .visible, // or TextOverflow.ellipsis
                                  softWrap: true,
                                  'User Id:${samplePosts[index].id} ',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'Id:${samplePosts[index].userId}',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  overflow: TextOverflow
                                      .visible, // or TextOverflow.ellipsis
                                  softWrap: true,
                                  'Title:${samplePosts[index].title}',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  overflow: TextOverflow
                                      .visible, // or TextOverflow.ellipsis
                                  softWrap: true,
                                  'Body:${samplePosts[index].body}',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            )
                          ],
                        ),
                      )),
                );
              });
            } else {
              return Center(
                child: CircularProgressIndicator() ?? Text("no data found"),
              );
            }
          })),
    );
  }

  Future<List<PostModel>> getPosts() async {
    final response = await http.get(Uri.parse(AppUrls.Post));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        samplePosts.add(PostModel.fromJson(index));
      }
      return samplePosts;
    } else {
      return samplePosts;
    }
  }
}
