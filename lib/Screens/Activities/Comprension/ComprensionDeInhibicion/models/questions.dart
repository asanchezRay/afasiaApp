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
    "question": "",
    "options": [
      'assets/images/manzana.jpg',
      'assets/images/taza.jpg',
      'assets/images/pera.jpg',
      'assets/images/uva.jpg',
    ],
    "answer_index": 1,
  },
  {
    "id": 2,
    "question": "",
    "options": [
      'assets/images/helicoptero.jpg',
      'assets/images/auto.jpg',
      'assets/images/vaca.jpg',
      'assets/images/tren.jpg',
    ],
    "answer_index": 2,
  },
  {
    "id": 3,
    "question": "",
    "options": [
      'assets/images/perro.jpg',
      'assets/images/auto.jpg',
      'assets/images/vaca.jpg',
      'assets/images/gato.jpg',
    ],
    "answer_index": 1,
  },
  // {
  //   "id": 4, //faltan 2 imagenes
  //   "question": "",
  //   "options": [
  //     'assets/images/mirar.jpg',
  //     'assets/images/mirar.jpg',
  //     'assets/images/dormir.jpg',
  //     'assets/images/hablar.jpg',
  //   ],
  //   "answer_index": 0,
  // },
  {
    "id": 5,
    "question": "",
    "options": [
      'assets/images/toalla.jpg',
      'assets/images/lavaLoza.jpg',
      'assets/images/baño.jpg',
      'assets/images/ducha.jpg',
    ],
    "answer_index": 1,
  },
  {
    "id": 6,
    "question": "",
    "options": [
      'assets/images/jeringa.jpg',
      'assets/images/camilla.jpg',
      'assets/images/remedios.jpg',
      'assets/images/pan.jpg',
    ],
    "answer_index": 3,
  },
  {
    "id": 7,
    "question": "",
    "options": [
      'assets/images/baño.jpg',
      'assets/images/tomate.jpg',
      'assets/images/pan.jpg',
      'assets/images/manzana.jpg',
    ],
    "answer_index": 0,
  },
  {
    "id": 8,
    "question": "",
    "options": [
      'assets/images/lavaLoza.jpg',
      'assets/images/rejillaDeLoza.jpg',
      'assets/images/closet.jpg',
      'assets/images/sarten.jpg',
    ],
    "answer_index": 2,
  },
];

