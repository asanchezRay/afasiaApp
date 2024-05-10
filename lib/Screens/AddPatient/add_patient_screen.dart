import 'package:afasia/Screens/AddPatient/components/body.dart';
import 'package:flutter/material.dart';

class AddPacientScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agregar usuario"),
      ),
      body: Body(),
    );
  }
}
