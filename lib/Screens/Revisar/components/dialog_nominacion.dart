import 'package:afasia/constants.dart';
import 'package:afasia/database/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDialogNominacion extends StatefulWidget {
  final actividad;
  final id;

  const MyDialogNominacion({Key key, this.actividad, this.id})
      : super(key: key);
  @override
  _MyDialogNominacion createState() => new _MyDialogNominacion(actividad, id);
}

class _MyDialogNominacion extends State<MyDialogNominacion> {
  var actividad;
  var id;
  _MyDialogNominacion(this.actividad, this.id);

  @override
  Widget build(BuildContext context) {
    var comentario = id == 1
        ? correccionNominacionAcciones[actividad["audio"]].toString()
        : correccionNominacionObjetos[actividad["audio"]].toString();

    // var comentario = "Correcto";
    AfasiaDatabase db = AfasiaDatabase();

    return AlertDialog(
      title: new Text("Corrección del ejercicio"),
      content: DropdownButton(
        value: comentario,
        icon: const Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: const TextStyle(color: kPrimaryColor),
        underline: Container(
          height: 3,
          color: kPrimaryColor,
        ),
        onChanged: (String newValue) {
          print(newValue);
          setState(() {
            if (id == 1) {
              correccionNominacionAcciones[actividad["audio"]] = newValue;
            } else {
              correccionNominacionObjetos[actividad["audio"]] = newValue;
            }
          });
        },
        items: <String>['Correcto', 'Incorrecto']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Aceptar'),
          onPressed: () async {
            actividad["revisado"] = 1;
            actividad["comentario"] = comentario;
            await db.initDB();
            if (id == 1) {
              print(await db.updateNominacionAcciones(actividad));
            } else {
              print(await db.updateNominacionObjetos(actividad));
            }

            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
