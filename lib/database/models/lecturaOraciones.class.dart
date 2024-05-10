class LecturaOraciones {
  String estimulo;
  String audio;
  String rut_paciente;
  int revisado;
  int id_actividad;
  String comentario = "Correcto";

  LecturaOraciones(
    this.rut_paciente,
    this.id_actividad,
    this.estimulo,
    this.audio,
    this.revisado,
  );
  Map<String, dynamic> toMap() {
    return {
      "rut_paciente": rut_paciente,
      "id_actividad": id_actividad,
      "estimulo": estimulo,
      "audio": audio,
      "revisado": revisado,
      "comentario": comentario,
    };
  }

  LecturaOraciones.fromMap(Map<String, dynamic> map) {
    rut_paciente = map['rut_paciente'];
    id_actividad = map['id_actividad'];
    estimulo = map['estimulo'];
    audio = map['audio'];
    revisado = map['revisado'];
    comentario = map['comentario'];
  }
}
