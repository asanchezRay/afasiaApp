class Fonoaudiologo {
  String rut_fonoaudiologo;
  String nombre;
  String apellido;
  String correo;
  String genero;
  String fecha_nacimiento;
  String imagen = "";

  Fonoaudiologo(
    this.rut_fonoaudiologo,
    this.nombre,
    this.apellido,
    this.correo,
    this.genero,
    this.fecha_nacimiento,
  );

  Map<String, dynamic> toMap() {
    return {
      "rut_fonoaudiologo": rut_fonoaudiologo,
      "nombre": nombre,
      "apellido": apellido,
      "correo": correo,
      "genero": genero,
      "fecha_nacimiento": fecha_nacimiento,
      "imagen": imagen,
    };
  }

  Fonoaudiologo.fromMap(Map<String, dynamic> map) {
    rut_fonoaudiologo = map['rut_fonoaudiologo'];
    nombre = map['nombre'];
    apellido = map['apellido'];
    correo = map['correo'];
    genero = map['genero'];
    fecha_nacimiento = map['fecha_nacimiento'];
    imagen = map['imagen'];
  }
}
