import 'package:afasia/Screens/PacientesARevisar/components/background.dart';
import 'package:afasia/Screens/PacientesARevisar/components/table_names_columns.dart';
import 'package:afasia/components/rounded_button.dart';
import 'package:afasia/components/rounded_button_bottom_icon.dart';
import 'package:afasia/constants.dart';
import 'package:afasia/database/database.dart';
import 'package:afasia/database/models/actividad.class.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class Body extends StatefulWidget {
  Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  initState() {
    chargeData();
    super.initState();
  }

  var pacientes;
  var copias;
  var lecturaOraciones;
  var reconocimientoAuditivo;
  var escrituraAlDictado;
  var completacionDeOraciones;
  var comprensionInhibicion;

  List<bool> checked = [];
  List<double> level = [];
  String myLabel;

  AfasiaDatabase db = AfasiaDatabase();

  String rut_paciente;
  List<Actividad> actividades;
  _BodyState();
  var flag = true;

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
          Container(
            child: TextButton(
              child: flag ? Text("Hola") : Text("chao"),
              onPressed: () {
                flag = !flag;
                setState(() {});
              },
            ),
          ),
          // getBodyTable(size),
          // Container(
          //   color: kPrimaryLightColor,
          //   height: 8,
          // ),
          // RoundedButton(
          //   width: size.width * 0.8,
          //   text: "REVISAR TEST DEL PACIENTE",
          //   press: () {
          //     List<int> actividadesAsignadas = [checked.length];
          //     print("al asignar: " + rut_paciente);
          //     rutPacienteTrabajando = rut_paciente;
          //     int firstId = -1;
          //     for (int i = 0; i < checked.length; i++) {
          //       if (checked[i]) {
          //         actividadesAsignadas[i] = level[i].toInt();
          //         if (firstId == -1) firstId = i;
          //       } else {
          //         actividadesAsignadas[i] = 0;
          //       }
          //     }
          //     Navigator.of(context).pushAndRemoveUntil(
          //         MaterialPageRoute(
          //           builder: (context) =>
          //               getNext(firstId, actividadesAsignadas),
          //         ),
          //         (route) => false);
          //   },
          // ),
        ],
      ),
    );
  }

  Container getBodyTable(Size size) {
    if (checked.isEmpty)
      for (var i = 0; i < actividades.length; i++) {
        checked.add(false);
        level.add(2);
      }
    return Container(
      width: double.infinity,
      height: size.height * 0.78,
      child: ListView(
        children: [
          Column(
            children: List<Row>.generate(
              actividades.length * 2,
              (index) {
                if (index % 2 == 0) {
                  return getRow(size, (index ~/ 2));
                } else {
                  return Row(
                    children: [
                      Container(
                        height: 1,
                        width: size.width,
                        color: kPrimaryLightColor,
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ],
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
          width: size.width * 0.5,
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

          child: Slider(
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
                  myLabel = "Fácil";
                }
                if (value == 2) {
                  myLabel = "Media";
                }
                if (value == 3) {
                  myLabel = "Difícil";
                }
              });
            },
          ),
        ),
      ],
    );
  }

  Future<void> chargeData() async {
    AfasiaDatabase db = new AfasiaDatabase();
    await db.initDB();
    pacientes = db.getAllPacientes();

    copias = await db.getAllCopias();
    lecturaOraciones = await db.getAllLecturaOraciones();
    reconocimientoAuditivo = await db.getAllReconocimientoAuditivo();
    escrituraAlDictado = await db.getAllEscrituraAlDictado();
    completacionDeOraciones = await db.getAllCompletacionOraciones();
    comprensionInhibicion = await db.getAllComprensionInhibicion();
  }
}
