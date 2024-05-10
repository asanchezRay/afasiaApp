import 'package:afasia/constants.dart';
import 'package:afasia/database/models/actividad.class.dart';
import 'package:afasia/database/models/completacionOraciones.class.dart';
import 'package:afasia/database/models/copia.class.dart';
import 'package:afasia/database/models/escrituraAlDictado.dart';
import 'package:afasia/database/models/fonoaudiologo.class.dart';
import 'package:afasia/database/models/lecturaComprensiva.class.dart';
import 'package:afasia/database/models/lecturaOraciones.class.dart';
import 'package:afasia/database/models/paciente.class.dart';
import 'package:afasia/database/models/comprensionInhibicion.class.dart';
import 'package:afasia/database/models/reconocimientoAuditivo.class.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

import 'models/nominacion.dart';

class AfasiaDatabase {
  Database afasia_db;

  initDB() async {
    afasia_db = await openDatabase(
      'afasia_db.db',
      version: 3,
      onCreate: (Database db, int version) {
        db.execute(
            "CREATE TABLE paciente (rut_paciente TEXT PRIMARY KEY, nombre TEXT, apellido TEXT, genero TEXT, fecha_nacimiento TEXT, numero_contacto TEXT, rut_fonoaudiologo TEXT, actualizado INTEGER)");
        db.execute(
            "CREATE TABLE fonoaudiologo (rut_fonoaudiologo TEXT PRIMARY KEY, nombre TEXT, apellido TEXT, correo TEXT, genero TEXT, fecha_nacimiento TEXT, imagen TEXT)");
        db.execute(
            "CREATE TABLE actividad (id INTEGER PRIMARY KEY, nombre_actividad TEXT)");
        db.execute(
            "CREATE TABLE lecturaOraciones (id INTEGER PRIMARY KEY autoincrement, id_actividad INTEGER, rut_paciente TEXT, estimulo TEXT, audio TEXT, revisado INTEGER, comentario TEXT)");
        db.execute(
            "CREATE TABLE copia (id INTEGER PRIMARY KEY autoincrement, id_actividad INTEGER, rut_paciente TEXT, imagen TEXT, revisado INTEGER, comentario TEXT)");
        db.execute(
            "CREATE TABLE escrituraAlDictado (id INTEGER PRIMARY KEY autoincrement, id_actividad INTEGER, rut_paciente TEXT, imagen TEXT, revisado INTEGER, audio TEXT, comentario TEXT)");
        db.execute(
            "CREATE TABLE reconocimientoAuditivo (id INTEGER PRIMARY KEY autoincrement, id_actividad INTEGER, rut_paciente TEXT, estimulo TEXT, intentos INTEGER, imagen1 TEXT, imagen2 TEXT, imagen3 TEXT, isCorrecta INTEGER, revisado INTEGER)");
        db.execute(
            "CREATE TABLE lecturaComprensiva (id INTEGER PRIMARY KEY autoincrement, id_actividad INTEGER, rut_paciente TEXT, estimulo TEXT, intentos INTEGER, opcion1 TEXT, opcion2 TEXT, opcion3 TEXT, isCorrecta INTEGER, revisado INTEGER)");
        db.execute(
            "CREATE TABLE nominacionAcciones (id INTEGER PRIMARY KEY autoincrement, id_actividad INTEGER, rut_paciente TEXT, estimulo TEXT, audio TEXT, revisado INTEGER, comentario TEXT)");
        db.execute(
            "CREATE TABLE nominacionObjetos (id INTEGER PRIMARY KEY autoincrement, id_actividad INTEGER, rut_paciente TEXT, estimulo TEXT, audio TEXT, revisado INTEGER, comentario TEXT)");
        db.execute(
            "CREATE TABLE completacionOraciones (id INTEGER PRIMARY KEY autoincrement, id_actividad INTEGER, rut_paciente TEXT, estimulo TEXT, intentos INTEGER, imagen1 TEXT, imagen2 TEXT, imagen3 TEXT, isCorrecta INTEGER, revisado INTEGER)");
        db.execute(
            "CREATE TABLE comprensionInhibicion (id INTEGER PRIMARY KEY autoincrement, id_actividad INTEGER, rut_paciente TEXT, estimulo TEXT, intentos INTEGER, imagen1 TEXT, imagen2 TEXT, imagen3 TEXT, imagen4 TEXT, isCorrecta INTEGER, revisado INTEGER)");
      },
    );
    print("DB Initialized");
  }

  //Paciente
  Future insertPaciente(Paciente paciente) async {
    return afasia_db.insert("paciente", paciente.toMap());
  }

  Future insertarActividadLecturaOraciones(LecturaOraciones actividad) async {
    print(actividad.toMap());
    var id = await afasia_db.insert("lecturaOraciones", actividad.toMap());
    print(id);
    return id;
  }

