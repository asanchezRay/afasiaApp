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

class LecturasView extends StatelessWidget {
  const LecturasView({
    Key key,
    @required this.lecturaPaciente,
    @required this.name,
  }) : super(key: key);

  final List lecturaPaciente;
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
                for (var actividad in lecturaPaciente)
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
                            SizedBox(
                              width: 30,
                            ),
                            Text(" Estimulo: ${actividad['estimulo']}",
                                style: TextStyle(fontSize: 25))
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            RawMaterialButton(
                              onPressed: () async {
                                final directory =
                                    await getApplicationDocumentsDirectory();
                                final assetsAudioPlayer = AssetsAudioPlayer();
                                var s =
                                    directory.path + "/${actividad['audio']}";
                                print(s);
                                assetsAudioPlayer.open(Audio.file(
                                    directory.path + '/${actividad["audio"]}'));

                                assetsAudioPlayer.play();
                              },
                              fillColor: kPrimaryColor,
                              child: Icon(
                                Icons.play_arrow,
                                size: 25,
                                color: Colors.white,
                              ),
                              padding: EdgeInsets.all(10.0),
                              shape: CircleBorder(),
                            ),
                            RoundedButton(
                              text: "Corregir",
                              width: 140,
                              color: kPrimaryColor,
                              press: () {
                                _showMaterialDialogLectura(actividad);
                              },
                            ),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        )
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

                      finalizarRevision(lecturaPaciente);
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

  Future<void> finalizarRevision(List lecturaPaciente) async {
    print(lecturaPaciente);
    AfasiaDatabase db = AfasiaDatabase();
    await db.initDB();

    for (var actividad in lecturaPaciente) {
      if (actividad["revisado"] == 0) {
        actividad["revisado"] = 1;
        actividad["comentario"] = "Correcto";
        db.updateLectura(actividad);
      }
    }
  }
}
