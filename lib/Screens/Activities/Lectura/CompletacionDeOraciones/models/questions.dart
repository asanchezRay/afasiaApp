class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question({this.id, this.question, this.answer, this.options});
}

//data para los faciles
const List data1 = [
  {
    "id": 1,
    "question": "Para ver mejor uso los __________",
    "options": [
      'assets/images/lentes.jpg',
      'assets/images/lapiz.jpg',
      'assets/images/binoculares.jpg',
    ],
    "answer_index": 0,
  },
  {
    "id": 2,
    "question": "Cuando me duele algo me tomo un ____________",
    "options": [
      'assets/images/dulce.jpg',
      'assets/images/refresco.jpg',
      'assets/images/remedio.jpg',
    ],
    "answer_index": 2,
  },
  {
    "id": 3,
    "question": "Para secarme las manos uso la __________________",
    "options": [
      'assets/images/toalla.jpg',
      'assets/images/jabon.jpg',
      'assets/images/talco.jpg',
    ],
    "answer_index": 0,
  },
  {
    "id": 4,
    "question": "Para abrir la puerta usó una _________",
    "options": [
      'assets/images/llave.jpg',
      'assets/images/candado.jpg',
      'assets/images/llanta.jpg',
    ],
    "answer_index": 0,
  },
  {
    "id": 5,
    "question": "Para tomar agua uso un ______________________",
    "options": [
      'assets/images/olla.jpg',
      'assets/images/vaso.jpg',
      'assets/images/vela.jpg',
    ],
    "answer_index": 1,
  },
  {
    "id": 6,
    "question": "Para tomar la sopa usó una _________________",
    "options": [
      'assets/images/cuchara.jpg',
      'assets/images/cuchillo.jpg',
      'assets/images/sarten.jpg',
    ],
    "answer_index": 0,
  },
  {
    "id": 7,
    "question": "Para ver mi reflejo uso el _______",
    "options": [
      'assets/images/espejo.jpg',
      'assets/images/espia.jpg',
      'assets/images/toalla.jpg',
    ],
    "answer_index": 0,
  },
  {
    "id": 8,
    "question": "Para que no se caigan los pantalones usó un ___________",
    "options": [
      'assets/images/calcetin.jpg',
      'assets/images/cintillo.jpg',
      'assets/images/cinturon.jpg',
    ],
    "answer_index": 2,
  },
  {
    "id": 9,
    "question": "Para abrigarme los pies uso los _________",
    "options": [
      'assets/images/pantalon.jpg',
      'assets/images/calcetin.jpg',
      'assets/images/guantes.jpg',
    ],
    "answer_index": 1,
  },
  {
    "id": 10,
    "question": "Para preparar una sopa necesito de una _________",
    "options": [
      'assets/images/olla.jpg',
      'assets/images/oreja.jpg',
      'assets/images/tenedor.jpg',
    ],
    "answer_index": 0,
  },
  {
    "id": 11,
    "question": "El pasto es de color _______________",
    "options": [
      'assets/images/verde.jpg',
      'assets/images/verano.jpg',
      'assets/images/rojo.jpg',
    ],
    "answer_index": 0,
  },
  {
    "id": 12,
    "question": "Para ver la hora usó un _______________",
    "options": [
      'assets/images/regla.jpg',
      'assets/images/reloj.jpg',
      'assets/images/radio.jpg',
    ],
    "answer_index": 1,
  },
  {
    "id": 13,
    "question": "Para clavar un clavo usó el _______________",
    "options": [
      'assets/images/martillo.jpg',
      'assets/images/ladrillo.jpg',
      'assets/images/destornillador.jpg',
    ],
    "answer_index": 0,
  },
  // {
  //   "id": 14,
  //   "question": "Para pintar la pared usó la ____________",
  //   "options": [
  //     'assets/images/broma.jpg',
  //     'assets/images/brocha.jpg',
  //     'assets/images/espatula.jpg',
  //   ],
  //   "answer_index": 1,
  // },
  {
    "id": 15,
    "question": "Mastico el pan con los __________",
    "options": [
      'assets/images/ojos.jpg',
      'assets/images/dinastia.jpg',
      'assets/images/dientes.jpg'
    ],
    "answer_index": 2,
  },
  {
    "id": 16,
    "question": "Preparo la comida en la ___________",
    "options": [
      'assets/images/cocina.jpg',
      'assets/images/cortina.jpg',
      'assets/images/pieza.jpg',
    ],
    "answer_index": 0,
  },
  {
    "id": 17,
    "question": "Para aprender y estudiar voy a la ________",
    "options": [
      'assets/images/oficina.jpg',
      'assets/images/escudo.jpg',
      'assets/images/escuela.jpg',
    ],
    "answer_index": 2,
  },
  {
    "id": 18,
    "question": "Para barrer el polvo usó la ____________",
    "options": [
      'assets/images/escorpion.jpg',
      'assets/images/escoba.jpg',
      'assets/images/rastrillo.jpg',
    ],
    "answer_index": 1,
  },
  {
    "id": 19,
    "question": "El tomate es de color ___________",
    "options": [
      'assets/images/rojo.jpg',
      'assets/images/rodilla.jpg',
      'assets/images/naranjo.jpg',
    ],
    "answer_index": 0,
  },
  // {
  //   "id": 20,
  //   "question": "La tierra es de color __________",
  //   "options": [
  //     'assets/images/verde.jpg',
  //     'assets/images/café.jpg',
  //     'assets/images/caro.jpg',
  //   ],
  //   "answer_index": 1,
  // },
  // {
  //   "id": 21,
  //   "question": "Patricia, Emilio y Ana son ___________",
  //   "options": [
  //     'assets/images/apellidos.jpg',
  //     'assets/images/nominaciones.jpg',
  //     'assets/images/nombres.jpg',
  //   ],
  //   "answer_index": 2,
  // },
  {
    "id": 22,
    "question": "Cuando se corta la luz uso la _________",
    "options": [
      'assets/images/litera.jpg',
      'assets/images/linterna.jpg',
      'assets/images/ampolleta.jpg',
    ],
    "answer_index": 1,
  },
  {
    "id": 23,
    "question": "Para prender la vela uso los ____________",
    "options": [
      'assets/images/fosforos.jpg',
      'assets/images/linterna.jpg',
      'assets/images/folletos.jpg',
    ],
    "answer_index": 0,
  },
  // {
  //   "id": 24,
  //   "question": "Lunes, domingo y jueves son días de la ____________",
  //   "options": [
  //     'assets/images/mañana.jpg',
  //     'assets/images/semilla.jpg',
  //     'assets/images/semana.jpg',
  //   ],
  //   "answer_index": 2,
  // },
  // {
  //   "id": 25,
  //   "question": "Al lado de mi cama está el ___________",
  //   "options": [
  //     'assets/images/hervidor.jpg',
  //     'assets/images/velador.jpg',
  //     'assets/images/cocina.jpg',
  //   ],
  //   "answer_index": 1,
  // },
  // {
  //   "id": 26,
  //   "question": "Peino mi pelo con la __________",
  //   "options": [
  //     'assets/images/peineta.jpg',
  //     'assets/images/reineta.jpg',
  //     'assets/images/bálsamo.jpg',
  //   ],
  //   "answer_index": 0,
  // },
  {
    "id": 27,
    "question": "Para secar mi pelo uso el __________",
    "options": [
      'assets/images/cepillo.jpg',
      'assets/images/secador.jpg',
      'assets/images/jabon.jpg',
    ],
    "answer_index": 1,
  },
  // {
  //   "id": 28,
  //   "question": "Lavo la ropa en la __________",
  //   "options": [
  //     'assets/images/secadora.jpg',
  //     'assets/images/lavavajilla.jpg',
  //     'assets/images/lavadora.jpg',
  //   ],
  //   "answer_index": 2,
  // },
  {
    "id": 29,
    "question": "Me hago los huevos fritos en un _________",
    "options": [
      'assets/images/vaiven.jpg',
      'assets/images/plato.jpg',
      'assets/images/sarten.jpg',
    ],
    "answer_index": 2,
  },
  {
    "id": 30,
    "question": "Cocino la cazuela en la _________",
    "options": [
      'assets/images/olla.jpg',
      'assets/images/paila.jpg',
      'assets/images/hoyo.jpg',
    ],
    "answer_index": 0,
  },
];

const List data2 = data1;

//data para los dificiles
const List data3 = data1;