  Future insertarActividadNominacionObjetos(Nominacion actividad) async {
    print(actividad.toMap());
    var id = await afasia_db.insert("nominacionObjetos", actividad.toMap());
    print(id);
    return id;
  }

  Future insertarActividadNominacionAcciones(Nominacion actividad) async {
    print(actividad.toMap());
    var id = await afasia_db.insert("nominacionAcciones", actividad.toMap());
    print(id);
    return id;
  }

  Future insertarActividadReconocimientoAuditivo(
      ReconocimientoAuditivo actividad) async {
    print(actividad.toMap());
    var id =
        await afasia_db.insert("reconocimientoAuditivo", actividad.toMap());
    print("ID ACTIVIDAD: " + id.toString());
    return id;
  }

  Future insertarActividadLecturaComprensiva(
      LecturaComprensiva actividad) async {
    print(actividad.toMap());
    var id = await afasia_db.insert("lecturaComprensiva", actividad.toMap());
    print("ID ACTIVIDAD: " + id.toString());
    return id;
  }

  Future insertarActividadCompletacionDeOraciones(
      CompletacionOraciones actividad) async {
    print(actividad.toMap());
    var id = await afasia_db.insert("completacionOraciones", actividad.toMap());
    print("ID ACTIVIDAD: " + id.toString());
    return id;
  }

  Future insertarActividadCopia(Copia actividad) async {
    print(actividad.toMap());
    var id = await afasia_db.insert("copia", actividad.toMap());
    print("ID ACTIVIDAD: " + id.toString());
    return id;
  }

  Future insertarActividadEscrituraAlDictado(
      EscrituraAlDictado actividad) async {
    print(actividad.toMap());
    var id = await afasia_db.insert("escrituraAlDictado", actividad.toMap());
    print("ID ACTIVIDAD: " + id.toString());
    return id;
  }

  Future insertarActividadComprensionInhibicion(
      ComprensionInhibicion actividad) async {
    print(actividad.toMap());
    var id = await afasia_db.insert("comprensionInhibicion", actividad.toMap());
    print("ID ACTIVIDAD: " + id.toString());
    return id;
  }

  Future<List<Paciente>> getAllPacientes() async {
    List<Map<String, dynamic>> resultados = await afasia_db.query("paciente");
    return resultados.map((map) => Paciente.fromMap(map)).toList();
  }

  Future<List<Paciente>> getPacientesByFono() async {
    var rut = fonoActivo.rut_fonoaudiologo;
    List<Map<String, dynamic>> resultados = await afasia_db
        .query("paciente", where: 'rut_fonoaudiologo = ?', whereArgs: [rut]);
    var x = resultados.map((map) => Paciente.fromMap(map)).toList();
    print(x);

    return x;
  }

  Future<List<LecturaOraciones>> getAllLecturaOraciones() async {
    var resultados = await afasia_db.query("lecturaOraciones");
    return resultados.map((map) => LecturaOraciones.fromMap(map)).toList();
  }

  Future<List<Nominacion>> getAllNominacionObjetos() async {
    var resultados = await afasia_db.query("nominacionObjetos");
    return resultados.map((map) => Nominacion.fromMap(map)).toList();
  }

  Future<List<Nominacion>> getAllNominacionAcciones() async {
    var resultados = await afasia_db.query("nominacionAcciones");

    return resultados.map((map) => Nominacion.fromMap(map)).toList();
  }

  Future<List<ReconocimientoAuditivo>> getAllReconocimientoAuditivo() async {
    var resultados = await afasia_db.query("reconocimientoAuditivo");

    return resultados
        .map((map) => ReconocimientoAuditivo.fromMap(map))
        .toList();
  }

  Future<List<LecturaComprensiva>> getAllLecturaComprensiva() async {
    var resultados = await afasia_db.query("lecturaComprensiva");

    return resultados.map((map) => LecturaComprensiva.fromMap(map)).toList();
  }

  Future<List<Copia>> getAllCopias() async {
    var resultados = await afasia_db.query("copia");

    return resultados.map((map) => Copia.fromMap(map)).toList();
  }

  Future<List<EscrituraAlDictado>> getAllEscrituraAlDictado() async {
    var resultados = await afasia_db.query("EscrituraAldictado");

    return resultados.map((map) => EscrituraAlDictado.fromMap(map)).toList();
  }

  Future<List<CompletacionOraciones>> getAllCompletacionOraciones() async {
    var resultados = await afasia_db.query("completacionOraciones");

    return resultados.map((map) => CompletacionOraciones.fromMap(map)).toList();
  }

  Future<List<ComprensionInhibicion>> getAllComprensionInhibicion() async {
    var resultados = await afasia_db.query("comprensionInhibicion");

    return resultados.map((map) => ComprensionInhibicion.fromMap(map)).toList();
  }

  Future<String> getCountPacienteOff() async {
    List<Map<String, dynamic>> resultados = await afasia_db.rawQuery(
        "SELECT COUNT(rut_paciente) AS count FROM paciente WHERE actualizado = 0");
    return resultados.first["count"].toString();
  }