// Data para los medio
const List data2 = [
  {
    "id": 1,
    "question": "",
    "options": [
      'assets/images/cinco.jpg',
      'assets/images/letraA.jpg',
      'assets/images/uno.jpg',
      'assets/images/ocho.jpg',
    ],
    "answer_index": 1,
  },
  {
    "id": 2,
    "question": "",
    "options": [
      'assets/images/dormir.jpg',
      'assets/images/correr.jpg',
      'assets/images/lapiz.jpg',
      'assets/images/comer.jpg',
    ],
    "answer_index": 2,
  },
  {
    "id": 3,
    "question": "",
    "options": [
      'assets/images/niña.jpg',
      'assets/images/bebe.jpg',
      'assets/images/adulto.jpg',
      'assets/images/niño.jpg',
    ],
    "answer_index": 2,
  },
  {
    "id": 4,
    "question": "",
    "options": [
      'assets/images/circuloAmarillo.jpg',
      'assets/images/cuadradoAzul.jpg',
      'assets/images/circuloRojo.jpg',
      'assets/images/circuloVerde.jpg',
    ],
    "answer_index": 1,
  },
  {
    "id": 5,
    "question": "",
    "options": [
      'assets/images/niña.jpg',
      'assets/images/mujer1.jpg',
      'assets/images/mujer2.jpg',
      'assets/images/mujer3.jpg',
    ],
    "answer_index": 0,
  },
  {
    "id": 6,
    "question": "",
    "options": [
      'assets/images/vaso.jpg',
      'assets/images/jarroDeJugo.jpg',
      'assets/images/sopa.jpg',
      'assets/images/pan.jpg',
    ],
    "answer_index": 3,
  },
  {
    "id": 7,
    "question": "",
    "options": [
      'assets/images/polera.jpg',
      'assets/images/guitarra.jpg',
      'assets/images/bateria.jpg',
      'assets/images/flauta.jpg'
    ],
    "answer_index": 0,
  },
  {
    "id": 8,
    "question": "",
    "options": [
      'assets/images/hombreJoven.jpg',
      'assets/images/anciana.jpg',
      'assets/images/niña.jpg',
      'assets/images/perro.jpg',
    ],
    "answer_index": 3,
  },
  {
    "id": 9,
    "question": "",
    "options": [
      'assets/images/manzanaVerde.jpg',
      'assets/images/choclo.jpg',
      'assets/images/acelga.jpg',
      'assets/images/lechuga.jpg',
    ],
    "answer_index": 0,
  },
  {
    "id": 10,
    "question": "",
    "options": [
      'assets/images/juguera.jpg',
      'assets/images/hervidor.jpg',
      'assets/images/silla.jpg',
      'assets/images/hornoCocina.jpg',
    ],
    "answer_index": 2,
  },
];
// data compeljidad alta
const List data3 = [
  {
    "id": 1,
    "question": "",
    "options": [
      'assets/images/peineta.jpg',
      'assets/images/otoño.jpg',
      'assets/images/verano.jpg',
      'assets/images/invierno.jpg',
    ],
    "answer_index": 0,
  },
  {
    "id": 2,
    "question": "",
    "options": [
      'assets/images/batidora.jpg',
      'assets/images/comoda.jpg',
      'assets/images/plancha.jpg',
      'assets/images/sandwichera.jpg',
    ],
    "answer_index": 1,
  },
  {
    "id": 3,
    "question": "",
    "options": [
      'assets/images/canario.jpg',
      'assets/images/lagartija.jpg',
      'assets/images/libelula.jpg',
      'assets/images/rinoceronte.jpg',
    ],
    "answer_index": 2,
  },
  {
    "id": 4,
    "question": "",
    "options": [
      'assets/images/pimientoRojo.jpg',
      'assets/images/cielo.jpg',
      'assets/images/poleraRoja.jpg',
      'assets/images/manzanaRoja.jpg',
    ],
    "answer_index": 1,
  },
  {
    "id": 5,
    "question": "",
    "options": [
      'assets/images/dado.jpg',
      'assets/images/pianoDeCola.jpg',
      'assets/images/grua.jpg',
      'assets/images/avion.jpg',
    ],
    "answer_index": 0,
  },
  // {
  //   "id": 6,
  //   "question": "",
  //   "options": [
  //     'assets/images/pantuflas.jpg',
  //     'assets/images/computadorEnMesa.jpg',
  //     'assets/images/binocularesEnMesa.jpg',
  //     'assets/images/botellaEnMesa.jpg',
  //   ],
  //   "answer_index": 0,
  // },
  {
    "id": 7,
    "question": "",
    "options": [
      'assets/images/maquinaDeCoser.jpg',
      'assets/images/celular.jpg',
      'assets/images/radioAntigua.jpg',
      'assets/images/molino.jpg',
    ],
    "answer_index": 1,
  },
  {
    "id": 8,
    "question": "",
    "options": [
      'assets/images/frutilla.jpg',
      'assets/images/cereza.jpg',
      'assets/images/frambuesas.jpg',
      'assets/images/tuna.jpg',
    ],
    "answer_index": 3,
  },
  {
    "id": 9,
    "question": "",
    "options": [
      'assets/images/bicicleta.jpg',
      'assets/images/helicoptero.jpg',
      'assets/images/camioneta.jpg',
      'assets/images/scooter.jpg',
    ],
    "answer_index": 1,
  },
  {
    "id": 10,
    "question": "",
    "options": [
      'assets/images/sandalias.jpg',
      'assets/images/impermeable.jpg',
      'assets/images/sombrero.jpg',
      'assets/images/trajeDeBaño.jpg',
    ],
    "answer_index": 1,
  },
  {
    "id": 11,
    "question": "",
    "options": [
      'assets/images/helado.jpg',
      'assets/images/ensalada.jpg',
      'assets/images/bebidaConHielo.jpg',
      'assets/images/sopa.jpg',
    ],
    "answer_index": 3,
  },
];
