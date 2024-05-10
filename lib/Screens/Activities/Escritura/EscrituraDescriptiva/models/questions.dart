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
    "options": [
      "assets/images/comer.jpg",
      "assets/images/cocinar.jpg",
      "assets/images/escribir.jpg"
    ],
    "answer_index": 0,
    "question": "assets/images/comer.jpg"
  },
  {
    "id": 2,
    "options": [
      "assets/images/comer.jpg",
      "assets/images/escribir.jpg",
      "assets/images/cocinar.jpg"
    ],
    "answer_index": 2,
    "question": "assets/images/cocinar.jpg"
  },
  {
    "id": 3,
    "options": [
      "assets/images/escribir.jpg",
      "assets/images/cocinar.jpg",
      "assets/images/comer.jpg"
    ],
    "answer_index": 0,
    "question": "assets/images/escribir.jpg"
  },
  {
    "id": 4,
    "options": [
      "assets/images/mirar.jpg",
      "assets/images/dormir.jpg",
      "assets/images/hablar.jpg"
    ],
    "answer_index": 0,
    "question": "assets/images/mirar.jpg"
  },
  {
    "id": 5,
    "options": [
      "assets/images/hablar.jpg",
      "assets/images/dormir.jpg",
      "assets/images/mirar.jpg"
    ],
    "answer_index": 1,
    "question": "assets/images/dormir.jpg"
  },
  {
    "id": 6,
    "options": [
      "assets/images/hablar.jpg",
      "assets/images/dormir.jpg",
      "assets/images/mirar.jpg"
    ],
    "answer_index": 0,
    "question": "assets/images/hablar.jpg"
  },
  {
    "id": 7,
    "options": [
      "assets/images/barrer.jpg",
      "assets/images/caminar.jpg",
      "assets/images/beber.jpg"
    ],
    "answer_index": 0,
    "question": "assets/images/barrer.jpg"
  },
  {
    "id": 8,
    "options": [
      "assets/images/barrer.jpg",
      "assets/images/beber.jpg",
      "assets/images/caminar.jpg"
    ],
    "answer_index": 2,
    "question": "assets/images/caminar.jpg"
  },
  {
    "id": 9,
    "options": [
      "assets/images/caminar.jpg",
      "assets/images/beber.jpg",
      "assets/images/barrer.jpg"
    ],
    "answer_index": 1,
    "question": "assets/images/beber.jpg"
  },
  {
    "id": 10,
    "options": [
      "assets/images/llorar.jpg",
      "assets/images/morder.jpg",
      "assets/images/comer.jpg"
    ],
    "answer_index": 0,
    "question": "assets/images/llorar.jpg"
  },
  {
    "id": 11,
    "options": [
      "assets/images/pintar.jpg",
      "assets/images/morder.jpg",
      "assets/images/llorar.jpg"
    ],
    "answer_index": 0,
    "question": "assets/images/pintar.jpg"
  },
  {
    "id": 12,
    "options": [
      "assets/images/comer.jpg",
      "assets/images/morder.jpg",
      "assets/images/llorar.jpg"
    ],
    "answer_index": 1,
    "question": "assets/images/morder.jpg"
  },
  {
    "id": 13,
    "options": [
      "assets/images/leer.jpg",
      "assets/images/bailar.jpg",
      "assets/images/reir.jpg"
    ],
    "answer_index": 0,
    "question": "assets/images/leer.jpg"
  },
  {
    "id": 14,
    "options": [
      "assets/images/leer.jpg",
      "assets/images/bailar.jpg",
      "assets/images/reir.jpg"
    ],
    "answer_index": 1,
    "question": "assets/images/bailar.jpg"
  },
  {
    "id": 15,
    "options": [
      "assets/images/leer.jpg",
      "assets/images/bailar.jpg",
      "assets/images/reir.jpg"
    ],
    "answer_index": 2,
    "question": "assets/images/reir.jpg"
  },
  {
    "id": 16,
    "options": [
      "assets/images/lavar.jpg",
      "assets/images/bañar.jpg",
      "assets/images/pararse.jpg"
    ],
    "answer_index": 0,
    "question": "assets/images/lavar.jpg"
  },
  {
    "id": 17,
    "options": [
      "assets/images/sentarse.jpg",
      "assets/images/leer.jpg",
      "assets/images/bañar.jpg"
    ],
    "answer_index": 2,
    "question": "assets/images/bañar.jpg"
  },
  {
    "id": 18,
    "options": [
      "assets/images/sentarse.jpg",
      "assets/images/pararse.jpg",
      "assets/images/morder.jpg"
    ],
    "answer_index": 1,
    "question": "assets/images/pararse.jpg"
  },
  {
    "id": 19,
    "options": [
      "assets/images/sentarse.jpg",
      "assets/images/leer.jpg",
      "assets/images/cortar.jpg"
    ],
    "answer_index": 0,
    "question": "assets/images/sentarse.jpg"
  },
  {
    "id": 20,
    "options": [
      "assets/images/caminar.jpg",
      "assets/images/cortar.jpg",
      "assets/images/beber.jpg"
    ],
    "answer_index": 1,
    "question": "assets/images/cortar.jpg"
  },
  {
    "id": 21,
    "options": [
      "assets/images/planchar.jpg",
      "assets/images/lavar.jpg",
      "assets/images/limpiar.jpg"
    ],
    "answer_index": 2,
    "question": "assets/images/limpiar.jpg"
  },
  {
    "id": 22,
    "options": [
      "assets/images/cepillarPelo.jpg",
      "assets/images/planchar.jpg",
      "assets/images/sentarse.jpg"
    ],
    "answer_index": 1,
    "question": "assets/images/planchar.jpg"
  },
  {
    "id": 23,
    "options": [
      "assets/images/toser.jpg",
      "assets/images/hablar.jpg",
      "assets/images/secarPelo.jpg"
    ],
    "answer_index": 0,
    "question": "assets/images/toser.jpg"
  },
  {
    "id": 24,
    "options": [
      "assets/images/toser.jpg",
      "assets/images/hablar.jpg",
      "assets/images/sonarse.jpg"
    ],
    "answer_index": 2,
    "question": "assets/images/sonarse.jpg"
  },
  {
    "id": 25,
    "options": [
      "assets/images/planchar.jpg",
      "assets/images/peinarse.jpg",
      "assets/images/secarPelo.jpg"
    ],
    "answer_index": 1,
    "question": "assets/images/peinarse.jpg"
  },
  {
    "id": 26,
    "options": [
      "assets/images/cepillarPelo.jpg",
      "assets/images/planchar.jpg",
      "assets/images/barrer.jpg"
    ],
    "answer_index": 0,
    "question": "assets/images/cepillarPelo.jpg"
  },
  {
    "id": 28,
    "options": [
      "assets/images/cepillarPelo.jpg",
      "assets/images/sentarse.jpg",
      "assets/images/planchar.jpg"
    ],
    "answer_index": 2,
    "question": "assets/images/planchar.jpg"
  },
  {
    "id": 29,
    "options": [
      "assets/images/secarPelo.jpg",
      "assets/images/peinarse.jpg",
      "assets/images/lavarseDientes.jpg"
    ],
    "answer_index": 2,
    "question": "assets/images/lavarseDientes.jpg"
  },
  {
    "id": 30,
    "options": [
      "assets/images/regar.jpg",
      "assets/images/lavar.jpg",
      "assets/images/barrer.jpg"
    ],
    "answer_index": 0,
    "question": "assets/images/regar.jpg"
  }
];

