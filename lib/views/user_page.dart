import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import '../constants/app_urls.dart';
import '../model/post_model.dart';
import '../model/user_model.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  List<UserModel> sampleusers = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Baap")),
      body: FutureBuilder(
          future: getPosts(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(

                  itemCount:10,
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
                                  'User Id:${sampleusers[index].id} ',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'name:${sampleusers[index].name}',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  overflow: TextOverflow
                                      .visible, // or TextOverflow.ellipsis
                                  softWrap: true,
                                  'usename:${sampleusers[index].username}',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  overflow: TextOverflow
                                      .visible, // or TextOverflow.ellipsis
                                  softWrap: true,
                                  'email:${sampleusers[index].email}',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  overflow: TextOverflow
                                      .visible, // or TextOverflow.ellipsis
                                  softWrap: true,
                                  'address:${sampleusers[index].address.city.toString()},${sampleusers[index].address.street.toString()},${sampleusers[index].address.city.toString()},${sampleusers[index].address.zipcode.toString()},\n${sampleusers[index].address.geo.lat.toString()},\n${sampleusers[index].address.geo.lng.toString()}',
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

  Future<List<UserModel>> getPosts() async {
    final response = await http.get(Uri.parse(AppUrls.Users));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        sampleusers.add(UserModel.fromJson(index));
      }
      return sampleusers;
    } else {
      return sampleusers;
    }
  }
}