  Future<List<Paciente>> getAllPacienteOff() async {
    // bool actualizado = true;
    List<Map<String, dynamic>> resultados = await afasia_db.query(
      "paciente",
      where: "actualizado = 0",
      // whereArgs: [actualizado],
    );
    return resultados.map((map) => Paciente.fromMap(map)).toList();
  }

  Future<List<Paciente>> updateAllPacienteOff(
      List<Map<String, dynamic>> paciente) async {
    for (var i = 0; i < paciente.length; i++) {
      await afasia_db.update(
        "paciente",
        paciente[i],
        where: "rut_paciente = ?",
        whereArgs: [paciente[i]["rut_paciente"]],
      );
    }
  }

  Future<int> updateCopia(copia) async {
    return await afasia_db.update('copia', copia,
        where: 'imagen = ?', whereArgs: [copia["imagen"]]);
  }

  Future<int> updateLectura(actividad) async {
    return await afasia_db.update('lecturaOraciones', actividad,
        where: 'audio = ?', whereArgs: [actividad["audio"]]);
  }

  Future<int> updateLecturaComprensiva(actividad) async {
    return await afasia_db.update('lecturaComprensiva', actividad,
        where: 'estimulo = ?', whereArgs: [actividad["estimulo"]]);
  }

  Future<int> updateEscrituraAlDictado(actividad) async {
    return await afasia_db.update('escrituraAlDictado', actividad,
        where: 'audio = ?', whereArgs: [actividad["audio"]]);
  }

  Future<int> updateNominacionAcciones(actividad) async {
    return await afasia_db.update('nominacionAcciones', actividad,
        where: 'audio = ?', whereArgs: [actividad["audio"]]);
  }

  Future<int> updateNominacionObjetos(actividad) async {
    return await afasia_db.update('nominacionObjetos', actividad,
        where: 'audio = ?', whereArgs: [actividad["audio"]]);
  }

  Future<int> updateReconocimientoAuditivo(actividad) async {
    return await afasia_db.update('reconocimientoAuditivo', actividad,
        where: 'id = ?', whereArgs: [actividad["id"]]);
  }

  Future<int> updateComprensionInhibicion(actividad) async {
    return await afasia_db.update('comprensionInhibicion', actividad,
        where: 'id = ?', whereArgs: [actividad["id"]]);
  }

  Future<int> updateCompletacionOraciones(actividad) async {
    return await afasia_db.update('completacionOraciones', actividad,
        where: 'id = ?', whereArgs: [actividad["id"]]);
  }

  Future<List<Paciente>> verifyPaciente(String rut_paciente) async {
    List<Map<String, dynamic>> resultados = await afasia_db.query(
      "paciente",
      columns: ["rut_paciente"],
      where: "rut_paciente = ?",
      whereArgs: [rut_paciente],
    );
    return resultados.map((map) => Paciente.fromMap(map)).toList();
  }

  //Fonoaudiologo
  Future insertFonoaudiologo(Fonoaudiologo fonoaudiologo) async {
    return afasia_db.insert("fonoaudiologo", fonoaudiologo.toMap());
  }

  Future<int> updateImagenFono(fono) async {
    return await afasia_db.update('fonoaudiologo', fono,
        where: 'rut_fonoaudiologo = ?', whereArgs: [fono["rut_fonoaudiologo"]]);
  }

  deleteFonoaudiologo() async {
    afasia_db.delete("fonoaudiologo");
  }

  Future<List<Fonoaudiologo>> getFonoaudiologo() async {
    List<Map<String, dynamic>> resultados =
        await afasia_db.query("fonoaudiologo");
    return resultados.map((map) => Fonoaudiologo.fromMap(map)).toList();
  }

  //Actividades
  void insertAllActivities() {
    for (String i in activitiesName) {
      insertarActividad(i);
    }
  }

  insertarActividad(String nombre_actividad) async {
    afasia_db.insert("actividad", {"nombre_actividad": nombre_actividad});
  }

  Future<List<Actividad>> getAllActividades() async {
    List<Map<String, dynamic>> resultados = await afasia_db.query("actividad");
    return resultados.map((map) => Actividad.fromMap(map)).toList();
  }

  getLenghtActivities() async {
    List<Map<String, dynamic>> resultados = await afasia_db.query("actividad");

    return resultados.length;
  }

  getLenghtFonoaudiologo() async {
    List<Map<String, dynamic>> resultados =
        await afasia_db.query("fonoaudiologo");

    return resultados.length;
  }

  getDataWelcome() async {
    List<Map<String, dynamic>> resultado = [];
    int actividades = await getLenghtActivities();
    int fonos = await getLenghtFonoaudiologo();

    resultado.add(
        {"contador_actividad": actividades, "contador_fonoaudiologo": fonos});

    return resultado;
  }
}
