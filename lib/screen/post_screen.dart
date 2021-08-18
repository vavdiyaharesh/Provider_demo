import 'package:api_with_provider/provider_data/post_data.dart';
import 'package:api_with_provider/screen/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:api_with_provider/const.dart';

class PostScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  PostData postData = PostData();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PostData>.value(
        value: postData,
        child: Consumer<PostData>(
          builder: (context, postData, child) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Post Data'),
              ),
              body: Container(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [

                          Container(
                            width: double.infinity,
                            child: customTextField(
                                labelText: 'name',
                                hintText: 'name',
                                onChanged: (value) {
                                  print(value);
                                  postData.setName(value);
                                }),
                          ),
                          Container(
                            width: double.infinity,
                            child: customTextField(
                                labelText: 'job',
                                hintText: 'job',
                                onChanged: (value) {
                                  print(value);
                                  postData.setJOb(value);
                                }),
                          ),
                          ElevatedButton(
                            child: Text('Post'),
                            onPressed: () {
                              postData.postUser();
                              print(postData.name);
                            },
                          ),
                          ElevatedButton(
                            child: Text('Go for Register'),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterScreen()));
                            },
                          ),
                          Column(
                            children: [
                              if (postData.responseModel != null) ...[
                                Text('Response Data',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                                Text('name:-  ${postData.name}' ?? 'wait'),
                                Text('job:-  ${postData.job}' ?? 'wait'),
                                Text('response id:-  ${postData.responseModel.id}' ?? 'wait'),
                                Text('created at:- ${postData.responseModel.createdAt.toString()}' ?? 'wait'),
                              ]
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
