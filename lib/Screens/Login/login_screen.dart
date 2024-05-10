import 'package:afasia/Screens/Login/components/body.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Iniciar Sesión",
        ),
        leading: new Container(),
      ),
    );
  }
}
