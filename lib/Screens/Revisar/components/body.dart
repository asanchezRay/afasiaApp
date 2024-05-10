import 'dart:io';

import 'package:afasia/Screens/Activities/Close/close_screen.dart';
import 'package:afasia/Screens/AssignTest/assign_test_screen.dart';
import 'package:afasia/Screens/Revisar/components/background.dart';
import 'package:afasia/Screens/Revisar/components/dialog_alDictado.dart';
import 'package:afasia/Screens/Revisar/components/dialog_copia.dart';
import 'package:afasia/Screens/Revisar/components/dialog_lectura.dart';
import 'package:afasia/Screens/Revisar/components/dialog_nominacion.dart';
import 'package:afasia/Screens/Revisar/views/completacion_oraciones_view.dart';
import 'package:afasia/Screens/Revisar/views/comprension_inhibicion_view.dart';
import 'package:afasia/Screens/Revisar/views/copias_view.dart';
import 'package:afasia/Screens/Revisar/views/escritura_al_dictado_view.dart';
import 'package:afasia/Screens/Revisar/views/lectura_compresiva_view.dart';
import 'package:afasia/Screens/Revisar/views/lecturas_view.dart';
import 'package:afasia/Screens/Revisar/views/nominacion_view.dart';
import 'package:afasia/Screens/Revisar/views/reconocimiento_auditivo_view.dart';
import 'package:afasia/Screens/Welcome/welcome_screen.dart';
import 'package:afasia/components/rounded_button.dart';
import 'package:afasia/constants.dart';
import 'package:afasia/database/database.dart';
import 'package:afasia/database/models/completacionOraciones.class.dart';
import 'package:afasia/database/models/comprensionInhibicion.class.dart';
import 'package:afasia/database/models/copia.class.dart';
import 'package:afasia/database/models/escrituraAlDictado.dart';
import 'package:afasia/database/models/lecturaComprensiva.class.dart';
import 'package:afasia/database/models/lecturaOraciones.class.dart';
import 'package:afasia/database/models/nominacion.dart';
import 'package:afasia/database/models/paciente.class.dart';
import 'package:afasia/database/models/reconocimientoAuditivo.class.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path_provider_ex/path_provider_ex.dart';
import 'package:storage_path/storage_path.dart';

