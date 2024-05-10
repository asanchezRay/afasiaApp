import 'package:afasia/Screens/Revisar/see_patients_screen.dart';
import 'package:afasia/Screens/Welcome/welcome_screen.dart';
import 'package:afasia/components/rounded_button.dart';
import 'package:afasia/constants.dart';
import 'package:afasia/database/database.dart';
import 'package:afasia/database/models/reconocimientoAuditivo.class.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class ComprensionInhibicionView extends StatelessWidget {
  const ComprensionInhibicionView({
    Key key,
    @required this.inhibicionPaciente,
    @required this.name,
  }) : super(key: key);

  final List inhibicionPaciente;
  final name;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(name);
    return Scaffold(
      // extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   actions: [
      //     FlatButton(
      //       onPressed: () {},
      //       child: Text("Skip"),
      //     ),
      //   ],
      // ),

      appBar: AppBar(
        title: name,
      ),
      body: Column(
        children: [
          Container(
              height: size.height * 0.83,
              child: ListView(
                children: [
                  for (var actividad in inhibicionPaciente)
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
                          Row(
                            children: [
                              Image.asset(
                                actividad["imagen1"],
                                width: 150,
                                height: 150,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Image.asset(
                                actividad["imagen2"],
                                width: 150,
                                height: 150,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Image.asset(
                                actividad["imagen3"],
                                width: 150,
                                height: 150,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Image.asset(
                                actividad["imagen4"],
                                width: 150,
                                height: 150,
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
              )),
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

                      finalizarRevision(inhibicionPaciente);
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

  Future<void> finalizarRevision(List inhibicionPaciente) async {
    AfasiaDatabase db = AfasiaDatabase();
    await db.initDB();

    for (var actividad in inhibicionPaciente) {
      if (actividad["revisado"] == 0) {
        actividad["revisado"] = 1;

        db.updateComprensionInhibicion(actividad);
      }
    }
  }
}
