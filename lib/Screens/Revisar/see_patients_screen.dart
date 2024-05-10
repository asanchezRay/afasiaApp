import 'package:afasia/Screens/Revisar/components/body.dart';
import 'package:flutter/material.dart';

class RevisarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Revisar Test"),
      ),
      body: Body(),
    );
  }
}
