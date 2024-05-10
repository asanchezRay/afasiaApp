import 'package:afasia/Screens/PacientesARevisar/components/body.dart';
import 'package:afasia/database/models/actividad.class.dart';
import 'package:flutter/material.dart';

class PacientesARevisarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Revisar actividades"),
      ),
      body: Body(),
    );
  }
}
