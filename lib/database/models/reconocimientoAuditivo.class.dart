class ReconocimientoAuditivo {
  String rut_paciente;
  int id;
  int id_actividad;
  String estimulo;
  String intentos;
  String imagen1;
  String imagen2;
  String imagen3;
  int isCorrecta;
  int revisado;

  ReconocimientoAuditivo(
    this.rut_paciente,
    this.id_actividad,
    this.estimulo,
    this.intentos,
    this.imagen1,
    this.imagen2,
    this.imagen3,
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
      "imagen1": imagen1,
      "imagen2": imagen2,
      "imagen3": imagen3,
      "isCorrecta": isCorrecta,
      "revisado": revisado
    };
  }

  ReconocimientoAuditivo.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    rut_paciente = map['rut_paciente'];
    id_actividad = map['id_actividad'];
    estimulo = map['estimulo'];
    intentos = map['intentos'].toString();
    imagen1 = map['imagen1'];
    imagen2 = map['imagen2'];
    imagen3 = map['imagen3'];
    isCorrecta = map['isCorrecta'];
    revisado = map['revisado'];
  }
}
