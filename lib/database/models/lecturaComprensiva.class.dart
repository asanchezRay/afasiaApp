class LecturaComprensiva {
  String rut_paciente;
  int id;
  int id_actividad;
  String estimulo;
  String intentos;
  String opcion1;
  String opcion2;
  String opcion3;
  int isCorrecta;
  int revisado;

  LecturaComprensiva(
    this.rut_paciente,
    this.id_actividad,
    this.estimulo,
    this.intentos,
    this.opcion1,
    this.opcion2,
    this.opcion3,
    this.isCorrecta,
    this.revisado,
  );
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "rut_paciente": rut_paciente,
      "id_actividad": id_actividad,
      "estimulo": estimulo,
      "intentos": intentos,
      "opcion1": opcion1,
      "opcion2": opcion2,
      "opcion3": opcion3,
      "isCorrecta": isCorrecta,
      "revisado": revisado
    };
  }

  LecturaComprensiva.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    rut_paciente = map['rut_paciente'];
    id_actividad = map['id_actividad'];
    estimulo = map['estimulo'];
    intentos = map['intentos'].toString();
    opcion1 = map['opcion1'];
    opcion2 = map['opcion2'];
    opcion3 = map['opcion3'];
    isCorrecta = map['isCorrecta'];
    revisado = map['revisado'];
  }
}
