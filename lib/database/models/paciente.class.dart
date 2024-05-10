class Paciente {
  String rut_paciente;
  String nombre;
  String apellido;
  String genero;
  String fecha_nacimiento;
  String numero_contacto;
  String rut_fonoaudiologo;
  int actualizado;

  Paciente(
    this.rut_paciente,
    this.nombre,
    this.apellido,
    this.genero,
    this.fecha_nacimiento,
    this.numero_contacto,
    this.rut_fonoaudiologo,
    this.actualizado,
  );

  Map<String, dynamic> toMap() {
    return {
      "rut_paciente": rut_paciente,
      "nombre": nombre,
      "apellido": apellido,
      "genero": genero,
      "fecha_nacimiento": fecha_nacimiento,
      "numero_contacto": numero_contacto,
      "rut_fonoaudiologo": rut_fonoaudiologo,
      "actualizado": actualizado,
    };
  }

  Paciente.fromMap(Map<String, dynamic> map) {
    rut_paciente = map['rut_paciente'];
    nombre = map['nombre'];
    apellido = map['apellido'];
    genero = map['genero'];
    fecha_nacimiento = map['fecha_nacimiento'];
    numero_contacto = map['numero_contacto'];
    rut_fonoaudiologo = map['rut_fonoaudiologo'];
    actualizado = map['actualizado'];
  }
}
