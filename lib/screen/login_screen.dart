import 'package:api_with_provider/provider_data/login_data.dart';
import 'package:api_with_provider/screen/update_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../const.dart';

class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    LoginData loginData = LoginData();
    return ChangeNotifierProvider<LoginData>.value(
      value: loginData,
      child: Consumer<LoginData>(
        builder: (context, loginData, child) => Scaffold(
          appBar: AppBar(
            title: Text('LOg in'),
          ),
          body: Container(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text('please enter email = eve.holt@reqres.in'),
                      Container(
                        width: double.infinity,
                        child: customTextField(
                            labelText: 'email',
                            hintText: 'email',
                            onChanged: (value) {
                              print(value);
                              loginData.editEmail(value);
                            }),
                      ),
                      Container(
                        width: double.infinity,
                        child: customTextField(
                            labelText: 'password',
                            hintText: 'password',
                            onChanged: (value) {
                              print(value);
                              loginData.editPassword(value);
                            }),
                      ),
                      ElevatedButton(
                        child: Text('login'),
                        onPressed: () {
                          loginData.logINUser();
                          print(loginData.token);
                        },
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UpdateScreen()));
                        },
                        child: Text('Go For Update API'),
                      ),
                      Column(
                        children: [
                          if (loginData.responseModel != null) ...[
                            Text('Response Data',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                            Text('Response Token:- ${loginData.token}' ?? 'wait'),
                          ]
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
