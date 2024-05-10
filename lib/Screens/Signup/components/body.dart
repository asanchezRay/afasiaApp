import 'dart:async';
import 'dart:convert';
import 'package:afasia/Screens/Profile/profile_screen.dart';
import 'package:afasia/constants.dart';
import 'package:afasia/database/database.dart';
import 'package:afasia/database/models/fonoaudiologo.class.dart';
import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart' as http;
import 'package:afasia/Screens/Login/login_screen.dart';
import 'package:afasia/Screens/Signup/components/background.dart';
import 'package:afasia/components/already_have_an_account_check.dart';
import 'package:afasia/components/gender_selector.dart';
import 'package:afasia/components/rounded_button.dart';
import 'package:afasia/components/rounded_datepicker_field.dart';
import 'package:afasia/components/rounded_input_field.dart';
import 'package:afasia/components/rounded_password_field.dart';
import 'package:flutter/material.dart';
import 'package:gender_picker/source/enums.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  AfasiaDatabase db = AfasiaDatabase();
  var data = {"genero": "masculino"};

  var rut = {};
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: db.initDB(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return _showBody(context);
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

  Widget _showBody(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    sexo = "masculino";
    return Background(
      child: ListView(
        // child: Column(
        padding: EdgeInsets.only(
          left: size.width * 0.1,
          right: size.width * 0.1,
        ),
        shrinkWrap: true,
        children: <Widget>[
          RoundedInputField(
            hintText: "RUT: 12345678-9",
            onChanged: (value) {
              data["rut_fonoaudiologo"] = value;
              rut["rut_fonoaudiologo"] = value;
            },
          ),
          RoundedInputField(
            hintText: "Nombre:",
            onChanged: (value) {
              data["nombre"] = value;
            },
          ),
          RoundedInputField(
            hintText: "Apellido:",
            onChanged: (value) {
              data["apellido"] = value;
            },
          ),
          RoundedInputField(
            hintText: "Correo:",
            icon: Icons.alternate_email,
            onChanged: (value) {
              data["correo"] = value;
            },
          ),
          RoundedDatepicker(
            onTap: () {
              data["fecha_nacimiento"] = "";
              FocusScope.of(context).requestFocus(new FocusNode());
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
                // initialDatePickerMode: DatePickerMode.year,
                locale: Locale('es', 'ES'),
                builder: (context, child) {
                  return Theme(
                    data: ThemeData.light().copyWith(
                      colorScheme: ColorScheme.dark(
                        primary: kPrimaryColor,
                        onPrimary: Colors.black,
                        surface: kPrimaryLightColor,
                        onSurface: Colors.black,
                        secondary: Colors.black,
                        onSecondary: Colors.black,
                      ),
                      dialogBackgroundColor: Colors.white,
                      accentColor: kPrimaryColor,
                    ),
                    child: child,
                  );
                },
              ).then((value) {
                data["fecha_nacimiento"] = value.year.toString() +
                    "-" +
                    value.month.toString() +
                    "-" +
                    value.day.toString();
              });
            },
            inputFieldDateController:
                TextEditingController(text: data["fecha_nacimiento"]),
          ),
          RoundedPassword(
            onChanged: (value) {
              data["contrasena"] = value;
            },
          ),
          RoundedPassword(
            onChanged: (value) {
              if (value == data["contrasena"]) {
                print(value);
              } else {}
            },
          ),
          GenderSelector(
            onChanged: (value) {
              switch (value) {
                case Gender.Female:
                  data["genero"] = "femenino";
                  sexo = "femenino";
                  break;
                case Gender.Male:
                  data["genero"] = "masculino";
                  sexo = "masculino";
                  break;
                default:
                  data["genero"] = "sin especificar";
                  sexo = "sin especificar";
                  break;
              }
            },
          ),
          RoundedButton(
            width: size.width * 0.8,
            text: "REGISTRAR",
            press: () {
              if (verificaDatos(data)) {
                _verifyFonoaudiologo(rut, data, context, db);
              }
            },
          ),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _sendData(data, context) async {
    await http.post(
      Uri.parse(urlDomain + "/api/VerifyFonoaudiologo"),
      body: json.encode(data),
    );
    Fonoaudiologo f = new Fonoaudiologo(
      data["rut_fonoaudiologo"],
      data["nombre"],
      data["apellido"],
      data["correo"],
      data["genero"],
      data["fecha_nacimiento"],
    );

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
  }

  Future<List> _verifyFonoaudiologo(rut, data, context, db) async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      var response = await http.post(
        Uri.parse(urlDomain + "/api/VerifyFonoaudiologo"),
        body: json.encode(rut),
      );
      var responseJson = json.decode(utf8.decode(response.bodyBytes));
      // Si esta en la basedatos servidor
      if (responseJson["flag"]) {
        Widget logInButton = FlatButton(
          child: Text("Iniciar Sesión"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return LoginScreen();
                },
              ),
            );
          },
        );
        Widget retryButton = FlatButton(
          child: Text("Reintentar"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        );

        AlertDialog alert = AlertDialog(
          title: Text("Error"),
          content: Text("El usuario ya ha sido registrado"),
          actions: [
            logInButton,
            retryButton,
          ],
        );
        showDialog(
          context: context,
          builder: (context) {
            return alert;
          },
        );
      } else {
        _sendData(data, context);
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
    print(data);
    var rut = data["rut_fonoaudiologo"];
    var pass = data["contrasena"];
    var multiplicador = [2, 3, 4, 5, 6, 7, 2, 3];
    var suma = 0;
    if (data.length == 7) {
      if (rut.length >= 3 && pass != "") {
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
