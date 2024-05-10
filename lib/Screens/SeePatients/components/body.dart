import 'package:afasia/Screens/AssignTest/assign_test_screen.dart';
import 'package:afasia/Screens/SeePatients/components/background.dart';
import 'package:afasia/constants.dart';
import 'package:afasia/database/database.dart';
import 'package:afasia/database/models/paciente.class.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  // String rut = "156";
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  AfasiaDatabase db = AfasiaDatabase();
  // String rut;
  // _BodyState(this.rut);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return FutureBuilder(
      future: db.initDB(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return _showBody(context);
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
    // Paciente x = new Paciente("1111111", "asdasd", "asdasd", "masculino",
    //     "12-12-12", "123456789", "11111111-1", 0);
    // db.insertPaciente(x);
    Size size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: db.getPacientesByFono(),
      builder: (BuildContext context, AsyncSnapshot<List<Paciente>> snapshot) {
        if (snapshot.hasData) {
          return Background(
            child: SizedBox(
              width: double.infinity,
              child: DataTable(
                showCheckboxColumn: false,
                columns: <DataColumn>[
                  DataColumn(
                    label: Container(
                      width: size.width * 0.1,
                      child: Text(
                        'Rut',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Container(
                      width: size.width * 0.5,
                      child: Text(
                        'Nombre',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Container(
                      width: size.width * 0.14,
                      child: Text(
                        'Actividades',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
                rows: <DataRow>[
                  for (Paciente p in snapshot.data)
                    DataRow(
                      onSelectChanged: (bool select) {
                        db.getAllActividades().then((value) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return AssignTestScreen(
                                  rut_paciente: p.toMap()["rut_paciente"],
                                  actividades: value,
                                );
                              },
                            ),
                          );
                        });
                      },
                      cells: <DataCell>[
                        DataCell(Text(
                          p.toMap()["rut_paciente"],
                          style: TextStyle(fontSize: 18),
                        )),
                        DataCell(Text(
                          p.toMap()["nombre"] + " " + p.toMap()["apellido"],
                          style: TextStyle(fontSize: 18),
                        )),
                        DataCell(
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Icon(Icons.assignment),
                                iconSize: 30,
                                color: kPrimaryColor,
                                onPressed: () {
                                  db.getAllActividades().then((value) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return AssignTestScreen(
                                            rut_paciente:
                                                p.toMap()["rut_paciente"],
                                            actividades: value,
                                          );
                                        },
                                      ),
                                    );
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          );
        } else {
          return Center(
            child: Text("Aun no hay pacientes"),
          );
        }
      },
    );
  }
}
