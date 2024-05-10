import 'package:afasia/Screens/AssignTest/components/background.dart';
import 'package:afasia/Screens/AssignTest/components/table_names_columns.dart';
import 'package:afasia/components/rounded_button.dart';
import 'package:afasia/components/rounded_button_bottom_icon.dart';
import 'package:afasia/constants.dart';
import 'package:afasia/database/database.dart';
import 'package:afasia/database/models/actividad.class.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class Body extends StatefulWidget {
  final String rut_paciente;
  List<Actividad> actividades;
  Body({
    Key key,
    @required this.rut_paciente,
    @required this.actividades,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState(rut_paciente, actividades);
}

class _BodyState extends State<Body> {
  List<bool> checked = [];
  List<double> level = [];
  String myLabel;

  AfasiaDatabase db = AfasiaDatabase();

  String rut_paciente;
  List<Actividad> actividades;
  _BodyState(this.rut_paciente, this.actividades);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        children: [
          TableNamesColumns(),
          Container(
            height: 1,
            width: size.width,
            color: kPrimaryColor,
          ),
          getBodyTable(size),
          Container(
            color: kPrimaryLightColor,
            height: 8,
          ),
          RoundedButton(
            width: size.width * 0.8,
            text: "ASIGNAR ACTIVIDADES A REALIZAR",
            press: () {
              List<int> actividadesAsignadas = new List<int>(checked.length);

              rutPacienteTrabajando = rut_paciente;
              int firstId = -1;
              int cont = 0;
              for (int i = 0; i < checked.length; i++) {
                if (checked[i]) {
                  actividadesAsignadas[i] = level[i].toInt();
                  if (firstId == -1) firstId = i;
                } else {
                  cont++;
                  actividadesAsignadas[i] = 0;
                }
              }
              if (cont == checked.length) {
                AlertDialog alert = AlertDialog(
                  title: Text("No ha seleccionado ninguna actividad"),
                  content: Text("Por favor, seleccione al menos una actividad"),
                );
                showDialog(
                  context: context,
                  builder: (context) {
                    return alert;
                  },
                );
              } else {
                cantidadActividadesAsignadas = checked.length - cont;
                cantidadActividadesRealizadas = 1;
                print("cantidad actividades asignadas");
                print(cantidadActividadesAsignadas);
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) =>
                          getNext(firstId, actividadesAsignadas),
                    ),
                    (route) => false);
              }
            },
          ),
        ],
      ),
    );
  }

  Container getBodyTable(Size size) {
    if (checked.isEmpty)
      for (var i = 0; i < actividades.length; i++) {
        checked.add(false);
        level.add(1);
      }
    return Container(
      width: double.infinity,
      height: size.height * 0.78,
      child: Scrollbar(
        thickness: 15,
        radius: Radius.circular(7),
        child: ListView(
          children: [
            Column(
              children: List<Row>.generate(
                actividades.length * 2,
                (index) {
                  if (index % 2 == 1) {
                    return getRow(size, (index ~/ 2));
                  } else {
                    return Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              height: getHeightLineSeparator(index),
                              width: size.width,
                              color: kPrimaryLightColor,
                            ),
                            getNameByIndex(index),
                            Container(
                              height: getHeightLineSeparator(index),
                              width: size.width,
                              color: kPrimaryLightColor,
                            ),
                          ],
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row getRow(Size size, int index) {
    return Row(
      children: [
        Container(
          width: size.width * 0.1,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: CupertinoSwitch(
            value: checked[index],
            activeColor: kPrimaryColor,
            trackColor: kPrimaryLightColor,
            onChanged: (bool value) {
              this.setState(() {
                print(index);
                checked[index] = value;
                print(checked.toString());
              });
            },
          ),
        ),
        Container(
          height: size.height * 0.05,
          width: 1,
          color: kPrimaryLightColor,
        ),
        Container(
          width: size.width * 0.49,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Text(
            actividades[index].nombre_actividad,
            style: TextStyle(fontSize: 22, color: kPrimaryColor),
          ),
        ),
        Container(
          height: size.height * 0.05,
          width: 1,
          color: kPrimaryLightColor,
        ),
        Container(
          // width: size.width * 0.5,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),

          child: Row(
            children: [
              Text("Bajo"),
              Slider(
                value: level[index],
                min: 1,
                max: 3,
                activeColor: kPrimaryColor,
                autofocus: true,
                divisions: 2,
                inactiveColor: kPrimaryLightColor,
                label: myLabel,
                onChanged: (value) {
                  setState(() {
                    level[index] = value;
                    if (value == 1) {
                      myLabel = "Bajo";
                    }
                    if (value == 2) {
                      myLabel = "Medio";
                    }
                    if (value == 3) {
                      myLabel = "Alto";
                    }
                  });
                },
              ),
              Text("Alto"),
            ],
          ),
        ),
      ],
    );
  }

  double getHeightLineSeparator(int index) {
    print(index);
    if (index == 0 || index == 8 || index == 18 || index == 30) {
      return 6.0;
    } else {
      return 1.0;
    }
  }

  getNameByIndex(int index) {
    if (index == 0) {
      return Container(
        child: Text(
          "Lenguaje Comprensivo",
          style: TextStyle(fontSize: 28, color: kPrimaryColor),
        ),
      );
    }
    if (index == 8) {
      return Container(
        child: Text(
          "Lectura",
          style: TextStyle(fontSize: 28, color: kPrimaryColor),
        ),
      );
    }
    if (index == 18) {
      return Container(
        child: Text(
          "Escritura",
          style: TextStyle(fontSize: 28, color: kPrimaryColor),
        ),
      );
    }
    if (index == 30) {
      return Container(
        child: Text(
          "Nominacion",
          style: TextStyle(fontSize: 28, color: kPrimaryColor),
        ),
      );
    }
    return Container();
  }
}
