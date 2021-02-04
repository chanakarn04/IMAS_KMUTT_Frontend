import 'package:flutter/material.dart';

import '../Widget/Logo.dart';
import '../Widget/AdaptiveRaisedButton.dart';

class LogInPage extends StatelessWidget {
  static const routeName = '/login';
  final usrnTextController = TextEditingController();
  final pswTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 70,
            bottom: 20,
          ),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  height: 130,
                  child: FittedBox(child: Logo()),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Username',
                  ),
                  controller: usrnTextController,
                  onEditingComplete: () => FocusScope.of(context).nextFocus(),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  controller: pswTextController,
                  onSubmitted: (_) => FocusScope.of(context).unfocus(),
                  obscureText: true,
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                height: 40,
                child: TextButton(
                  onPressed: () {
                    print('to forget password');
                  },
                  child: FittedBox(
                    child: Text(
                      'Forget Password?',
                      style:
                          TextStyle(color: Color.fromARGB(255, 125, 125, 125)),
                    ),
                  ),
                ),
              ),
              AdaptiveRaisedButton(
                buttonText: 'LOGIN',
                handlerFn: () {
                  if (usrnTextController.text.isNotEmpty &&
                      pswTextController.text.isNotEmpty) {
                    // passing data to verify
                    print('call login service');
                    print('user: ${usrnTextController.text}');
                    print('pswd: ${pswTextController.text}');
                  }
                },
                height: 35,
                width: 120,
              ),
              Expanded(
                child: Container(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Don\u0027t have an account? ',
                    style: TextStyle(
                      color: Color.fromARGB(255, 75, 75, 75),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}