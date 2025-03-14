import 'dart:io';

import 'package:afasia/Screens/Revisar/components/dialog_alDictado.dart';
import 'package:afasia/Screens/Revisar/components/dialog_copia.dart';
import 'package:afasia/Screens/Revisar/see_patients_screen.dart';
import 'package:afasia/Screens/Welcome/welcome_screen.dart';
import 'package:afasia/components/rounded_button.dart';
import 'package:afasia/constants.dart';
import 'package:afasia/database/database.dart';
import 'package:afasia/database/models/reconocimientoAuditivo.class.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class EscrituraAlDictadoView extends StatelessWidget {
  const EscrituraAlDictadoView({
    Key key,
    @required this.escrituraAlDictadoPaciente,
    @required this.name,
  }) : super(key: key);

  final List escrituraAlDictadoPaciente;
  final name;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    _showMaterialDialogEscrituraAlDictado(actividad) {
      showDialog(
        context: context,
        builder: (_) {
          return MyDialogAlDictado(
            actividad: actividad,
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
                    for (var actividad in escrituraAlDictadoPaciente)
                      Container(
                        margin: EdgeInsets.only(top: 8, bottom: 8),
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
                                final assetsAudioPlayer = AssetsAudioPlayer();

                                assetsAudioPlayer.open(
                                  Audio(actividad['audio']),
                                );
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
                            Image.file(
                              File(
                                  '/storage/emulated/0/Pictures/${actividad["imagen"]}.jpg'),
                              width: 700,
                            ),
                            RoundedButton(
                              text: "Corregir",
                              width: 140,
                              color: kPrimaryColor,
                              press: () {
                                _showMaterialDialogEscrituraAlDictado(
                                    actividad);
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

                      finalizarRevision(escrituraAlDictadoPaciente);
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

  Future<void> finalizarRevision(List escrituraAlDictadoPaciente) async {
    print(escrituraAlDictadoPaciente);
    AfasiaDatabase db = AfasiaDatabase();
    await db.initDB();

    for (var actividad in escrituraAlDictadoPaciente) {
      if (actividad["revisado"] == 0) {
        actividad["revisado"] = 1;
        actividad["comentario"] = "Correcto";
        db.updateEscrituraAlDictado(actividad);
      }
    }
  }
}
