class EscrituraAlDictado {
  String estimulo;
  String imagen;
  String rut_paciente;
  int revisado;
  int id_actividad;
  String audio;
  String comentario = "Correcto";

  EscrituraAlDictado(
    this.rut_paciente,
    this.id_actividad,
    this.imagen,
    this.revisado,
    this.audio,
  );
  Map<String, dynamic> toMap() {
    return {
      "rut_paciente": rut_paciente,
      "id_actividad": id_actividad,
      "imagen": imagen,
      "revisado": revisado,
      "audio": audio,
      "comentario": comentario,
    };
  }

  EscrituraAlDictado.fromMap(Map<String, dynamic> map) {
    rut_paciente = map['rut_paciente'];
    id_actividad = map['id_actividad'];
    imagen = map['imagen'];
    revisado = map['revisado'];
    audio = map['audio'];
    comentario = map['comentario'];
  }
}
