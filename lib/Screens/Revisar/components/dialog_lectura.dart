import 'package:afasia/constants.dart';
import 'package:afasia/database/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDialogLectura extends StatefulWidget {
  final actividad;

  const MyDialogLectura({Key key, this.actividad}) : super(key: key);
  @override
  _MyDialogLectura createState() => new _MyDialogLectura(actividad);
}

class _MyDialogLectura extends State<MyDialogLectura> {
  var actividad;
  _MyDialogLectura(this.actividad);

  @override
  Widget build(BuildContext context) {
    var comentario = correccionLectura[actividad["audio"]].toString();

    print(correccionLectura.length);
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
            correccionLectura[actividad["audio"]] = newValue;
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
            print(await db.updateLectura(actividad));
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
