import 'package:afasia/Screens/SeePatients/components/body.dart';
import 'package:flutter/material.dart';

class SeePatientsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ver usuarios"),
      ),
      body: Body(),
    );
  }
}
