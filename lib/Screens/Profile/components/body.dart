import 'dart:convert';
// import 'package:afasia/Screens/Activities/Base/base_screen.dart';
// import 'package:afasia/Screens/Activities/Lectura/FormulacionDeOraciones/formulacion_oraciones_screen.dart';
import 'package:afasia/Screens/PacientesARevisar/assign_test_screen.dart';
import 'package:afasia/Screens/Profile/profile_screen.dart';
import 'package:afasia/Screens/Revisar/see_patients_screen.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:afasia/Screens/AddPatient/add_patient_screen.dart';
import 'package:afasia/Screens/SeePatients/see_patients_screen.dart';
import 'package:afasia/Screens/Profile/components/background.dart';
import 'package:afasia/components/rounded_button_bottom_icon.dart';
import 'package:afasia/constants.dart';
import 'package:afasia/database/database.dart';
import 'package:badges/badges.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  AfasiaDatabase db = AfasiaDatabase();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: db.initDB(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return _showFutureGetCountPacienteOff(context);
          // return Container();
        } else {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: kPrimaryColor,
            ),
          );
        }
      },
    );
  }

  Widget _showFutureGetCountPacienteOff(BuildContext context) {
    return FutureBuilder(
      future: db.getCountPacienteOff(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          String countPacienteOff = snapshot.data.toString();
          return _showBackground(context, countPacienteOff);
        } else {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: kPrimaryColor,
            ),
          );
        }
      },
    );
  }

  Widget _showBackground(BuildContext context, String countPacienteOff) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: size.height * 0.25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RoundedButtonBottomIcon(
                text: "AGREGAR USUARIO",
                icon: getIcon(Icons.person_add_alt_1),
                width: size.width * 0.425,
                press: () {
                  sexo = "masculino";
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return AddPacientScreen();
                      },
                    ),
                  );
                },
              ),
              SizedBox(
                width: size.width * 0.05,
              ),
              RoundedButtonBottomIcon(
                text: "VER USUARIOS",
                width: size.width * 0.425,
                // icon: getIcon(Icons.group),
                icon: getIcon(Icons.person_search),
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SeePatientsScreen();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
          SizedBox(
            height: size.width * 0.05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RoundedButtonBottomIcon(
                text: "REVISAR TESTS",
                icon: getIcon(Icons.assignment_turned_in),
                width: size.width * 0.425,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return RevisarScreen();
                      },
                    ),
                  );
                },
              ),
              // SizedBox(
              //   width: size.width * 0.05,
              // ),
              // RoundedButtonBottomIcon(
              //   text: "Ver estadisticas",
              //   width: size.width * 0.425,
              //   // icon: getIcon(Icons.group),
              //   icon: getIcon(Icons.person_search),
              //   press: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) {
              //           return SeePatientsScreen();
              //         },
              //       ),
              //     );
              //   },
              // ),
            ],
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          _showBadge(countPacienteOff, size),
        ],
      ),
    );
  }

  _showBadge(String countPacienteOff, Size size) {
    if (countPacienteOff != "0") {
      return Badge(
        child: RoundedButtonBottomIcon(
          text: "ACTUALIZAR DATOS",
          icon: getIcon(Icons.cloud_upload),
          width: size.width * 0.8,
          press: () async {
            await _sendData();
          },
        ),
        badgeContent: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Text(
            countPacienteOff,
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
        ),
        badgeColor: Colors.red,
        animationType: BadgeAnimationType.scale,
        animationDuration: Duration(seconds: 1),
        shape: BadgeShape.circle,
      );
    } else {
      return RoundedButtonBottomIcon(
        text: "ACTUALIZAR DATOS",
        icon: getIcon(Icons.cloud_upload),
        width: size.width * 0.8,
        press: () {},
      );
    }
  }

  getIcon(iconData) {
    return Icon(
      iconData,
      color: kPrimaryLightColor,
      size: 55,
    );
  }

  void _sendData() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      db.getAllPacienteOff().then((value) {
        List<Map<String, dynamic>> data = [];

        for (var paciente in value) {
          Map<String, dynamic> newData = {
            "rut_paciente": paciente.rut_paciente,
            "nombre": paciente.nombre,
            "apellido": paciente.apellido,
            "fecha_nacimiento": paciente.fecha_nacimiento,
            "genero": paciente.genero,
            "numero_contacto": paciente.numero_contacto,
            "rut_fonoaudiologo": paciente.rut_fonoaudiologo,
            "actualizado": "1",
          };
          data.add(newData);
        }
        var response = http.post(
          Uri.parse(urlDomain + "/api/InsertAllPaciente"),
          body: json.encode(data),
        );

        db.updateAllPacienteOff(data).then((value) {
          AlertDialog alert = AlertDialog(
            title: Text("Actualizado"),
            content:
                Text("Se actualizaron correctamente los datos en el servidor"),
          );
          showDialog(
            context: context,
            builder: (context) {
              return alert;
            },
          ).then((value) {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ProfileScreen();
                },
              ),
            );
          });
        });
      });
    } else {
      AlertDialog alert = AlertDialog(
        title: Text("Sin conexión"),
        content: Text("Por favor, verifique su conexión a internet"),
      );
      showDialog(
        context: context,
        builder: (context) {
          return alert;
        },
      );
    }
  }
}
