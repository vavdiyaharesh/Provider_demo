import 'package:api_with_provider/provider_data/delete_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../const.dart';

class GetAndDelete extends StatefulWidget {
  @override
  _GetAndDeleteState createState() => _GetAndDeleteState();
}

class _GetAndDeleteState extends State<GetAndDelete> {
  DeleteList data = DeleteList();

  @override
  void initState() {
    data.getUser();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("API-------------- build is loaded");

    return ChangeNotifierProvider<DeleteList>.value(
      value: data,
      child: Consumer<DeleteList>(builder: (context, data, child) {
        return Scaffold(
          appBar: appBar('GetList and Delete User'),
          body: Container(
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: data.userList.length,
                      itemBuilder: (context, position) => Card(
                        margin: EdgeInsets.all(10),

                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Id:-${data.userList[position].id.toString()}',
                                      ),
                                      Text(
                                        'Email:-${data.userList[position].email.toString()}',
                                      ),
                                      Text(
                                        'First name:-${data.userList[position].firstName.toString()}',
                                      ),
                                      Text(
                                        'Last name:-${data.userList[position].lastName.toString()}',
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                      icon: Icon(
                                        Icons.delete,
                                        size: 30,
                                        color: Colors.red,
                                      ),
                                      onPressed: () {
                                        data.deleteUser(position);
                                      })
                                ],
                              ),
                            ),
                          )),
                ),
                // ElevatedButton(
                //     onPressed: () {
                //       Navigator.push(context,
                //           MaterialPageRoute(builder: (context) => LogInScreen()));
                //     },
                //     child: Text('Login'))
              ],
            ),
          ),
        );
      }),
    );
  }
}
