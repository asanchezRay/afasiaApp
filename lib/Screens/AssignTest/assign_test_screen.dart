import 'package:afasia/Screens/AssignTest/components/background.dart';
import 'package:afasia/Screens/AssignTest/components/body.dart';
import 'package:afasia/database/models/actividad.class.dart';
import 'package:flutter/material.dart';

class AssignTestScreen extends StatelessWidget {
  final String rut_paciente;
  List<Actividad> actividades;
  AssignTestScreen({
    this.rut_paciente,
    this.actividades,
  });
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Asignar actividades"),
      ),
      body: Body(
        rut_paciente: rut_paciente,
        actividades: actividades,
      ),
    );
  }
}