class Body extends StatefulWidget {
  // String rut = "156";
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  AfasiaDatabase db = AfasiaDatabase();
  var pacientesAbiertos = {};
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
      future: getDataPaciente(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
            width: size.width,
            child: snapshot.data,
          );
        } else {
          return Center(
            child: Text("Aun no hay pacientes"),
          );
        }
      },
    );
  }

  Future<Widget> getDataPaciente() async {
    AfasiaDatabase db = AfasiaDatabase();
    await db.initDB();
    var pacientes = await db.getPacientesByFono();
    var auditivos = await db.getAllReconocimientoAuditivo();
    var inhibicion = await db.getAllComprensionInhibicion();
    var completacionOraciones = await db.getAllCompletacionOraciones();
    var lectura = await db.getAllLecturaOraciones();
    var copias = await db.getAllCopias();

    var lecturaComprensiva = await db.getAllLecturaComprensiva();
    var escrituraAlDictado = await db.getAllEscrituraAlDictado();
    var nominacionAcciones = await db.getAllNominacionAcciones();
    var nominacionObjetos = await db.getAllNominacionObjetos();
    var storageInfo = await PathProviderEx.getStorageInfo();
    final directory = await getApplicationDocumentsDirectory();
    var imagePath = await StoragePath.imagesPath;

    print(storageInfo[0].appFilesDir);

    print(imagePath);

    for (Paciente p in pacientes) {
      if (pacientesAbiertos[p.toMap()["rut_paciente"]] == null)
        pacientesAbiertos[p.toMap()["rut_paciente"]] = false;
    }

    return ListView(
      children: [
        for (Paciente p in pacientes)
          verificaArreglos(
                  p.toMap(),
                  auditivos,
                  inhibicion,
                  completacionOraciones,
                  lectura,
                  copias,
                  lecturaComprensiva,
                  escrituraAlDictado,
                  nominacionAcciones,
                  nominacionObjetos)
              ? Container(
                  child: Column(
                    children: [
                      TextButton(
                        onPressed: () {
                          pacientesAbiertos[p.toMap()["rut_paciente"]] =
                              !pacientesAbiertos[p.toMap()["rut_paciente"]];

                          setState(() {});
                        },
                        child: Text(
                          p.toMap()["nombre"] + ' ' + p.toMap()["apellido"],
                          style: TextStyle(fontSize: 35, color: kPrimaryColor),
                        ),
                      ),
                      pacientesAbiertos[p.toMap()["rut_paciente"]]
                          ? generateAuditivo(p.toMap(), auditivos, 1)
                          : Container(),
                      pacientesAbiertos[p.toMap()["rut_paciente"]]
                          ? generateAuditivo(p.toMap(), auditivos, 2)
                          : Container(),
                      pacientesAbiertos[p.toMap()["rut_paciente"]]
                          ? generateAuditivo(p.toMap(), auditivos, 3)
                          : Container(),
                      pacientesAbiertos[p.toMap()["rut_paciente"]]
                          ? generateInhibicion(p.toMap(), inhibicion)
                          : Container(),
                      pacientesAbiertos[p.toMap()["rut_paciente"]]
                          ? generateCompletacionOraciones(
                              p.toMap(), completacionOraciones)
                          : Container(),
                      pacientesAbiertos[p.toMap()["rut_paciente"]]
                          ? generateLecturas(p.toMap(), lectura, 0)
                          : Container(),
                      pacientesAbiertos[p.toMap()["rut_paciente"]]
                          ? generateLecturaComprensiva(
                              p.toMap(), lecturaComprensiva)
                          : Container(),
                      pacientesAbiertos[p.toMap()["rut_paciente"]]
                          ? generateLecturas(p.toMap(), lectura, 1)
                          : Container(),
                      pacientesAbiertos[p.toMap()["rut_paciente"]]
                          ? generateCopias(p.toMap(), copias, 1)
                          : Container(),
                      pacientesAbiertos[p.toMap()["rut_paciente"]]
                          ? generateCopias(p.toMap(), copias, 2)
                          : Container(),
                      pacientesAbiertos[p.toMap()["rut_paciente"]]
                          ? generateCopias(p.toMap(), copias, 3)
                          : Container(),
                      pacientesAbiertos[p.toMap()["rut_paciente"]]
                          ? generateCopias(p.toMap(), copias, 4)
                          : Container(),
                      pacientesAbiertos[p.toMap()["rut_paciente"]]
                          ? generateCopias(p.toMap(), copias, 5)
                          : Container(),
                      pacientesAbiertos[p.toMap()["rut_paciente"]]
                          ? generatoEscrituraAlDictado(
                              p.toMap(), escrituraAlDictado)
                          : Container(),
                      pacientesAbiertos[p.toMap()["rut_paciente"]]
                          ? generateNominacion(p.toMap(), nominacionAcciones, 1)
                          : Container(),
                      pacientesAbiertos[p.toMap()["rut_paciente"]]
                          ? generateNominacion(p.toMap(), nominacionObjetos, 2)
                          : Container(),
                      SizedBox(
                        height: 30,
                      ),
                      pacientesAbiertos[p.toMap()["rut_paciente"]]
                          ? RoundedButton(
                              text: "Finalizar Corrección",
                              width: 250,
                              color: kPrimaryColor,
                              press: () {
                                AlertDialog alert = AlertDialog(
                                  title: Text("¿Esta seguro de finalizar?"),
                                  content: Text(
                                      "Una vez finalizada la revisión, no podra acceder a esta información nuevamente."),
                                  actions: [
                                    TextButton(
                                      child: const Text('Aceptar'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      WelcomeScreen(),
                                                ),
                                                (route) => false);
                                        finalizarRevision(
                                            p.toMap(),
                                            auditivos,
                                            inhibicion,
                                            completacionOraciones,
                                            lectura,
                                            copias,
                                            lecturaComprensiva,
                                            escrituraAlDictado,
                                            nominacionAcciones,
                                            nominacionObjetos);
                                      },
                                    ),
                                  ],
                                );
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return alert;
                                  },
                                );
                              },
                            )
                          : Container(),
                      SizedBox(
                        height: 30,
                      ),
                      Divider(
                        color: kPrimaryColor,
                        height: 4,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                )
              : Container(),
      ],
    );
  }

  finalizarRevision(
      p,
      auditivos,
      inhibicion,
      completacionOraciones,
      lectura,
      copias,
      lecturaComprensiva,
      escrituraAlDictado,
      nominacionAcciones,
      nominacionObjetos) {
    var auditivosPaciente = [];
    for (var actividad in auditivos) {
      actividad = actividad.toMap();
      if (actividad["rut_paciente"] == p["rut_paciente"] &&
          actividad["revisado"] == 0) {
        actividad["revisado"] = 1;

        db.updateReconocimientoAuditivo(actividad);
        auditivosPaciente.add(actividad);
      }
    }

    var inhibicionPaciente = [];
    for (var actividad in inhibicion) {
      actividad = actividad.toMap();
      if (actividad["rut_paciente"] == p["rut_paciente"] &&
          actividad["revisado"] == 0) {
        actividad["revisado"] = 1;

        db.updateComprensionInhibicion(actividad);
        inhibicionPaciente.add(actividad);
      }
    }

    var oracionesPaciente = [];
    for (var actividad in completacionOraciones) {
      actividad = actividad.toMap();
      if (actividad["rut_paciente"] == p["rut_paciente"] &&
          actividad["revisado"] == 0) {
        actividad["revisado"] = 1;

        db.updateCompletacionOraciones(actividad);
        oracionesPaciente.add(actividad);
      }
    }

    var lecturaPaciente = [];
    for (var actividad in lectura) {
      actividad = actividad.toMap();
      if (actividad["rut_paciente"] == p["rut_paciente"] &&
          actividad["revisado"] == 0) {
        actividad["revisado"] = 1;
        actividad["comentario"] = "Correcto";
        db.updateLectura(actividad);
        lecturaPaciente.add(actividad);
      }
    }

    var copiasPaciente = [];
    for (var actividad in copias) {
      actividad = actividad.toMap();
      if (actividad["rut_paciente"] == p["rut_paciente"] &&
          actividad["revisado"] == 0) {
        actividad["revisado"] = 1;
        actividad["comentario"] = "Correcto";
        db.updateCopia(actividad);
        copiasPaciente.add(actividad);
      }
    }

    var lecturaComprensivaPaciente = [];
    for (var actividad in lecturaComprensiva) {
      actividad = actividad.toMap();
      if (actividad["rut_paciente"] == p["rut_paciente"] &&
          actividad["revisado"] == 0) {
        actividad["revisado"] = 1;

        db.updateLecturaComprensiva(actividad);
        lecturaComprensivaPaciente.add(actividad);
      }
    }

    var escrituraAlDictadoPaciente = [];
    for (var actividad in escrituraAlDictado) {
      actividad = actividad.toMap();
      if (actividad["rut_paciente"] == p["rut_paciente"] &&
          actividad["revisado"] == 0) {
        actividad["revisado"] = 1;
        actividad["comentario"] = "Correcto";
        db.updateEscrituraAlDictado(actividad);
        escrituraAlDictadoPaciente.add(actividad);
      }
    }

    var nominacionAccionesPaciente = [];
    for (var actividad in nominacionAcciones) {
      actividad = actividad.toMap();
      if (actividad["rut_paciente"] == p["rut_paciente"] &&
          actividad["revisado"] == 0) {
        actividad["revisado"] = 1;
        actividad["comentario"] = "Correcto";
        db.updateNominacionAcciones(actividad);
        nominacionAccionesPaciente.add(actividad);
      }
    }

    var nominacionObjetosPaciente = [];
    for (var actividad in nominacionObjetos) {
      actividad = actividad.toMap();
      if (actividad["rut_paciente"] == p["rut_paciente"] &&
          actividad["revisado"] == 0) {
        actividad["revisado"] = 1;
        actividad["comentario"] = "Correcto";
        db.updateNominacionObjetos(actividad);
        nominacionObjetosPaciente.add(actividad);
      }
    }
  }

  verificaArreglos(
      p,
      auditivos,
      inhibicion,
      completacionOraciones,
      lectura,
      copias,
      lecturaComprensiva,
      escrituraAlDictado,
      nominacionAcciones,
      nominacionObjetos) {
    if (!pacientesAbiertos[p["rut_paciente"]]) {
      Container();
    }
    var auditivosPaciente = [];
    for (var actividad in auditivos) {
      actividad = actividad.toMap();
      if (actividad["rut_paciente"] == p["rut_paciente"] &&
          actividad["revisado"] == 0) {
        auditivosPaciente.add(actividad);
      }
    }

    var inhibicionPaciente = [];
    for (var actividad in inhibicion) {
      actividad = actividad.toMap();
      if (actividad["rut_paciente"] == p["rut_paciente"] &&
          actividad["revisado"] == 0) {
        inhibicionPaciente.add(actividad);
      }
    }

    var oracionesPaciente = [];
    for (var actividad in completacionOraciones) {
      actividad = actividad.toMap();
      if (actividad["rut_paciente"] == p["rut_paciente"] &&
          actividad["revisado"] == 0) {
        oracionesPaciente.add(actividad);
      }
    }

    var lecturaPaciente = [];
    for (var actividad in lectura) {
      actividad = actividad.toMap();
      if (actividad["rut_paciente"] == p["rut_paciente"] &&
          actividad["revisado"] == 0) {
        lecturaPaciente.add(actividad);
      }
    }

    var copiasPaciente = [];

    for (var actividad in copias) {
      actividad = actividad.toMap();
      if (actividad["rut_paciente"] == p["rut_paciente"] &&
          actividad["revisado"] == 0) {
        copiasPaciente.add(actividad);
      }
    }

    var lecturaComprensivaPaciente = [];

    for (var actividad in lecturaComprensiva) {
      actividad = actividad.toMap();
      if (actividad["rut_paciente"] == p["rut_paciente"] &&
          actividad["revisado"] == 0) {
        lecturaComprensivaPaciente.add(actividad);
      }
    }

    var escrituraAlDictadoPaciente = [];

    for (var actividad in escrituraAlDictado) {
      actividad = actividad.toMap();
      if (actividad["rut_paciente"] == p["rut_paciente"] &&
          actividad["revisado"] == 0) {
        escrituraAlDictadoPaciente.add(actividad);
      }
    }

    var nominacionAccionesPaciente = [];

    for (var actividad in nominacionAcciones) {
      actividad = actividad.toMap();
      if (actividad["rut_paciente"] == p["rut_paciente"] &&
          actividad["revisado"] == 0) {
        nominacionAccionesPaciente.add(actividad);
      }
    }

    var nominacionObjetosPaciente = [];

    for (var actividad in nominacionObjetos) {
      actividad = actividad.toMap();
      if (actividad["rut_paciente"] == p["rut_paciente"] &&
          actividad["revisado"] == 0) {
        nominacionObjetosPaciente.add(actividad);
      }
    }

    if (copiasPaciente.length == 0 &&
        auditivosPaciente.length == 0 &&
        inhibicionPaciente.length == 0 &&
        oracionesPaciente.length == 0 &&
        lecturaPaciente.length == 0 &&
        lecturaComprensivaPaciente.length == 0 &&
        escrituraAlDictadoPaciente.length == 0 &&
        nominacionObjetosPaciente.length == 0 &&
        nominacionAccionesPaciente.length == 0) {
      return false;
    } else {
      return true;
    }
  }

  generateAuditivo(p, auditivos, id) {
    var auditivosPaciente = [];
    for (var actividad in auditivos) {
      actividad = actividad.toMap();
      if (actividad["rut_paciente"] == p["rut_paciente"] &&
          actividad["revisado"] == 0 &&
          actividad["id_actividad"] == id) {
        auditivosPaciente.add(actividad);
      }
    }
    var name;
    if (id == 1) {
      name = Text(
        "Reconocimiento Auditivo de objetos aislados",
        style: TextStyle(fontSize: 25),
      );
    }
    if (id == 2) {
      name = Text(
        "Reconocimiento Auditivo de acciones aisladas",
        style: TextStyle(fontSize: 25),
      );
    }
    if (id == 3) {
      name = Text(
        "Reconocimiento Auditivo distractores semánticos",
        style: TextStyle(fontSize: 25),
      );
    }
    if (auditivosPaciente.length != 0) {
      return Column(
        children: [
          Divider(
            color: kPrimaryColor,
            height: 4,
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Container(
                width: 700,
                child: name,
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ReconocimientoAuditivoView(
                          name: name,
                          auditivosPaciente: auditivosPaciente,
                        );
                      },
                    ),
                  );
                },
                icon: Icon(Icons.arrow_forward),
              ),
              // ReconocimientoAuditivoView(auditivosPaciente: auditivosPaciente),
            ],
          ),
        ],
      );
    } else {
      return Container();
    }
  }

  generateInhibicion(p, inhibicion) {
    print(inhibicion.toString());
    var inhibicionPaciente = [];
    for (var actividad in inhibicion) {
      actividad = actividad.toMap();
      if (actividad["rut_paciente"] == p["rut_paciente"] &&
          actividad["revisado"] == 0) {
        inhibicionPaciente.add(actividad);
      }
    }
    var name = Text(
      "Comprensión de Inhibición",
      style: TextStyle(fontSize: 25),
    );
    if (inhibicionPaciente.length != 0) {
      return Column(
        children: [
          Divider(
            color: kPrimaryColor,
            height: 4,
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Container(
                width: 700,
                child: name,
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ComprensionInhibicionView(
                          name: name,
                          inhibicionPaciente: inhibicionPaciente,
                        );
                      },
                    ),
                  );
                },
                icon: Icon(Icons.arrow_forward),
              ),
              // ReconocimientoAuditivoView(auditivosPaciente: auditivosPaciente),
            ],
          ),
        ],
      );
    } else {
      return Container();
    }
  }

  generateCompletacionOraciones(p, completacionOraciones) {
    var oracionesPaciente = [];
    for (var actividad in completacionOraciones) {
      actividad = actividad.toMap();
      if (actividad["rut_paciente"] == p["rut_paciente"] &&
          actividad["revisado"] == 0) {
        oracionesPaciente.add(actividad);
      }
    }
    var name = Text(
      "Completación de oraciones",
      style: TextStyle(fontSize: 25),
    );

    if (oracionesPaciente.length != 0) {
      return Column(
        children: [
          Divider(
            color: kPrimaryColor,
            height: 4,
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Container(
                width: 700,
                child: name,
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return CompletacionOracionesView(
                          name: name,
                          oracionesPaciente: oracionesPaciente,
                        );
                      },
                    ),
                  );
                },
                icon: Icon(Icons.arrow_forward),
              ),
              // ReconocimientoAuditivoView(auditivosPaciente: auditivosPaciente),
            ],
          ),
        ],
      );
    } else {
      return Container();
    }
  }

  generateLecturas(p, lectura, id) {
    var lecturaPaciente = [];
    bool flag = false;
    if (correccionLectura.length != lectura.length) {
      flag = true;
    }
    for (var actividad in lectura) {
      actividad = actividad.toMap();
      if (actividad["rut_paciente"] == p["rut_paciente"] &&
          actividad["revisado"] == 0 &&
          actividad["id_actividad"] == id) {
        if (flag) {
          correccionLectura[actividad["audio"]] = "Correcto";
        }
        lecturaPaciente.add(actividad);
      }
    }
    var name;
    if (id == 1) {
      name = Text(
        "Lectura de palabras",
        style: TextStyle(fontSize: 25),
      );
    }
    if (id == 0) {
      name = Text(
        "Lectura de oraciones simples",
        style: TextStyle(fontSize: 25),
      );
    }

    if (lecturaPaciente.length != 0) {
      return Column(
        children: [
          Divider(
            color: kPrimaryColor,
            height: 4,
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Container(
                width: 700,
                child: name,
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LecturasView(
                          name: name,
                          lecturaPaciente: lecturaPaciente,
                        );
                      },
                    ),
                  );
                },
                icon: Icon(Icons.arrow_forward),
              ),
              // ReconocimientoAuditivoView(auditivosPaciente: auditivosPaciente),
            ],
          ),
        ],
      );
    } else {
      return Container();
    }
  }

  generateCopias(p, copias, id) {
    var copiasPaciente = [];

    bool flag = false;
    if (correccionCopia.length != copias.length) {
      flag = true;
    }
    for (var actividad in copias) {
      actividad = actividad.toMap();
      if (actividad["rut_paciente"] == p["rut_paciente"] &&
          actividad["revisado"] == 0 &&
          actividad["id_actividad"] == id) {
        if (flag) {
          correccionCopia[actividad["imagen"]] = "Correcto";
        }
        copiasPaciente.add(actividad);
      }
    }
    var name;
    if (id == 1) {
      print("Copias" + copias.toString());
      name = Text(
        "Copia de letras",
        style: TextStyle(fontSize: 25),
      );
    }
    if (id == 2) {
      name = Text(
        "Copia de palabras",
        style: TextStyle(fontSize: 25),
      );
    }
    if (id == 3) {
      name = Text(
        "Copia de oraciones",
        style: TextStyle(fontSize: 25),
      );
    }
    if (id == 4) {
      name = Text(
        "Escritura automática",
        style: TextStyle(fontSize: 25),
      );
    }
    if (id == 5) {
      name = Text(
        "Escritura descriptiva",
        style: TextStyle(fontSize: 25),
      );
    }
    if (copiasPaciente.length != 0) {
      return Column(
        children: [
          Divider(
            color: kPrimaryColor,
            height: 4,
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Container(
                width: 700,
                child: name,
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return CopiasView(
                          name: name,
                          copiasPaciente: copiasPaciente,
                        );
                      },
                    ),
                  );
                },
                icon: Icon(Icons.arrow_forward),
              ),
              // ReconocimientoAuditivoView(auditivosPaciente: auditivosPaciente),
            ],
          ),
        ],
      );
    } else {
      return Container();
    }
  }

  _showMaterialDialogLectura(actividad) {
    showDialog(
      context: context,
      builder: (_) {
        return MyDialogLectura(
          actividad: actividad,
        );
      },
    );
  }

  _showMaterialDialogCopia(actividad) {
    showDialog(
      context: context,
      builder: (_) {
        return MyDialogCopia(
          actividad: actividad,
        );
      },
    );
  }

  _showMaterialDialogEscrituraAlDictado(actividad) {
    showDialog(
      context: context,
      builder: (_) {
        return MyDialogAlDictado(
          actividad: actividad,
        );
      },
    );
  }

  generateLecturaComprensiva(p, lecturaComprensiva) {
    var lecturaComprensivaPaciente = [];
    for (var actividad in lecturaComprensiva) {
      actividad = actividad.toMap();
      if (actividad["rut_paciente"] == p["rut_paciente"] &&
          actividad["revisado"] == 0) {
        lecturaComprensivaPaciente.add(actividad);
      }
    }
    var name;

    name = Text(
      "Lectura comprensiva",
      style: TextStyle(fontSize: 25),
    );

    print(lecturaComprensivaPaciente);
    if (lecturaComprensivaPaciente.length != 0) {
      return Column(
        children: [
          Divider(
            color: kPrimaryColor,
            height: 4,
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Container(
                width: 700,
                child: name,
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LecturaComprensivaView(
                          name: name,
                          lecturaComprensivaPaciente:
                              lecturaComprensivaPaciente,
                        );
                      },
                    ),
                  );
                },
                icon: Icon(Icons.arrow_forward),
              ),
              // ReconocimientoAuditivoView(auditivosPaciente: auditivosPaciente),
            ],
          ),
        ],
      );
    } else {
      return Container();
    }
  }

  generatoEscrituraAlDictado(p, escrituraAlDictado) {
    var escrituraAlDictadoPaciente = [];

    bool flag = false;
    if (correccionAlDictado.length == 0) {
      flag = true;
    }

    for (var actividad in escrituraAlDictado) {
      actividad = actividad.toMap();
      if (actividad["rut_paciente"] == p["rut_paciente"] &&
          actividad["revisado"] == 0) {
        if (flag) {
          correccionAlDictado[actividad["audio"]] = "Correcto";
        }
        escrituraAlDictadoPaciente.add(actividad);
      }
    }
    var name;

    name = Text(
      "Escritura al dictado",
      style: TextStyle(fontSize: 25),
    );

    if (escrituraAlDictadoPaciente.length != 0) {
      return Column(
        children: [
          Divider(
            color: kPrimaryColor,
            height: 4,
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Container(
                width: 700,
                child: name,
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return EscrituraAlDictadoView(
                          name: name,
                          escrituraAlDictadoPaciente:
                              escrituraAlDictadoPaciente,
                        );
                      },
                    ),
                  );
                },
                icon: Icon(Icons.arrow_forward),
              ),
              // ReconocimientoAuditivoView(auditivosPaciente: auditivosPaciente),
            ],
          ),
        ],
      );
    } else {
      return Container();
    }
  }

  generateNominacion(p, nominaciones, int id) {
    var nominacionPaciente = [];
    var name;
    bool flagAcciones = false;
    bool flagObjetos = false;
    if (id == 1) {
      if (correccionNominacionAcciones.length != nominaciones.length) {
        flagAcciones = true;
      }
      name = Text(
        "Nominación de acciones",
        style: TextStyle(fontSize: 25),
      );
    } else {
      if (correccionNominacionObjetos.length != nominaciones.length) {
        flagObjetos = true;
      }
      name = Text(
        "Nominación de objetos",
        style: TextStyle(fontSize: 25),
      );
    }

    for (var actividad in nominaciones) {
      actividad = actividad.toMap();
      if (actividad["rut_paciente"] == p["rut_paciente"] &&
          actividad["revisado"] == 0) {
        if (flagAcciones) {
          correccionNominacionAcciones[actividad["audio"]] = "Correcto";
        }
        if (flagObjetos) {
          correccionNominacionObjetos[actividad["audio"]] = "Correcto";
        }
        nominacionPaciente.add(actividad);
      }
    }

    print("Copias" + nominacionPaciente.toString());

    if (nominacionPaciente.length != 0) {
      return Column(
        children: [
          Divider(
            color: kPrimaryColor,
            height: 4,
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Container(
                width: 700,
                child: name,
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return NominacionView(
                          name: name,
                          nominacionPaciente: nominacionPaciente,
                          id: id,
                        );
                      },
                    ),
                  );
                },
                icon: Icon(Icons.arrow_forward),
              ),
              // ReconocimientoAuditivoView(auditivosPaciente: auditivosPaciente),
            ],
          ),
        ],
      );
    } else {
      return Container();
    }
  }

  void _showMaterialDialogNominacion(actividad, id) {
    showDialog(
      context: context,
      builder: (_) {
        return MyDialogNominacion(
          actividad: actividad,
          id: id,
        );
      },
    );
  }
}
