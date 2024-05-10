import 'package:afasia/Screens/Revisar/components/dialog_lectura.dart';
import 'package:afasia/Screens/Revisar/see_patients_screen.dart';
import 'package:afasia/Screens/Welcome/welcome_screen.dart';
import 'package:afasia/components/rounded_button.dart';
import 'package:afasia/constants.dart';
import 'package:afasia/database/database.dart';
import 'package:afasia/database/models/reconocimientoAuditivo.class.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class LecturaComprensivaView extends StatelessWidget {
  const LecturaComprensivaView({
    Key key,
    @required this.lecturaComprensivaPaciente,
    @required this.name,
  }) : super(key: key);

  final List lecturaComprensivaPaciente;
  final name;

  @override
  Widget build(BuildContext context) {
    _showMaterialDialogLectura(actividad) {
      showDialog(
        context: context,
        builder: (_) {
          return MyDialogLectura(
            actividad: actividad,
          );
        },
      );
    }

    Size size = MediaQuery.of(context).size;
    print(name);
    return Scaffold(
      appBar: AppBar(
        title: name,
      ),
      body: Column(
        children: [
          Container(
            height: size.height * 0.83,
            child: ListView(
              children: [
                for (var actividad in lecturaComprensivaPaciente)
                  Container(
                    decoration: BoxDecoration(
                      color: kPrimaryLightColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(color: kPrimaryColor, spreadRadius: 3),
                      ],
                    ),
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              actividad["isCorrecta"] == 1
                                  ? Icons.check_circle
                                  : Icons.cancel,
                              color: kPrimaryColor,
                              size: 30,
                            ),
                            Text(" Errores: ${actividad['intentos']}",
                                style: TextStyle(fontSize: 25))
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              width: 20,
                              height: 10,
                            ),
                            Text(actividad["estimulo"],
                                style: TextStyle(fontSize: 25)),
                            SizedBox(
                              width: 20,
                              height: 10,
                            ),
                            Text("1) " + actividad["opcion1"],
                                style: TextStyle(fontSize: 22)),
                            SizedBox(
                              width: 20,
                              height: 10,
                            ),
                            Text("2) " + actividad["opcion2"],
                                style: TextStyle(fontSize: 22)),
                            SizedBox(
                              width: 20,
                              height: 10,
                            ),
                            Text("3) " + actividad["opcion3"],
                                style: TextStyle(fontSize: 22)),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          RoundedButton(
            text: "Finalizar Corrección",
            width: 250,
            color: kPrimaryColor,
            press: () {
              AlertDialog alert = AlertDialog(
                title: Text("¿Esta seguro de finalizar?"),
                content: Text(
                    "Una vez finalizada la revisión, no podra acceder a esta información nuevamente."),
                actions: [
                  TextButton(
                    child: const Text('Aceptar'),
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => WelcomeScreen(),
                          ),
                          (route) => false);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return RevisarScreen();
                          },
                        ),
                      );

                      finalizarRevision(lecturaComprensivaPaciente);
                    },
                  ),
                ],
              );
              showDialog(
                context: context,
                builder: (context) {
                  return alert;
                },
              );
            },
          )
        ],
      ),
    );
  }

  Future<void> finalizarRevision(List lecturaComprensivaPaciente) async {
    print(lecturaComprensivaPaciente);
    AfasiaDatabase db = AfasiaDatabase();
    await db.initDB();

    for (var actividad in lecturaComprensivaPaciente) {
      if (actividad["revisado"] == 0) {
        actividad["revisado"] = 1;

        db.updateLecturaComprensiva(actividad);
      }
    }
  }
}
