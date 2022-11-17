import 'package:flutter/material.dart';

import '../widgets/row_space.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              decoration: InputDecoration(
                label: Text("Email"),
                border: OutlineInputBorder(),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                prefixIcon: Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            RowSpace(),
            TextFormField(
              decoration: InputDecoration(
                label: Text("Password"),
                border: OutlineInputBorder(),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                prefixIcon: Icon(Icons.lock),
                suffixIcon: Icon(Icons.visibility),
              ),
              obscureText: true,
            ),
            RowSpace(),
            ElevatedButton(onPressed: () {}, child: Text("Login")),
            RowSpace(
              height: 15,
            ),
            TextButton(
              onPressed: () => onRegister(context),
              child: Text("Or create new account"),
            ),
          ],
        ),
      ),
    );
  }

  // Utility

  // Handler
  void onRegister(BuildContext context) {
    Navigator.of(context).pushNamed('/register');
  }
}
