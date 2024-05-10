class Question {
  final int id;
  final String question;
  final String audio;

  Question({this.id, this.question, this.audio});
}

const List data1 = [
  {
    "id": 1,
    "question": "Escriba su nombre completo",
    "audio": "assets/audio/nombreCompleto.mp3",
  },
  {
    "id": 2,
    "question": "Escriba los números del 1 al 10",
    "audio": "assets/audio/numeros1to10.mp3",
  },
];

const List data2 = [
  {
    "id": 1,
    "question": "Escriba los 7 días de la semana",
    "audio": "assets/audio/diasDeLaSemana.mp3",
  },
];

const List data3 = [
  {
    "id": 1,
    "question": "Escriba todos los meses del año",
    "audio": "---",
  },
];