// Data para los medio
const List data2 = [
  {
    "id": 1,
    "options": [
      "assets/images/vestirse.jpg",
      "assets/images/abotonarse.jpg",
      "assets/images/pagar.jpg"
    ],
    "answer_index": 1,
    "question": "assets/images/abotonarse.jpg"
  },
  {
    "id": 2,
    "options": [
      "assets/images/abotonarse.jpg",
      "assets/images/pagar.jpg",
      "assets/images/vestirse.jpg"
    ],
    "answer_index": 2,
    "question": "assets/images/vestirse.jpg"
  },
  {
    "id": 3,
    "options": [
      "assets/images/pagar.jpg",
      "assets/images/vestirse.jpg",
      "assets/images/abotonarse.jpg"
    ],
    "answer_index": 0,
    "question": "assets/images/pagar.jpg"
  },
  {
    "id": 4,
    "options": [
      "assets/images/pagar.jpg",
      "assets/images/conducir.jpg",
      "assets/images/pelear.jpg"
    ],
    "answer_index": 1,
    "question": "assets/images/conducir.jpg"
  },
  {
    "id": 5,
    "options": [
      "assets/images/pelear.jpg",
      "assets/images/conducir.jpg",
      "assets/images/vestirse.jpg"
    ],
    "answer_index": 0,
    "question": "assets/images/pelear.jpg"
  },
  {
    "id": 6,
    "options": [
      "assets/images/cantar.jpg",
      "assets/images/cocer.jpg",
      "assets/images/cerrar.jpg"
    ],
    "answer_index": 2,
    "question": "assets/images/cerrar.jpg"
  },
  {
    "id": 7,
    "options": [
      "assets/images/vestirse.jpg",
      "assets/images/cocer.jpg",
      "assets/images/abotonarse.jpg"
    ],
    "answer_index": 1,
    "question": "assets/images/cocer.jpg"
  },
  {
    "id": 8,
    "options": [
      "assets/images/regalar.jpg",
      "assets/images/preguntar.jpg",
      "assets/images/cantar.jpg"
    ],
    "answer_index": 1,
    "question": "assets/images/preguntar.jpg"
  },
  {
    "id": 9,
    "options": [
      "assets/images/correr.jpg",
      "assets/images/pagar.jpg",
      "assets/images/ponerMesa.jpg"
    ],
    "answer_index": 2,
    "question": "assets/images/ponerMesa.jpg"
  },
  {
    "id": 10,
    "options": [
      "assets/images/gritar.jpg",
      "assets/images/armar.jpg",
      "assets/images/correr.jpg"
    ],
    "answer_index": 2,
    "question": "assets/images/correr.jpg"
  },
  {
    "id": 11,
    "options": [
      "assets/images/cantar.jpg",
      "assets/images/abrazar.jpg",
      "assets/images/regalar.jpg"
    ],
    "answer_index": 0,
    "question": "assets/images/cantar.jpg"
  },
  {
    "id": 12,
    "options": [
      "assets/images/regalar.jpg",
      "assets/images/abrazar.jpg",
      "assets/images/cantar.jpg"
    ],
    "answer_index": 1,
    "question": "assets/images/abrazar.jpg"
  },
  {
    "id": 13,
    "options": [
      "assets/images/armar.jpg",
      "assets/images/abrazar.jpg",
      "assets/images/ponerMesa.jpg"
    ],
    "answer_index": 0,
    "question": "assets/images/armar.jpg"
  },
  {
    "id": 14,
    "options": [
      "assets/images/pagar.jpg",
      "assets/images/regalar.jpg",
      "assets/images/gritar.jpg"
    ],
    "answer_index": 1,
    "question": "assets/images/regalar.jpg"
  },
  {
    "id": 15,
    "options": [
      "assets/images/gritar.jpg",
      "assets/images/escuchar.jpg",
      "assets/images/abotonarse.jpg"
    ],
    "answer_index": 1,
    "question": "assets/images/escuchar.jpg"
  },
  {
    "id": 16,
    "options": [
      "assets/images/gritar.jpg",
      "assets/images/ponerMesa.jpg",
      "assets/images/cantar.jpg"
    ],
    "answer_index": 0,
    "question": "assets/images/gritar.jpg"
  },
  {
    "id": 17,
    "options": [
      "assets/images/abrazar.jpg",
      "assets/images/cantar.jpg",
      "assets/images/bostezar.jpg"
    ],
    "answer_index": 2,
    "question": "assets/images/bostezar.jpg"
  },
  {
    "id": 19,
    "options": [
      "assets/images/tomarRemedios.jpg",
      "assets/images/abrazar.jpg",
      "assets/images/perfumarse.jpg"
    ],
    "answer_index": 0,
    "question": "assets/images/tomarRemedios.jpg"
  },
  {
    "id": 20,
    "options": [
      "assets/images/maquillarse.jpg",
      "assets/images/perfumarse.jpg",
      "assets/images/ponerMesa.jpg"
    ],
    "answer_index": 1,
    "question": "assets/images/perfumarse.jpg"
  },
  {
    "id": 21,
    "options": [
      "assets/images/perfumarse.jpg",
      "assets/images/tomarRemedios.jpg",
      "assets/images/maquillarse.jpg"
    ],
    "answer_index": 2,
    "question": "assets/images/maquillarse.jpg"
  },
  {
    "id": 22,
    "options": [
      "assets/images/nadar.jpg",
      "assets/images/jugarPelota.jpg",
      "assets/images/correr.jpg"
    ],
    "answer_index": 0,
    "question": "assets/images/nadar.jpg"
  },
  {
    "id": 23,
    "options": [
      "assets/images/ejercitarse.jpg",
      "assets/images/perfumarse.jpg",
      "assets/images/ponerMesa.jpg"
    ],
    "answer_index": 0,
    "question": "assets/images/ejercitarse.jpg"
  },
  {
    "id": 24,
    "options": [
      "assets/images/correr.jpg",
      "assets/images/maquillarse.jpg",
      "assets/images/cortarPelo.jpg"
    ],
    "answer_index": 2,
    "question": "assets/images/cortarPelo.jpg"
  },
  {
    "id": 25,
    "options": [
      "assets/images/cocer.jpg",
      "assets/images/batir.jpg",
      "assets/images/abotonarse.jpg"
    ],
    "answer_index": 1,
    "question": "assets/images/batir.jpg"
  },
  {
    "id": 26,
    "options": [
      "assets/images/jugarPelota.jpg",
      "assets/images/cerrar.jpg",
      "assets/images/nadar.jpg"
    ],
    "answer_index": 0,
    "question": "assets/images/jugarPelota.jpg"
  },
  {
    "id": 27,
    "options": [
      "assets/images/abrazar.jpg",
      "assets/images/respirar.jpg",
      "assets/images/cantar.jpg"
    ],
    "answer_index": 1,
    "question": "assets/images/respirar.jpg"
  },
  // {
  //   "id": 28,
  //
  //   "options": [
  //     "assets/images/cocer.jpg",
  //     "assets/images/abotonarse.jpg",
  //     "assets/images/bucear.jpg"
  //   ],
  //   "answer_index": 2,
  //   "question": "assets/images/bucear.jpg"
  // },
  {
    "id": 29,
    "options": [
      "assets/images/orar.jpg",
      "assets/images/respirar.jpg",
      "assets/images/jugarPelota.jpg"
    ],
    "answer_index": 0,
    "question": "assets/images/orar.jpg"
  },
  {
    "id": 30,
    "options": [
      "assets/images/respirar.jpg",
      "assets/images/cocer.jpg",
      "assets/images/fumar.jpg"
    ],
    "answer_index": 0,
    "question": "assets/images/respirar.jpg"
  }
];

//data para los dificiles
const List data3 = data2;
