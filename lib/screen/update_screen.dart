import 'package:api_with_provider/const.dart';
import 'package:api_with_provider/provider_data/update_data.dart';
import 'package:api_with_provider/screen/get_delete_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateScreen extends StatefulWidget {
  @override
  _UpdateScreenState createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  UpdateData updateData = UpdateData();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UpdateData>.value(
        value: updateData,
        child: Consumer<UpdateData>(
          builder: (context, updateData, child) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Update'),
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
                                  updateData.setName(value);
                                }),
                          ),
                          Container(
                            width: double.infinity,
                            child: customTextField(
                                labelText: 'job',
                                hintText: 'job',
                                onChanged: (value) {
                                  print(value);
                                  updateData.setJOb(value);
                                }),
                          ),
                          ElevatedButton(
                            child: Text('Update'),
                            onPressed: () {
                              updateData.updateUser();
                              print(updateData.name);
                            },
                          ),
                          ElevatedButton(
                            child: Text('Get user list and delete'),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => GetAndDelete()));
                            },
                          ),
                          Column(
                            children: [
                              if (updateData.responseModel != null) ...[
                                Text('Response Data',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                                Text('Name:- ${updateData.name}' ?? 'wait'),
                                Text('Job:-${updateData.job}' ?? 'wait'),
                                Text('Updated at:- ${updateData.responseModel.updatedAt.toString()}' ?? 'wait'),
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
