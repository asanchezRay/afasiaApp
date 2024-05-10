class Actividad {
  String nombre_actividad;
  int id;

  Actividad(
    this.nombre_actividad,
    this.id,
  );

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "nombre_actividad": nombre_actividad,
    };
  }

  Actividad.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    nombre_actividad = map['nombre_actividad'];
  }
}
