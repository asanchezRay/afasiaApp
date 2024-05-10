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
      "assets/images/lapiz.jpg",
      "assets/images/mesa.jpg",
      "assets/images/pelota.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/lapiz.mp3"
  },
  {
    "id": 2,
    "question": "",
    "options": [
      "assets/images/pelota.jpg",
      "assets/images/lapiz.jpg",
      "assets/images/mesa.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/mesa.mp3"
  },
  {
    "id": 3,
    "question": "",
    "options": [
      "assets/images/pelota.jpg",
      "assets/images/lapiz.jpg",
      "assets/images/mesa.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/pelota.mp3"
  },
  {
    "id": 4,
    "question": "",
    "options": [
      "assets/images/cepilloDeDientes.jpg",
      "assets/images/cama.jpg",
      "assets/images/jirafa.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/cepilloDeDientes.mp3"
  },
  {
    "id": 5,
    "question": "",
    "options": [
      "assets/images/vaso.jpg",
      "assets/images/silla.jpg",
      "assets/images/ventana.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/silla.mp3"
  },
  {
    "id": 6,
    "question": "",
    "options": [
      "assets/images/ventana.jpg",
      "assets/images/silla.jpg",
      "assets/images/vaso.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/ventana.mp3"
  },
  {
    "id": 7,
    "question": "",
    "options": [
      "assets/images/tenedor.jpg",
      "assets/images/puerta.jpg",
      "assets/images/zapato.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/tenedor.mp3"
  },
  {
    "id": 8,
    "question": "",
    "options": [
      "assets/images/zapato.jpg",
      "assets/images/tenedor.jpg",
      "assets/images/puerta.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/puerta.mp3"
  },
  {
    "id": 9,
    "question": "",
    "options": [
      "assets/images/tenedor.jpg",
      "assets/images/zapato.jpg",
      "assets/images/puerta.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/zapato.mp3"
  },
  {
    "id": 10,
    "question": "",
    "options": [
      "assets/images/telefono.jpg",
      "assets/images/polera.jpg",
      "assets/images/gato.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/telefono.mp3"
  },
  {
    "id": 11,
    "question": "",
    "options": [
      "assets/images/polera.jpg",
      "assets/images/plato.jpg",
      "assets/images/telefono.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/polera.mp3"
  },
  {
    "id": 12,
    "question": "",
    "options": [
      "assets/images/avion.jpg",
      "assets/images/cuchillo.jpg",
      "assets/images/lapiz.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/cuchillo.mp3"
  },
  {
    "id": 13,
    "question": "",
    "options": [
      "assets/images/cama.jpg",
      "assets/images/botella.jpg",
      "assets/images/lapiz.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/cama.mp3"
  },
  {
    "id": 14,
    "question": "",
    "options": [
      "assets/images/cama.jpg",
      "assets/images/botella.jpg",
      "assets/images/lapiz.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/botella.mp3"
  },
  {
    "id": 15,
    "question": "",
    "options": [
      "assets/images/lapiz.jpg",
      "assets/images/toalla.jpg",
      "assets/images/taza.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/taza.mp3"
  },
  {
    "id": 16,
    "question": "",
    "options": [
      "assets/images/toalla.jpg",
      "assets/images/lapiz.jpg",
      "assets/images/taza.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/toalla.mp3"
  },
  {
    "id": 17,
    "question": "",
    "options": [
      "assets/images/lapiz.jpg",
      "assets/images/toalla.jpg",
      "assets/images/lentes.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/lentes.mp3"
  },
  {
    "id": 18,
    "question": "",
    "options": [
      "assets/images/vaso.jpg",
      "assets/images/dinero.jpg",
      "assets/images/pastaDeDientes.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/dinero.mp3"
  },
  {
    "id": 19,
    "question": "",
    "options": [
      "assets/images/vaso.jpg",
      "assets/images/dinero.jpg",
      "assets/images/pastaDeDientes.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/vaso.mp3"
  },
  {
    "id": 20,
    "question": "",
    "options": [
      "assets/images/vaso.jpg",
      "assets/images/dinero.jpg",
      "assets/images/pastaDeDientes.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/pastaDeDientes.mp3"
  },
  {
    "id": 21,
    "question": "",
    "options": [
      "assets/images/plato.jpg",
      "assets/images/elefante.jpg",
      "assets/images/lapiz.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/plato.mp3"
  },
  {
    "id": 22,
    "question": "",
    "options": [
      "assets/images/botella.jpg",
      "assets/images/desodorante.jpg",
      "assets/images/cama.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/desodorante.mp3"
  },
  {
    "id": 23,
    "question": "",
    "options": [
      "assets/images/auto.jpg",
      "assets/images/perro.jpg",
      "assets/images/cama.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/auto.mp3"
  },
  {
    "id": 24,
    "question": "",
    "options": [
      "assets/images/pantalon.jpg",
      "assets/images/botella.jpg",
      "assets/images/perro.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/perro.mp3"
  },
  {
    "id": 25,
    "question": "",
    "options": [
      "assets/images/camisa.jpg",
      "assets/images/gato.jpg",
      "assets/images/lapiz.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/gato.mp3"
  },
  {
    "id": 26,
    "question": "",
    "options": [
      "assets/images/pajaro.jpg",
      "assets/images/plato.jpg",
      "assets/images/botella.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/pajaro.mp3"
  },
  {
    "id": 27,
    "question": "",
    "options": [
      "assets/images/desodorante.jpg",
      "assets/images/mono.jpg",
      "assets/images/botella.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/mono.mp3"
  },
  {
    "id": 28,
    "question": "",
    "options": [
      "assets/images/cama.jpg",
      "assets/images/plato.jpg",
      "assets/images/elefante.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/elefante.mp3"
  },
  {
    "id": 29,
    "question": "",
    "options": [
      "assets/images/tetera.jpg",
      "assets/images/lapiz.jpg",
      "assets/images/jirafa.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/jirafa.mp3"
  },
  {
    "id": 30,
    "question": "",
    "options": [
      "assets/images/tetera.jpg",
      "assets/images/gato.jpg",
      "assets/images/botella.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/tetera.mp3"
  },
  {
    "id": 31,
    "question": "",
    "options": [
      "assets/images/pantalon.jpg",
      "assets/images/gato.jpg",
      "assets/images/jamon.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/pantalon.mp3"
  },
  {
    "id": 32,
    "question": "",
    "options": [
      "assets/images/tetera.jpg",
      "assets/images/camisa.jpg",
      "assets/images/lapiz.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/camisa.mp3"
  },
  {
    "id": 33,
    "question": "",
    "options": [
      "assets/images/elefante.jpg",
      "assets/images/pollo.jpg",
      "assets/images/calcetin.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/calcetin.mp3"
  },
  {
    "id": 34,
    "question": "",
    "options": [
      "assets/images/jirafa.jpg",
      "assets/images/pan.jpg",
      "assets/images/botella.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/pan.mp3"
  },
  {
    "id": 35,
    "question": "",
    "options": [
      "assets/images/huevo.jpg",
      "assets/images/dinero.jpg",
      "assets/images/jirafa.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/huevo.mp3"
  },
  {
    "id": 36,
    "question": "",
    "options": [
      "assets/images/elefante.jpg",
      "assets/images/silla.jpg",
      "assets/images/arroz.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/arroz.mp3"
  },
  {
    "id": 37,
    "question": "",
    "options": [
      "assets/images/pollo.jpg",
      "assets/images/jirafa.jpg",
      "assets/images/billetera.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/pollo.mp3"
  },
  {
    "id": 38,
    "question": "",
    "options": [
      "assets/images/leche.jpg",
      "assets/images/pantalon.jpg",
      "assets/images/elefante.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/leche.mp3"
  },
  {
    "id": 39,
    "question": "",
    "options": [
      "assets/images/jirafa.jpg",
      "assets/images/cafe.jpg",
      "assets/images/lechuga.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/cafe.mp3"
  },
  {
    "id": 40,
    "question": "",
    "options": [
      "assets/images/carne.jpg",
      "assets/images/tetera.jpg",
      "assets/images/lapiz.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/carne.mp3"
  },
  {
    "id": 41,
    "question": "",
    "options": [
      "assets/images/tomate.jpg",
      "assets/images/taza.jpg",
      "assets/images/lapiz.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/taza.mp3"
  },
  {
    "id": 42,
    "question": "",
    "options": [
      "assets/images/desodorante.jpg",
      "assets/images/gato.jpg",
      "assets/images/palta.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/palta.mp3"
  },
  {
    "id": 43,
    "question": "",
    "options": [
      "assets/images/lechuga.jpg",
      "assets/images/tetera.jpg",
      "assets/images/billetera.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/lechuga.mp3"
  },
  {
    "id": 44,
    "question": "",
    "options": [
      "assets/images/calcetin.jpg",
      "assets/images/perro.jpg",
      "assets/images/jamon.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/jamon.mp3"
  },
  {
    "id": 45,
    "question": "",
    "options": [
      "assets/images/desodorante.jpg",
      "assets/images/queso.jpg",
      "assets/images/billetera.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/queso.mp3"
  },
  {
    "id": 46,
    "question": "",
    "options": [
      "assets/images/lapiz.jpg",
      "assets/images/cama.jpg",
      "assets/images/papas.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/papas.mp3"
  },
  {
    "id": 47,
    "question": "",
    "options": [
      "assets/images/billetera.jpg",
      "assets/images/huevo.jpg",
      "assets/images/cama.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/billetera.mp3"
  },
  {
    "id": 48,
    "question": "",
    "options": [
      "assets/images/jirafa.jpg",
      "assets/images/avion.jpg",
      "assets/images/tomate.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/avion.mp3"
  },
  {
    "id": 49,
    "question": "",
    "options": [
      "assets/images/calcetin.jpg",
      "assets/images/manzana.jpg",
      "assets/images/vaso.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/manzana.mp3"
  },
  {
    "id": 50,
    "question": "",
    "options": [
      "assets/images/crema.jpg",
      "assets/images/carne.jpg",
      "assets/images/telefono.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/crema.mp3"
  }
];

// //data para nivel medio
const List data2 = [
  {
    "id": 1,
    "question": "",
    "options": [
      "assets/images/libro.jpg",
      "assets/images/reloj.jpg",
      "assets/images/computador.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/reloj.mp3"
  },
  {
    "id": 2,
    "question": "",
    "options": [
      "assets/images/reloj.jpg",
      "assets/images/sarten.jpg",
      "assets/images/libro.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/libro.mp3"
  },
  {
    "id": 3,
    "question": "",
    "options": [
      "assets/images/velador.jpg",
      "assets/images/reloj.jpg",
      "assets/images/choclo.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/velador.mp3"
  },
  {
    "id": 4,
    "question": "",
    "options": [
      "assets/images/sillon.jpg",
      "assets/images/computador.jpg",
      "assets/images/plancha.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/sillon.mp3"
  },
  {
    "id": 5,
    "question": "",
    "options": [
      "assets/images/sillon.jpg",
      "assets/images/computador.jpg",
      "assets/images/velador.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/computador.mp3"
  },
  {
    "id": 6,
    "question": "",
    "options": [
      "assets/images/plancha.jpg",
      "assets/images/vela.jpg",
      "assets/images/computador.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/plancha.mp3"
  },
  {
    "id": 7,
    "question": "",
    "options": [
      "assets/images/vela.jpg",
      "assets/images/plancha.jpg",
      "assets/images/computador.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/vela.mp3"
  },
  {
    "id": 8,
    "question": "",
    "options": [
      "assets/images/plancha.jpg",
      "assets/images/vela.jpg",
      "assets/images/talcoDePies.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/talcoDePies.mp3"
  },
  {
    "id": 9,
    "question": "",
    "options": [
      "assets/images/plancha.jpg",
      "assets/images/micro.jpg",
      "assets/images/vela.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/micro.mp3"
  },
  {
    "id": 10,
    "question": "",
    "options": [
      "assets/images/remedio.jpg",
      "assets/images/plancha.jpg",
      "assets/images/computador.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/remedio.mp3"
  },
  {
    "id": 11,
    "question": "",
    "options": [
      "assets/images/sarten.jpg",
      "assets/images/computador.jpg",
      "assets/images/libro.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/sarten.mp3"
  },
  {
    "id": 12,
    "question": "",
    "options": [
      "assets/images/micro.jpg",
      "assets/images/refrigerador.jpg",
      "assets/images/vela.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/refrigerador.mp3"
  },
  {
    "id": 13,
    "question": "",
    "options": [
      "assets/images/hervidor.jpg",
      "assets/images/zanahoria.jpg",
      "assets/images/talcoDePies.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/hervidor.mp3"
  },
  {
    "id": 14,
    "question": "",
    "options": [
      "assets/images/zanahoria.jpg",
      "assets/images/lavadora.jpg",
      "assets/images/remedio.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/lavadora.mp3"
  },
  {
    "id": 15,
    "question": "",
    "options": [
      "assets/images/alfombra.jpg",
      "assets/images/cazuela.jpg",
      "assets/images/detergente.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/detergente.mp3"
  },
  {
    "id": 16,
    "question": "",
    "options": [
      "assets/images/alfombra.jpg",
      "assets/images/choclo.jpg",
      "assets/images/guantes.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/alfombra.mp3"
  },
  {
    "id": 17,
    "question": "",
    "options": [
      "assets/images/detergente.jpg",
      "assets/images/vela.jpg",
      "assets/images/choclo.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/choclo.mp3"
  },
  {
    "id": 18,
    "question": "",
    "options": [
      "assets/images/guantes.jpg",
      "assets/images/zanahoria.jpg",
      "assets/images/plancha.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/zanahoria.mp3"
  },
  {
    "id": 19,
    "question": "",
    "options": [
      "assets/images/esponja.jpg",
      "assets/images/micro.jpg",
      "assets/images/alfombra.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/esponja.mp3"
  },
  {
    "id": 20,
    "question": "",
    "options": [
      "assets/images/libro.jpg",
      "assets/images/alfombra.jpg",
      "assets/images/tapaDeBotella.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/tapaDeBotella.mp3"
  },
  {
    "id": 21,
    "question": "",
    "options": [
      "assets/images/colador.jpg",
      "assets/images/remedio.jpg",
      "assets/images/tapaDeBotella.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/colador.mp3"
  },
  {
    "id": 22,
    "question": "",
    "options": [
      "assets/images/hervidor.jpg",
      "assets/images/guantes.jpg",
      "assets/images/choclo.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/guantes.mp3"
  },
  {
    "id": 23,
    "question": "",
    "options": [
      "assets/images/mantel.jpg",
      "assets/images/gorro.jpg",
      "assets/images/cazuela.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/mantel.mp3"
  },
  {
    "id": 24,
    "question": "",
    "options": [
      "assets/images/detergente.jpg",
      "assets/images/pañuelo.jpg",
      "assets/images/cazuela.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/cazuela.mp3"
  },
  {
    "id": 25,
    "question": "",
    "options": [
      "assets/images/cazuela.jpg",
      "assets/images/aspiradora.jpg",
      "assets/images/refrigerador.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/aspiradora.mp3"
  },
  {
    "id": 26,
    "question": "",
    "options": [
      "assets/images/gorro.jpg",
      "assets/images/alfombra.jpg",
      "assets/images/detergente.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/gorro.mp3"
  },
  {
    "id": 27,
    "question": "",
    "options": [
      "assets/images/hervidor.jpg",
      "assets/images/vestido.jpg",
      "assets/images/libro.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/vestido.mp3"
  },
  {
    "id": 28,
    "question": "",
    "options": [
      "assets/images/libro.jpg",
      "assets/images/reloj.jpg",
      "assets/images/pañuelo.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/pañuelo.mp3"
  },
  {
    "id": 29,
    "question": "",
    "options": [
      "assets/images/vela.jpg",
      "assets/images/sillon.jpg",
      "assets/images/collar.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/collar.mp3"
  },
  {
    "id": 30,
    "question": "",
    "options": [
      "assets/images/camiseta.jpg",
      "assets/images/plancha.jpg",
      "assets/images/ballena.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/camiseta.mp3"
  },
  {
    "id": 32,
    "question": "",
    "options": [
      "assets/images/estufa.jpg",
      "assets/images/panty.jpg",
      "assets/images/sillon.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/panty.mp3"
  },
  {
    "id": 33,
    "question": "",
    "options": [
      "assets/images/batidora.jpg",
      "assets/images/calzoncillosLargos.jpg",
      "assets/images/ampolleta.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/ampolleta.mp3"
  },
  {
    "id": 34,
    "question": "",
    "options": [
      "assets/images/sillon.jpg",
      "assets/images/estufa.jpg",
      "assets/images/remedio.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/estufa.mp3"
  },
  {
    "id": 35,
    "question": "",
    "options": [
      "assets/images/batidora.jpg",
      "assets/images/collar.jpg",
      "assets/images/mantel.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/batidora.mp3"
  },
  {
    "id": 36,
    "question": "",
    "options": [
      "assets/images/sarten.jpg",
      "assets/images/melon.jpg",
      "assets/images/secadorDePelo.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/secadorDePelo.mp3"
  },
  {
    "id": 37,
    "question": "",
    "options": [
      "assets/images/licuadora.jpg",
      "assets/images/sandia.jpg",
      "assets/images/camiseta.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/licuadora.mp3"
  },
  {
    "id": 38,
    "question": "",
    "options": [
      "assets/images/sandia.jpg",
      "assets/images/panty.jpg",
      "assets/images/remedio.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/sandia.mp3"
  },
  {
    "id": 39,
    "question": "",
    "options": [
      "assets/images/remedio.jpg",
      "assets/images/melon.jpg",
      "assets/images/secador.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/melon.mp3"
  },
  {
    "id": 40,
    "question": "",
    "options": [
      "assets/images/kiwi.jpg",
      "assets/images/batidora.jpg",
      "assets/images/reloj.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/kiwi.mp3"
  },
  {
    "id": 41,
    "question": "",
    "options": [
      "assets/images/secadorDePelo.jpg",
      "assets/images/durazno.jpg",
      "assets/images/reloj.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/durazno.mp3"
  },
  {
    "id": 42,
    "question": "",
    "options": [
      "assets/images/detergente.jpg",
      "assets/images/alfombra.jpg",
      "assets/images/zapallo.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/zapallo.mp3"
  },
  {
    "id": 43,
    "question": "",
    "options": [
      "assets/images/frutilla.jpg",
      "assets/images/esponja.jpg",
      "assets/images/mantel.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/frutilla.mp3"
  },
  {
    "id": 44,
    "question": "",
    "options": [
      "assets/images/lavadora.jpg",
      "assets/images/licuadora.jpg",
      "assets/images/miel.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/miel.mp3"
  },
  {
    "id": 45,
    "question": "",
    "options": [
      "assets/images/hervidor.jpg",
      "assets/images/aceite.jpg",
      "assets/images/talcoDePies.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/aceite.mp3"
  },
  {
    "id": 46,
    "question": "",
    "options": [
      "assets/images/sarten.jpg",
      "assets/images/martillo.jpg",
      "assets/images/falda.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/falda.mp3"
  },
  {
    "id": 48,
    "question": "",
    "options": [
      "assets/images/licuadora.jpg",
      "assets/images/blusa.jpg",
      "assets/images/sandia.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/blusa.mp3"
  },
  {
    "id": 49,
    "question": "",
    "options": [
      "assets/images/falda.jpg",
      "assets/images/carritoDeSupermercado.jpg",
      "assets/images/kiwi.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/carritoDeSupermercado.mp3"
  },
  {
    "id": 50,
    "question": "",
    "options": [
      "assets/images/pañal.jpg",
      "assets/images/kiwi.jpg",
      "assets/images/estufa.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/pañal.mp3"
  }
];

// //data para nivel alto
const List data3 = [
  {
    "id": 1,
    "question": "",
    "options": [
      "assets/images/sombrero.jpg",
      "assets/images/estuche.jpg",
      "assets/images/arbol.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/estuche.mp3"
  },
  {
    "id": 2,
    "question": "",
    "options": [
      "assets/images/cuaderno.jpg",
      "assets/images/brocoli.jpg",
      "assets/images/sombrero.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/sombrero.mp3"
  },
  {
    "id": 3,
    "question": "",
    "options": [
      "assets/images/brocoli.jpg",
      "assets/images/sombrero.jpg",
      "assets/images/cuaderno.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/brocoli.mp3"
  },
  {
    "id": 4,
    "question": "",
    "options": [
      "assets/images/cuaderno.jpg",
      "assets/images/espejo.jpg",
      "assets/images/sombrero.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/cuaderno.mp3"
  },
  {
    "id": 5,
    "question": "",
    "options": [
      "assets/images/brocoli.jpg",
      "assets/images/espejo.jpg",
      "assets/images/lampara.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/espejo.mp3"
  },
  {
    "id": 6,
    "question": "",
    "options": [
      "assets/images/lampara.jpg",
      "assets/images/espejo.jpg",
      "assets/images/ducha.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/lampara.mp3"
  },
  {
    "id": 7,
    "question": "",
    "options": [
      "assets/images/sacapunta.jpg",
      "assets/images/arbol.jpg",
      "assets/images/lampara.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/sacapunta.mp3"
  },
  {
    "id": 8,
    "question": "",
    "options": [
      "assets/images/lampara.jpg",
      "assets/images/pijama.jpg",
      "assets/images/arbol.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/arbol.mp3"
  },
  {
    "id": 9,
    "question": "",
    "options": [
      "assets/images/cuaderno.jpg",
      "assets/images/anillo.jpg",
      "assets/images/cuadro.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/anillo.mp3"
  },
  {
    "id": 10,
    "question": "",
    "options": [
      "assets/images/cuadro.jpg",
      "assets/images/anillo.jpg",
      "assets/images/sombrero.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/cuadro.mp3"
  },
  {
    "id": 11,
    "question": "",
    "options": [
      "assets/images/escoba.jpg",
      "assets/images/arbol.jpg",
      "assets/images/sombrero.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/escoba.mp3"
  },
  {
    "id": 13,
    "question": "",
    "options": [
      "assets/images/edificio.jpg",
      "assets/images/cuadro.jpg",
      "assets/images/frasco.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/edificio.mp3"
  },
  {
    "id": 14,
    "question": "",
    "options": [
      "assets/images/frasco.jpg",
      "assets/images/ducha.jpg",
      "assets/images/revista.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/ducha.mp3"
  },
  {
    "id": 15,
    "question": "",
    "options": [
      "assets/images/piña.jpg",
      "assets/images/ducha.jpg",
      "assets/images/revista.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/revista.mp3"
  },
  {
    "id": 16,
    "question": "",
    "options": [
      "assets/images/piñata.jpg",
      "assets/images/acelga.jpg",
      "assets/images/mueble.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/piñata.mp3"
  },
  {
    "id": 17,
    "question": "",
    "options": [
      "assets/images/frasco.jpg",
      "assets/images/casa.jpg",
      "assets/images/cereza.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/cereza.mp3"
  },
  {
    "id": 18,
    "question": "",
    "options": [
      "assets/images/casa.jpg",
      "assets/images/frasco.jpg",
      "assets/images/cereza.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/frasco.mp3"
  },
  {
    "id": 19,
    "question": "",
    "options": [
      "assets/images/acelga.jpg",
      "assets/images/cuadro.jpg",
      "assets/images/arbol.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/acelga.mp3"
  },
  {
    "id": 20,
    "question": "",
    "options": [
      "assets/images/piña.jpg",
      "assets/images/nube.jpg",
      "assets/images/apio.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/apio.mp3"
  },
  {
    "id": 21,
    "question": "",
    "options": [
      "assets/images/nube.jpg",
      "assets/images/piñata.jpg",
      "assets/images/apio.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/nube.mp3"
  },
  {
    "id": 22,
    "question": "",
    "options": [
      "assets/images/espejo.jpg",
      "assets/images/sal.jpg",
      "assets/images/ojo.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/sal.mp3"
  },
  {
    "id": 23,
    "question": "",
    "options": [
      "assets/images/lentejas.jpg",
      "assets/images/taladro.jpg",
      "assets/images/escritorio.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/lentejas.mp3"
  },
  {
    "id": 24,
    "question": "",
    "options": [
      "assets/images/lentejas.jpg",
      "assets/images/escritorio.jpg",
      "assets/images/taladro.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/taladro.mp3"
  },
  {
    "id": 25,
    "question": "",
    "options": [
      "assets/images/taladro.jpg",
      "assets/images/escritorio.jpg",
      "assets/images/lentejas.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/escritorio.mp3"
  },
  {
    "id": 26,
    "question": "",
    "options": [
      "assets/images/maleta.jpg",
      "assets/images/aguja.jpg",
      "assets/images/acelga.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/maleta.mp3"
  },
  {
    "id": 27,
    "question": "",
    "options": [
      "assets/images/cereza.jpg",
      "assets/images/aguja.jpg",
      "assets/images/maleta.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/aguja.mp3"
  },
  {
    "id": 28,
    "question": "",
    "options": [
      "assets/images/rastrillo.jpg",
      "assets/images/lampara.jpg",
      "assets/images/helado.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/helado.mp3"
  },
  {
    "id": 29,
    "question": "",
    "options": [
      "assets/images/shampoo.jpg",
      "assets/images/algodon.jpg",
      "assets/images/chocolate.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/chocolate.mp3"
  },
  {
    "id": 30,
    "question": "",
    "options": [
      "assets/images/algodon.jpg",
      "assets/images/taladro.jpg",
      "assets/images/escritorio.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/algodon.mp3"
  },
  {
    "id": 31,
    "question": "",
    "options": [
      "assets/images/rastrillo.jpg",
      "assets/images/algodon.jpg",
      "assets/images/escritorio.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/rastrillo.mp3"
  },
  {
    "id": 32,
    "question": "",
    "options": [
      "assets/images/maleta.jpg",
      "assets/images/cafetera.jpg",
      "assets/images/algodon.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/cafetera.mp3"
  },
  {
    "id": 33,
    "question": "",
    "options": [
      "assets/images/helado.jpg",
      "assets/images/escoba.jpg",
      "assets/images/zorro.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/zorro.mp3"
  },
  {
    "id": 34,
    "question": "",
    "options": [
      "assets/images/lampara.jpg",
      "assets/images/puma.jpg",
      "assets/images/escritorio.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/puma.mp3"
  },
  {
    "id": 35,
    "question": "",
    "options": [
      "assets/images/uslero.jpg",
      "assets/images/chocolate.jpg",
      "assets/images/manguera.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/uslero.mp3"
  },
  {
    "id": 36,
    "question": "",
    "options": [
      "assets/images/destornillador.jpg",
      "assets/images/cintillo.jpg",
      "assets/images/manguera.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/manguera.mp3"
  },
  {
    "id": 37,
    "question": "",
    "options": [
      "assets/images/regadera.jpg",
      "assets/images/cafetera.jpg",
      "assets/images/manilla.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/regadera.mp3"
  },
  {
    "id": 38,
    "question": "",
    "options": [
      "assets/images/cortina.jpg",
      "assets/images/enchufe.jpg",
      "assets/images/cafetera.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/cortina.mp3"
  },
  {
    "id": 39,
    "question": "",
    "options": [
      "assets/images/rastrillo.jpg",
      "assets/images/destornillador.jpg",
      "assets/images/enchufe.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/destornillador.mp3"
  },
  {
    "id": 40,
    "question": "",
    "options": [
      "assets/images/mascarilla.jpg",
      "assets/images/cintillo.jpg",
      "assets/images/algodon.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/mascarilla.mp3"
  },
  {
    "id": 41,
    "question": "",
    "options": [
      "assets/images/manilla.jpg",
      "assets/images/cintillo.jpg",
      "assets/images/algodon.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/cintillo.mp3"
  },
  {
    "id": 42,
    "question": "",
    "options": [
      "assets/images/rastrillo.jpg",
      "assets/images/manguera.jpg",
      "assets/images/interruptor.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/interruptor.mp3"
  },
  {
    "id": 43,
    "question": "",
    "options": [
      "assets/images/manilla.jpg",
      "assets/images/manguera.jpg",
      "assets/images/uslero.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/manilla.mp3"
  },
  {
    "id": 44,
    "question": "",
    "options": [
      "assets/images/taladro.jpg",
      "assets/images/helado.jpg",
      "assets/images/enchufe.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/enchufe.mp3"
  },
  {
    "id": 45,
    "question": "",
    "options": [
      "assets/images/enchufe.jpg",
      "assets/images/rueda.jpg",
      "assets/images/cortina.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/rueda.mp3"
  },
  {
    "id": 46,
    "question": "",
    "options": [
      "assets/images/ducha.jpg",
      "assets/images/nube.jpg",
      "assets/images/martillo.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/martillo.mp3"
  },
  {
    "id": 47,
    "question": "",
    "options": [
      "assets/images/hacha.jpg",
      "assets/images/anillo.jpg",
      "assets/images/cuaderno.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/hacha.mp3"
  },
  {
    "id": 48,
    "question": "",
    "options": [
      "assets/images/sombrero.jpg",
      "assets/images/haba.jpg",
      "assets/images/espejo.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/haba.mp3"
  },
  {
    "id": 49,
    "question": "",
    "options": [
      "assets/images/revista.jpg",
      "assets/images/carreta.jpg",
      "assets/images/piñata.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/carreta.mp3"
  },
  {
    "id": 50,
    "question": "",
    "options": [
      "assets/images/tortuga.jpg",
      "assets/images/uslero.jpg",
      "assets/images/mascarilla.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/tortuga.mp3"
  }
];
