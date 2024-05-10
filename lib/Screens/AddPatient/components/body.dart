import 'package:afasia/Screens/AddPatient/components/background.dart';
import 'package:afasia/Screens/Profile/profile_screen.dart';
import 'package:afasia/Screens/SeePatients/see_patients_screen.dart';
import 'package:afasia/components/gender_selector.dart';
import 'package:afasia/components/rounded_button.dart';
import 'package:afasia/components/rounded_datepicker_field.dart';
import 'package:afasia/components/rounded_input_field.dart';
import 'package:afasia/constants.dart';
import 'package:afasia/database/database.dart';
import 'package:afasia/database/models/paciente.class.dart';
import 'package:flutter/material.dart';
import 'package:gender_picker/source/enums.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  AfasiaDatabase db = AfasiaDatabase();
  Map<String, dynamic> data = {
    "genero": "masculino",
    "numero_contacto": "No aplica"
  };

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: db.initDB(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return _showBackground(context);
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

  Widget _showBackground(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RoundedInputField(
            hintText: "RUT: 12345678-9",
            onChanged: (value) {
              data["rut_paciente"] = value;
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
          // RoundedInputField(
          //   hintText: "Numero de contacto:",
          //   onChanged: (value) {
          //     data["numero_contacto"] = value;
          //   },
          // ),
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
          GenderSelector(
            onChanged: (value) {
              switch (value) {
                case Gender.Female:
                  sexo = "femenino";
                  data["genero"] = "femenino";
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
            text: "AGREGAR",
            press: () {
              if (verificaDatos(data))
                db.verifyPaciente(data["rut_paciente"]).then(
                  (value) {
                    if (value.isNotEmpty) {
                      print("Existe");
                    } else {
                      db.getFonoaudiologo().then(
                        (value) {
                          data["rut_fonoaudiologo"] =
                              value.first.rut_fonoaudiologo;

                          data["actualizado"] = 0;
                          print("Antes de verificar " + data.toString());

                          Paciente p = new Paciente(
                            data["rut_paciente"],
                            data["nombre"],
                            data["apellido"],
                            data["genero"],
                            data["fecha_nacimiento"],
                            data["numero_contacto"],
                            data["rut_fonoaudiologo"],
                            data["actualizado"],
                          );
                          db.insertPaciente(p).then(
                            (value) {
                              Navigator.pop(context);
                              Navigator.pop(context);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return ProfileScreen();
                                  },
                                ),
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return SeePatientsScreen();
                                  },
                                ),
                              );
                              // return SeePatientsScreen();
                            },
                          );
                        },
                      );
                    }
                  },
                );
            },
          ),
        ],
      ),
    );
  }

  bool verificaDatos(data) {
    print(data);
    var rut = data["rut_paciente"];

    var multiplicador = [2, 3, 4, 5, 6, 7, 2, 3];
    var suma = 0;
    if (data.length == 6) {
      if (rut.length >= 3) {
        if (rut[rut.length - 2] == '-') {
          var s = rut.split('-');
          var rutSinDigito = s[0].split('').reversed.join();

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
        var s = dataFaltante(data);

        AlertDialog alert = AlertDialog(
          title: Text("Datos incorrectos"),
          content: Text("Por favor, complete todos los campos ${s}"),
        );
        showDialog(
          context: context,
          builder: (context) {
            return alert;
          },
        );
      }
    } else {
      var s = dataFaltante(data);
      AlertDialog alert = AlertDialog(
        title: Text("Datos incorrectos"),
        content: Text("Por favor, complete todos los campos ${s}"),
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

  String dataFaltante(data) {
    var verificacion = {};
    verificacion["rut_paciente"] = 0;
    verificacion["genero"] = 0;
    verificacion["nombre"] = 0;
    verificacion["apellido"] = 0;
    verificacion["numero_contacto"] = 0;
    verificacion["fecha_nacimiento"] = 0;
    data.forEach((k, v) {
      verificacion[k] = 1;
    });
    String s = "";
    verificacion.forEach((k, v) {
      if (verificacion[k] == 0) {
        if (s == "") {
          s += "faltantes (";
        }
        s += getCorrectName(k) + ', ';
      }
    });
    if (s != "") {
      s = s.substring(0, s.length - 2) + ')';
    }
    return s;
  }

  String getCorrectName(k) {
    switch (k) {
      case "rut_paciente":
        return "Rut";
      case "genero":
        return "Género";
      case "nombre":
        return "Nombre";
      case "apellido":
        return "Apellido";
      case "numero_contacto":
        return "Número de contacto";
      case "fecha_nacimiento":
        return "Fecha de nacimiento";

      default:
        return "";
    }
  }
}
