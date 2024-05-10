import 'package:afasia/Screens/Signup/components/body.dart';
import 'package:flutter/material.dart';

class SignUPScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Registrar",
        ),
        leading: new Container(),
      ),
      body: Body(),
    );
  }
}
