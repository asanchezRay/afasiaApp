import 'dart:convert';
import 'package:afasia/database/database.dart';
import 'package:afasia/database/models/fonoaudiologo.class.dart';
import 'package:afasia/database/models/paciente.class.dart';
import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart' as http;
import 'package:afasia/Screens/Login/components/background.dart';
import 'package:afasia/Screens/Profile/profile_screen.dart';
import 'package:afasia/Screens/Signup/signup_screen.dart';
import 'package:afasia/components/already_have_an_account_check.dart';
import 'package:afasia/components/rounded_button.dart';
import 'package:afasia/components/rounded_input_field.dart';
import 'package:afasia/components/rounded_password_field.dart';
import 'package:afasia/constants.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  AfasiaDatabase db = AfasiaDatabase();
  var data = {};
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: db.initDB(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return _showBackground();
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

  Widget _showBackground() {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            "assets/images/saludMental.png",
            width: size.width * 0.6,
          ),
          RoundedInputField(
            hintText: "RUT: 12345678-9",
            onChanged: (value) {
              data["rut_fonoaudiologo"] = value;
            },
          ),
          RoundedPassword(
            onChanged: (value) {
              data["contrasena"] = value;
            },
          ),
          RoundedButton(
            text: "INGRESAR",
            width: size.width * 0.8,
            press: () {
              if (verificaDatos(data)) {
                _sendData(data);
              }
            },
          ),
          AlreadyHaveAnAccountCheck(press: () {
            sexo = "masculino";
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return SignUPScreen();
                },
              ),
            );
          })
        ],
      ),
    );
  }

  void _sendData(data) async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      var response = await http.post(
        Uri.parse(urlDomain + "/api/GetFonoaudiologo"),
        body: json.encode(data),
      );

      var responseJson = json.decode(utf8.decode(response.bodyBytes));

      if (responseJson["flag"]) {
        Fonoaudiologo f = new Fonoaudiologo(
          responseJson["rut_fonoaudiologo"],
          responseJson["nombre"],
          responseJson["apellido"],
          responseJson["correo"],
          responseJson["genero"],
          responseJson["fecha_nacimiento"],
        );

        print("soy el map: " + f.toMap().toString());

        var dataPaciente = {};
        dataPaciente["rut_fonoaudiologo"] = responseJson["rut_fonoaudiologo"];

        var responsePaciente = await http.post(
          Uri.parse(urlDomain + "/api/GetPaciente"),
          body: json.encode(dataPaciente),
        );
        var responseJsonPacienteList =
            json.decode(utf8.decode(responsePaciente.bodyBytes));

        for (var responseJsonPaciente in responseJsonPacienteList) {
          Paciente paciente = new Paciente(
              responseJsonPaciente["rut_paciente"],
              responseJsonPaciente["nombre"],
              responseJsonPaciente["apellido"],
              responseJsonPaciente["genero"],
              responseJsonPaciente["fecha_nacimiento"],
              responseJsonPaciente["numero_contacto"].toString(),
              responseJsonPaciente["rut_fonoaudiologo"],
              1);
          try {
            await db.insertPaciente(paciente);
          } on Exception catch (_) {}
        }
        db.insertFonoaudiologo(f).then(
          (value) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ProfileScreen();
                },
              ),
              ModalRoute.withName(""),
            );
          },
        );
      } else {
        Widget continueButton = FlatButton(
          child: Text("Continuar"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        );

        AlertDialog alert = AlertDialog(
          title: Text("Error"),
          content: Text("Usuario o contraseña incorrectos"),
          actions: [
            continueButton,
          ],
        );
        showDialog(
          context: context,
          builder: (context) {
            return alert;
          },
        );
      }
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

  bool verificaDatos(data) {
    var rut = data["rut_fonoaudiologo"];
    var pass = data["contrasena"];
    var multiplicador = [2, 3, 4, 5, 6, 7, 2, 3];
    var suma = 0;
    if (data.length == 2) {
      if (rut != "" && pass != "") {
        if (rut[rut.length - 2] == '-') {
          var s = rut.split('-');
          var rutSinDigito = s[0].split('').reversed.join();
          print(rutSinDigito);
          for (var i = 0; i < rutSinDigito.length; i++) {
            suma += (int.parse(rutSinDigito[i]) * multiplicador[i]);
          }
          var digito = 11 - (suma % 11);
          if (digito == 11) digito = 0;
          if (s[1] == 'k') s[1] = "10";
          if (digito == int.parse(s[1])) {
            //rut correcto
            return true;
          } else {
            AlertDialog alert = AlertDialog(
              title: Text("Rut incorrecto"),
              content: Text("Por favor, ingrese un rut correcto"),
            );
            showDialog(
              context: context,
              builder: (context) {
                return alert;
              },
            );
          }
        } else {
          AlertDialog alert = AlertDialog(
            title: Text("Rut incorrecto"),
            content: Text(
                "Por favor, ingrese el rut con digito verificador separado por un guión"),
          );
          showDialog(
            context: context,
            builder: (context) {
              return alert;
            },
          );
        }
      } else {
        AlertDialog alert = AlertDialog(
          title: Text("Datos incorrectos"),
          content: Text("Por favor, complete todos los campos"),
        );
        showDialog(
          context: context,
          builder: (context) {
            return alert;
          },
        );
      }
    } else {
      AlertDialog alert = AlertDialog(
        title: Text("Datos incorrectos"),
        content: Text("Por favor, complete todos los campos"),
      );
      showDialog(
        context: context,
        builder: (context) {
          return alert;
        },
      );
    }
    return false;
  }
}
