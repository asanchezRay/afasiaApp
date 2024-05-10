import 'package:afasia/constants.dart';
import 'package:afasia/database/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDialogCopia extends StatefulWidget {
  final actividad;

  const MyDialogCopia({Key key, this.actividad}) : super(key: key);
  @override
  _MyDialogCopia createState() => new _MyDialogCopia(actividad);
}

class _MyDialogCopia extends State<MyDialogCopia> {
  var actividad;
  _MyDialogCopia(this.actividad);

  @override
  Widget build(BuildContext context) {
    var comentario = correccionCopia[actividad["imagen"]].toString();
    print(correccionCopia.toString());
    // var comentario = actividad["comentario"].toString();
    print("Actividad");
    print(actividad);
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
            correccionCopia[actividad["imagen"]] = newValue;
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
            print(await db.updateCopia(actividad));
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
