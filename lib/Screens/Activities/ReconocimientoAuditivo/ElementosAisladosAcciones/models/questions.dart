class Question {
  final int id, answer;
  final String question, audio;

  final List<String> options;

  Question({this.id, this.question, this.answer, this.options, this.audio});
}

//data para los faciles
const List data1 = [
  {
    "id": 1,
    "question": "",
    "options": [
      "assets/images/comer.jpg",
      "assets/images/cocinar.jpg",
      "assets/images/escribir.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/comer.mp3"
  },
  {
    "id": 2,
    "question": "",
    "options": [
      "assets/images/comer.jpg",
      "assets/images/escribir.jpg",
      "assets/images/cocinar.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/cocinar.mp3"
  },
  {
    "id": 3,
    "question": "",
    "options": [
      "assets/images/escribir.jpg",
      "assets/images/cocinar.jpg",
      "assets/images/comer.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/escribir.mp3"
  },
  {
    "id": 4,
    "question": "",
    "options": [
      "assets/images/mirar.jpg",
      "assets/images/dormir.jpg",
      "assets/images/hablar.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/mirar.mp3"
  },
  {
    "id": 5,
    "question": "",
    "options": [
      "assets/images/hablar.jpg",
      "assets/images/dormir.jpg",
      "assets/images/mirar.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/dormir.mp3"
  },
  {
    "id": 6,
    "question": "",
    "options": [
      "assets/images/hablar.jpg",
      "assets/images/dormir.jpg",
      "assets/images/mirar.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/hablar.mp3"
  },
  {
    "id": 7,
    "question": "",
    "options": [
      "assets/images/barrer.jpg",
      "assets/images/caminar.jpg",
      "assets/images/beber.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/barrer.mp3"
  },
  {
    "id": 8,
    "question": "",
    "options": [
      "assets/images/barrer.jpg",
      "assets/images/beber.jpg",
      "assets/images/caminar.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/caminar.mp3"
  },
  {
    "id": 9,
    "question": "",
    "options": [
      "assets/images/caminar.jpg",
      "assets/images/beber.jpg",
      "assets/images/barrer.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/beber.mp3"
  },
  {
    "id": 10,
    "question": "",
    "options": [
      "assets/images/llorar.jpg",
      "assets/images/morder.jpg",
      "assets/images/comer.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/llorar.mp3"
  },
  {
    "id": 11,
    "question": "",
    "options": [
      "assets/images/pintar.jpg",
      "assets/images/morder.jpg",
      "assets/images/llorar.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/pintar.mp3"
  },
  {
    "id": 12,
    "question": "",
    "options": [
      "assets/images/comer.jpg",
      "assets/images/morder.jpg",
      "assets/images/llorar.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/morder.mp3"
  },
  {
    "id": 13,
    "question": "",
    "options": [
      "assets/images/leer.jpg",
      "assets/images/bailar.jpg",
      "assets/images/reir.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/leer.mp3"
  },
  {
    "id": 14,
    "question": "",
    "options": [
      "assets/images/leer.jpg",
      "assets/images/bailar.jpg",
      "assets/images/reir.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/bailar.mp3"
  },
  {
    "id": 15,
    "question": "",
    "options": [
      "assets/images/leer.jpg",
      "assets/images/bailar.jpg",
      "assets/images/reir.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/reir.mp3"
  },
  {
    "id": 16,
    "question": "",
    "options": [
      "assets/images/lavar.jpg",
      "assets/images/bañar.jpg",
      "assets/images/pararse.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/lavar.mp3"
  },
  {
    "id": 17,
    "question": "",
    "options": [
      "assets/images/sentarse.jpg",
      "assets/images/leer.jpg",
      "assets/images/bañar.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/baniar.mp3"
  },
  {
    "id": 18,
    "question": "",
    "options": [
      "assets/images/sentarse.jpg",
      "assets/images/pararse.jpg",
      "assets/images/morder.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/pararse.mp3"
  },
  {
    "id": 19,
    "question": "",
    "options": [
      "assets/images/sentarse.jpg",
      "assets/images/leer.jpg",
      "assets/images/cortar.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/sentarse.mp3"
  },
  {
    "id": 20,
    "question": "",
    "options": [
      "assets/images/caminar.jpg",
      "assets/images/cortar.jpg",
      "assets/images/beber.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/cortar.mp3"
  },
  {
    "id": 21,
    "question": "",
    "options": [
      "assets/images/planchar.jpg",
      "assets/images/lavar.jpg",
      "assets/images/limpiar.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/limpiar.mp3"
  },
  {
    "id": 22,
    "question": "",
    "options": [
      "assets/images/cepillarPelo.jpg",
      "assets/images/planchar.jpg",
      "assets/images/sentarse.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/planchar.mp3"
  },
  {
    "id": 23,
    "question": "",
    "options": [
      "assets/images/toser.jpg",
      "assets/images/hablar.jpg",
      "assets/images/secarPelo.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/toser.mp3"
  },
  {
    "id": 24,
    "question": "",
    "options": [
      "assets/images/toser.jpg",
      "assets/images/hablar.jpg",
      "assets/images/sonarse.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/sonarse.mp3"
  },
  {
    "id": 25,
    "question": "",
    "options": [
      "assets/images/planchar.jpg",
      "assets/images/peinarse.jpg",
      "assets/images/secarPelo.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/peinarse.mp3"
  },
  {
    "id": 26,
    "question": "",
    "options": [
      "assets/images/cepillarPelo.jpg",
      "assets/images/planchar.jpg",
      "assets/images/barrer.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/cepillarPelo.mp3"
  },
  {
    "id": 28,
    "question": "",
    "options": [
      "assets/images/cepillarPelo.jpg",
      "assets/images/sentarse.jpg",
      "assets/images/planchar.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/planchar.mp3"
  },
  {
    "id": 29,
    "question": "",
    "options": [
      "assets/images/secarPelo.jpg",
      "assets/images/peinarse.jpg",
      "assets/images/lavarseDientes.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/lavarseDientes.mp3"
  },
  {
    "id": 30,
    "question": "",
    "options": [
      "assets/images/regar.jpg",
      "assets/images/lavar.jpg",
      "assets/images/barrer.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/regar.mp3"
  }
];

// Data para los medio
const List data2 = [
  {
    "id": 1,
    "question": "",
    "options": [
      "assets/images/vestirse.jpg",
      "assets/images/abotonarse.jpg",
      "assets/images/pagar.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/abotonarse.mp3"
  },
  {
    "id": 2,
    "question": "",
    "options": [
      "assets/images/abotonarse.jpg",
      "assets/images/pagar.jpg",
      "assets/images/vestirse.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/vestirse.mp3"
  },
  {
    "id": 3,
    "question": "",
    "options": [
      "assets/images/pagar.jpg",
      "assets/images/vestirse.jpg",
      "assets/images/abotonarse.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/pagar.mp3"
  },
  {
    "id": 4,
    "question": "",
    "options": [
      "assets/images/pagar.jpg",
      "assets/images/conducir.jpg",
      "assets/images/pelear.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/conducir.mp3"
  },
  {
    "id": 5,
    "question": "",
    "options": [
      "assets/images/pelear.jpg",
      "assets/images/conducir.jpg",
      "assets/images/vestirse.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/pelear.mp3"
  },
  {
    "id": 6,
    "question": "",
    "options": [
      "assets/images/cantar.jpg",
      "assets/images/cocer.jpg",
      "assets/images/cerrar.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/cerrar.mp3"
  },
  {
    "id": 7,
    "question": "",
    "options": [
      "assets/images/vestirse.jpg",
      "assets/images/cocer.jpg",
      "assets/images/abotonarse.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/cocer.mp3"
  },
  {
    "id": 8,
    "question": "",
    "options": [
      "assets/images/regalar.jpg",
      "assets/images/preguntar.jpg",
      "assets/images/cantar.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/preguntar.mp3"
  },
  {
    "id": 9,
    "question": "",
    "options": [
      "assets/images/correr.jpg",
      "assets/images/pagar.jpg",
      "assets/images/ponerMesa.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/ponerMesa.mp3"
  },
  {
    "id": 10,
    "question": "",
    "options": [
      "assets/images/gritar.jpg",
      "assets/images/armar.jpg",
      "assets/images/correr.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/correr.mp3"
  },
  {
    "id": 11,
    "question": "",
    "options": [
      "assets/images/cantar.jpg",
      "assets/images/abrazar.jpg",
      "assets/images/regalar.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/cantar.mp3"
  },
  {
    "id": 12,
    "question": "",
    "options": [
      "assets/images/regalar.jpg",
      "assets/images/abrazar.jpg",
      "assets/images/cantar.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/abrazar.mp3"
  },
  {
    "id": 13,
    "question": "",
    "options": [
      "assets/images/armar.jpg",
      "assets/images/abrazar.jpg",
      "assets/images/ponerMesa.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/armar.mp3"
  },
  {
    "id": 14,
    "question": "",
    "options": [
      "assets/images/pagar.jpg",
      "assets/images/regalar.jpg",
      "assets/images/gritar.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/regalar.mp3"
  },
  {
    "id": 15,
    "question": "",
    "options": [
      "assets/images/gritar.jpg",
      "assets/images/escuchar.jpg",
      "assets/images/abotonarse.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/escuchar.mp3"
  },
  {
    "id": 16,
    "question": "",
    "options": [
      "assets/images/gritar.jpg",
      "assets/images/ponerMesa.jpg",
      "assets/images/cantar.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/gritar.mp3"
  },
  {
    "id": 17,
    "question": "",
    "options": [
      "assets/images/abrazar.jpg",
      "assets/images/cantar.jpg",
      "assets/images/bostezar.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/bostezar.mp3"
  },
  {
    "id": 19,
    "question": "",
    "options": [
      "assets/images/tomarRemedios.jpg",
      "assets/images/abrazar.jpg",
      "assets/images/perfumarse.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/tomarRemedios.mp3"
  },
  {
    "id": 20,
    "question": "",
    "options": [
      "assets/images/maquillarse.jpg",
      "assets/images/perfumarse.jpg",
      "assets/images/ponerMesa.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/perfumarse.mp3"
  },
  {
    "id": 21,
    "question": "",
    "options": [
      "assets/images/perfumarse.jpg",
      "assets/images/tomarRemedios.jpg",
      "assets/images/maquillarse.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/maquillarse.mp3"
  },
  {
    "id": 22,
    "question": "",
    "options": [
      "assets/images/nadar.jpg",
      "assets/images/jugarPelota.jpg",
      "assets/images/correr.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/nadar.mp3"
  },
  {
    "id": 23,
    "question": "",
    "options": [
      "assets/images/ejercitarse.jpg",
      "assets/images/perfumarse.jpg",
      "assets/images/ponerMesa.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/ejercitarse.mp3"
  },
  {
    "id": 24,
    "question": "",
    "options": [
      "assets/images/correr.jpg",
      "assets/images/maquillarse.jpg",
      "assets/images/cortarPelo.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/cortarPelo.mp3"
  },
  {
    "id": 25,
    "question": "",
    "options": [
      "assets/images/cocer.jpg",
      "assets/images/batir.jpg",
      "assets/images/abotonarse.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/batir.mp3"
  },
  {
    "id": 26,
    "question": "",
    "options": [
      "assets/images/jugarPelota.jpg",
      "assets/images/cerrar.jpg",
      "assets/images/nadar.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/jugarPelota.mp3"
  },
  {
    "id": 27,
    "question": "",
    "options": [
      "assets/images/abrazar.jpg",
      "assets/images/respirar.jpg",
      "assets/images/cantar.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/respirar.mp3"
  },
  // {
  //   "id": 28,
  //   "question": "",
  //   "options": [
  //     "assets/images/cocer.jpg",
  //     "assets/images/abotonarse.jpg",
  //     "assets/images/bucear.jpg"
  //   ],
  //   "answer_index": 2,
  //   "audio": "assets/audio/bucear.mp3"
  // },
  {
    "id": 29,
    "question": "",
    "options": [
      "assets/images/orar.jpg",
      "assets/images/respirar.jpg",
      "assets/images/jugarPelota.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/orar.mp3"
  },
  {
    "id": 30,
    "question": "",
    "options": [
      "assets/images/respirar.jpg",
      "assets/images/cocer.jpg",
      "assets/images/fumar.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/respirar.mp3"
  }
];

//data para los dificiles
const List data3 = data2;
