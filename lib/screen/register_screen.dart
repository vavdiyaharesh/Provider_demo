import 'package:api_with_provider/provider_data/register_data.dart';
import 'package:api_with_provider/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../const.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    RegisterData registerData = RegisterData();
    return ChangeNotifierProvider<RegisterData>.value(
      value: registerData,
      child: Consumer<RegisterData>(
        builder: (context, registerData, child) => Scaffold(
          appBar: AppBar(
            title: Text('Register'),
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
                              registerData.setEmail(value);
                            }),
                      ),
                      Container(
                        width: double.infinity,
                        child: customTextField(
                            labelText: 'password',
                            hintText: 'password',
                            onChanged: (value) {
                              print(value);
                              registerData.setPassword(value);
                            }),
                      ),
                      ElevatedButton(
                        child: Text('Register'),
                        onPressed: () {
                          registerData.registerUser();
                        },
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LogInScreen()));
                        },
                        child: Text('Go For Login API'),
                      ),
                      Column(
                        children: [
                          if (registerData.responseModel != null) ...[
                            Text(
                              'Response Data',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                            Text(
                                'Response id:- ${registerData.responseModel.id.toString()}' ??
                                    'wait'),
                            Text(
                                'Response Token:- ${registerData.responseModel.token}' ??
                                    'wait'),
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
