class Copia {
  String estimulo;
  String imagen;
  String rut_paciente;
  int revisado;
  int id_actividad;
  String comentario = "Correcto";

  Copia(
    this.rut_paciente,
    this.id_actividad,
    this.imagen,
    this.revisado,
  );
  Map<String, dynamic> toMap() {
    return {
      "rut_paciente": rut_paciente,
      "id_actividad": id_actividad,
      "imagen": imagen,
      "revisado": revisado,
      "comentario": comentario,
    };
  }

  Copia.fromMap(Map<String, dynamic> map) {
    rut_paciente = map['rut_paciente'];
    id_actividad = map['id_actividad'];
    imagen = map['imagen'];
    revisado = map['revisado'];
    comentario = map['comentario'];
  }
}
