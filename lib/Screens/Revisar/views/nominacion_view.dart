import 'dart:io';

import 'package:afasia/Screens/Revisar/components/dialog_copia.dart';
import 'package:afasia/Screens/Revisar/components/dialog_nominacion.dart';
import 'package:afasia/Screens/Revisar/see_patients_screen.dart';
import 'package:afasia/Screens/Welcome/welcome_screen.dart';
import 'package:afasia/components/rounded_button.dart';
import 'package:afasia/constants.dart';
import 'package:afasia/database/database.dart';
import 'package:afasia/database/models/reconocimientoAuditivo.class.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class NominacionView extends StatelessWidget {
  const NominacionView({
    Key key,
    @required this.nominacionPaciente,
    @required this.name,
    this.id,
  }) : super(key: key);

  final List nominacionPaciente;
  final name;
  final id;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    void _showMaterialDialogNominacion(actividad, id) {
      showDialog(
        context: context,
        builder: (_) {
          return MyDialogNominacion(
            actividad: actividad,
            id: id,
          );
        },
      );
    }

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
                name,
                SizedBox(
                  height: 8,
                ),
                Column(
                  children: [
                    for (var actividad in nominacionPaciente)
                      Container(
                        margin: EdgeInsets.only(top: 8, bottom: 8),
                        width: 700,
                        decoration: BoxDecoration(
                          color: kPrimaryLightColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(color: kPrimaryColor, spreadRadius: 3),
                          ],
                        ),
                        child: Column(
                          children: [
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
                            Image.asset(
                              actividad["estimulo"],
                              width: 400,
                            ),
                            RoundedButton(
                              text: "Corregir",
                              width: 140,
                              color: kPrimaryColor,
                              press: () {
                                _showMaterialDialogNominacion(actividad, id);
                              },
                            ),
                            SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                      ),
                  ],
                )
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

                      finalizarRevision(nominacionPaciente);
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

  Future<void> finalizarRevision(List nominacionPaciente) async {
    print(nominacionPaciente);
    AfasiaDatabase db = AfasiaDatabase();
    await db.initDB();

    for (var actividad in nominacionPaciente) {
      if (actividad["revisado"] == 0) {
        actividad["revisado"] = 1;
        actividad["comentario"] = "Correcto";
        if (id == 1) {
          db.updateNominacionAcciones(actividad);
        } else {
          db.updateNominacionObjetos(actividad);
        }
      }
    }
  }
}
