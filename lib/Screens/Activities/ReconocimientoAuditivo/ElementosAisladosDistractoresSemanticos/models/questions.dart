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
      "assets/images/goma.jpg",
      "assets/images/lana.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/lapiz.mp3"
  },
  {
    "id": 2,
    "question": "",
    "options": [
      "assets/images/binoculares.jpg",
      "assets/images/lentejas.jpg",
      "assets/images/lentes.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/lentes.mp3"
  },
  {
    "id": 3,
    "question": "",
    "options": [
      "assets/images/vaso.jpg",
      "assets/images/taza.jpg",
      "assets/images/vaca.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/vaso.mp3"
  },
  {
    "id": 4,
    "question": "",
    "options": [
      "assets/images/tenedor.jpg",
      "assets/images/cuchara.jpg",
      "assets/images/tetera.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/tenedor.mp3"
  },
  {
    "id": 5,
    "question": "",
    "options": [
      "assets/images/televisor.jpg",
      "assets/images/telefono.jpg",
      "assets/images/radio.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/telefono.mp3"
  },
  {
    "id": 6,
    "question": "",
    "options": [
      "assets/images/cama.jpg",
      "assets/images/puerta.jpg",
      "assets/images/casa.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/cama.mp3"
  },
  {
    "id": 7,
    "question": "",
    "options": [
      "assets/images/manzana.jpg",
      "assets/images/naranja.jpg",
      "assets/images/mandarina.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/manzana.mp3"
  },
  {
    "id": 8,
    "question": "",
    "options": [
      "assets/images/semaforo.jpg",
      "assets/images/jabon.jpg",
      "assets/images/cepilloDeDientes.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/cepilloDeDientes.mp3"
  },
  {
    "id": 10,
    "question": "",
    "options": [
      "assets/images/peineta.jpg",
      "assets/images/cepilloDeDientes.jpg",
      "assets/images/pelota.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/peineta.mp3"
  },
  {
    "id": 11,
    "question": "",
    "options": [
      "assets/images/cuchara.jpg",
      "assets/images/tenedor.jpg",
      "assets/images/cuchillo.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/cuchara.mp3"
  },
  {
    "id": 12,
    "question": "",
    "options": [
      "assets/images/tapa.jpg",
      "assets/images/taza.jpg",
      "assets/images/plato.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/taza.mp3"
  },
  {
    "id": 13,
    "question": "",
    "options": [
      "assets/images/pastaDeDientes.jpg",
      "assets/images/pastel.jpg",
      "assets/images/vaso.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/pastaDeDientes.mp3"
  },
  {
    "id": 14,
    "question": "",
    "options": [
      "assets/images/cepilloDeDientes.jpg",
      "assets/images/toalla.jpg",
      "assets/images/tomate.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/toalla.mp3"
  },
  {
    "id": 15,
    "question": "",
    "options": [
      "assets/images/dinosaurio.jpg",
      "assets/images/billetera.jpg",
      "assets/images/dinero.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/dinero.mp3"
  },
  {
    "id": 16,
    "question": "",
    "options": [
      "assets/images/zapato.jpg",
      "assets/images/balerina.jpg",
      "assets/images/zapatilla.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/zapato.mp3"
  },
  {
    "id": 17,
    "question": "",
    "options": [
      "assets/images/shampoo.jpg",
      "assets/images/short.jpg",
      "assets/images/chaleco.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/chaleco.mp3"
  },
  {
    "id": 18,
    "question": "",
    "options": [
      "assets/images/boca.jpg",
      "assets/images/bota.jpg",
      "assets/images/short.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/bota.mp3"
  },
  {
    "id": 19,
    "question": "",
    "options": [
      "assets/images/polera.jpg",
      "assets/images/falda.jpg",
      "assets/images/polilla.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/polera.mp3"
  },
  {
    "id": 20,
    "question": "",
    "options": [
      "assets/images/zapato.jpg",
      "assets/images/calcetin.jpg",
      "assets/images/cama.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/calcetin.mp3"
  },
  {
    "id": 21,
    "question": "",
    "options": [
      "assets/images/pastilla.jpg",
      "assets/images/chaleco.jpg",
      "assets/images/pantalon.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/pantalon.mp3"
  },
  {
    "id": 22,
    "question": "",
    "options": [
      "assets/images/chaleco.jpg",
      "assets/images/camisa.jpg",
      "assets/images/camino.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/camisa.mp3"
  },
  {
    "id": 23,
    "question": "",
    "options": [
      "assets/images/mesa.jpg",
      "assets/images/silla.jpg",
      "assets/images/masa.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/mesa.mp3"
  },
  {
    "id": 24,
    "question": "",
    "options": [
      "assets/images/cigueña.jpg",
      "assets/images/mesa.jpg",
      "assets/images/silla.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/silla.mp3"
  },
  {
    "id": 25,
    "question": "",
    "options": [
      "assets/images/hoja.jpg",
      "assets/images/olla.jpg",
      "assets/images/plato.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/olla.mp3"
  },
  {
    "id": 26,
    "question": "",
    "options": [
      "assets/images/wc.jpg",
      "assets/images/ducha.jpg",
      "assets/images/bata.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/wc.mp3"
  },
  {
    "id": 27,
    "question": "",
    "options": [
      "assets/images/tenedor.jpg",
      "assets/images/cuchillo.jpg",
      "assets/images/cucharon.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/cuchillo.mp3"
  },
  {
    "id": 28,
    "question": "",
    "options": [
      "assets/images/comedor.jpg",
      "assets/images/olla.jpg",
      "assets/images/hornoCocina.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/hornoCocina.mp3"
  },
  {
    "id": 29,
    "question": "",
    "options": [
      "assets/images/palta.jpg",
      "assets/images/cuchara.jpg",
      "assets/images/plato.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/plato.mp3"
  },
  {
    "id": 30,
    "question": "",
    "options": [
      "assets/images/llave.jpg",
      "assets/images/yema.jpg",
      "assets/images/billetera.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/llave.mp3"
  },
  {
    "id": 31,
    "question": "",
    "options": [
      "assets/images/televisor.jpg",
      "assets/images/telefono.jpg",
      "assets/images/radio.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/televisor.mp3"
  },
  {
    "id": 32,
    "question": "",
    "options": [
      "assets/images/rama.jpg",
      "assets/images/radio.jpg",
      "assets/images/televisor.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/radio.mp3"
  },
  {
    "id": 33,
    "question": "",
    "options": [
      "assets/images/lima.jpg",
      "assets/images/cebolla.jpg",
      "assets/images/limon.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/limon.mp3"
  },
  {
    "id": 34,
    "question": "",
    "options": [
      "assets/images/tomate.jpg",
      "assets/images/papas.jpg",
      "assets/images/toalla.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/papas.mp3"
  },
  {
    "id": 35,
    "question": "",
    "options": [
      "assets/images/ajo.jpg",
      "assets/images/ojo.jpg",
      "assets/images/tomate.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/ajo.mp3"
  },
  {
    "id": 36,
    "question": "",
    "options": [
      "assets/images/pala.jpg",
      "assets/images/cebolla.jpg",
      "assets/images/papas.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/papas.mp3"
  },
  {
    "id": 37,
    "question": "",
    "options": [
      "assets/images/pera.jpg",
      "assets/images/pesa.jpg",
      "assets/images/manzana.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/pera.mp3"
  },
  {
    "id": 38,
    "question": "",
    "options": [
      "assets/images/naranja.jpg",
      "assets/images/pera.jpg",
      "assets/images/navaja.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/naranja.mp3"
  },
  {
    "id": 39,
    "question": "",
    "options": [
      "assets/images/manzana.jpg",
      "assets/images/platano.jpg",
      "assets/images/plato.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/platano.mp3"
  },
  {
    "id": 40,
    "question": "",
    "options": [
      "assets/images/pan.jpg",
      "assets/images/flan.jpg",
      "assets/images/fideos.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/pan.mp3"
  },
  {
    "id": 41,
    "question": "",
    "options": [
      "assets/images/lechuga.jpg",
      "assets/images/palta.jpg",
      "assets/images/pala.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/palta.mp3"
  },
  {
    "id": 42,
    "question": "",
    "options": [
      "assets/images/cebra.jpg",
      "assets/images/manzana.jpg",
      "assets/images/cebolla.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/cebolla.mp3"
  },
  {
    "id": 43,
    "question": "",
    "options": [
      "assets/images/pollo.jpg",
      "assets/images/huevo.jpg",
      "assets/images/pozo.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/pollo.mp3"
  },
  {
    "id": 44,
    "question": "",
    "options": [
      "assets/images/arroz.jpg",
      "assets/images/lengua.jpg",
      "assets/images/leche.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/leche.mp3"
  },
  {
    "id": 45,
    "question": "",
    "options": [
      "assets/images/fideos.jpg",
      "assets/images/huevo.jpg",
      "assets/images/hueso.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/huevo.mp3"
  },
  {
    "id": 46,
    "question": "",
    "options": [
      "assets/images/carnet.jpg",
      "assets/images/huevo.jpg",
      "assets/images/carne.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/carne.mp3"
  },
  {
    "id": 47,
    "question": "",
    "options": [
      "assets/images/arroz.jpg",
      "assets/images/manzana.jpg",
      "assets/images/plato.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/arroz.mp3"
  },
  {
    "id": 48,
    "question": "",
    "options": [
      "assets/images/leche.jpg",
      "assets/images/te.jpg",
      "assets/images/tenedor.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/te.mp3"
  },
  {
    "id": 49,
    "question": "",
    "options": [
      "assets/images/leche.jpg",
      "assets/images/cafe.jpg",
      "assets/images/carta.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/cafe.mp3"
  }
];

const List data2 = [
  {
    "id": 1,
    "question": "",
    "options": [
      "assets/images/almohada.jpg",
      "assets/images/sabana.jpg",
      "assets/images/hamaca.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/almohada.mp3"
  },
  {
    "id": 2,
    "question": "",
    "options": [
      "assets/images/guatero.jpg",
      "assets/images/bufanda.jpg",
      "assets/images/guantes.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/guantes.mp3"
  },
  {
    "id": 3,
    "question": "",
    "options": [
      "assets/images/medias.jpg",
      "assets/images/short.jpg",
      "assets/images/mesa.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/medias.mp3"
  },
  {
    "id": 4,
    "question": "",
    "options": [
      "assets/images/falda.jpg",
      "assets/images/vestido.jpg",
      "assets/images/fantasma.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/falda.mp3"
  },
  {
    "id": 5,
    "question": "",
    "options": [
      "assets/images/frutilla.jpg",
      "assets/images/uva.jpg",
      "assets/images/universidad.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/uva.mp3"
  },
  {
    "id": 6,
    "question": "",
    "options": [
      "assets/images/poroto.jpg",
      "assets/images/lentejas.jpg",
      "assets/images/polilla.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/poroto.mp3"
  },
  {
    "id": 7,
    "question": "",
    "options": [
      "assets/images/bata.jpg",
      "assets/images/bota.jpg",
      "assets/images/blusa.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/bata.mp3"
  },
  {
    "id": 9,
    "question": "",
    "options": [
      "assets/images/carro.jpg",
      "assets/images/jarro.jpg",
      "assets/images/pocillo.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/jarro.mp3"
  },
  {
    "id": 10,
    "question": "",
    "options": [
      "assets/images/carro.jpg",
      "assets/images/jarro.jpg",
      "assets/images/pocillo.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/carro.mp3"
  },
  {
    "id": 13,
    "question": "",
    "options": [
      "assets/images/lavadora.jpg",
      "assets/images/batidora.jpg",
      "assets/images/aspiradora.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/lavadora.mp3"
  },
  {
    "id": 14,
    "question": "",
    "options": [
      "assets/images/revista.jpg",
      "assets/images/libro.jpg",
      "assets/images/libreria.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/libro.mp3"
  },
  {
    "id": 15,
    "question": "",
    "options": [
      "assets/images/colador.jpg",
      "assets/images/televisor.jpg",
      "assets/images/computador.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/computador.mp3"
  },
  {
    "id": 16,
    "question": "",
    "options": [
      "assets/images/colador.jpg",
      "assets/images/televisor.jpg",
      "assets/images/computador.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/colador.mp3"
  },
  {
    "id": 17,
    "question": "",
    "options": [
      "assets/images/aspiradora.jpg",
      "assets/images/planta.jpg",
      "assets/images/plancha.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/plancha.mp3"
  },
  {
    "id": 18,
    "question": "",
    "options": [
      "assets/images/aspiradora.jpg",
      "assets/images/planta.jpg",
      "assets/images/plancha.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/planta.mp3"
  },
  {
    "id": 19,
    "question": "",
    "options": [
      "assets/images/aspiradora.jpg",
      "assets/images/lavadora.jpg",
      "assets/images/plancha.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/aspiradora.mp3"
  },
  {
    "id": 20,
    "question": "",
    "options": [
      "assets/images/bus.jpg",
      "assets/images/micro.jpg",
      "assets/images/milo.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/micro.mp3"
  },
  {
    "id": 21,
    "question": "",
    "options": [
      "assets/images/micro.jpg",
      "assets/images/milo.jpg",
      "assets/images/bus.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/bus.mp3"
  },
  {
    "id": 22,
    "question": "",
    "options": [
      "assets/images/taco.jpg",
      "assets/images/talco.jpg",
      "assets/images/crema.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/talco.mp3"
  },
  {
    "id": 23,
    "question": "",
    "options": [
      "assets/images/sarten.jpg",
      "assets/images/sandia.jpg",
      "assets/images/olla.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/sarten.mp3"
  },
  {
    "id": 25,
    "question": "",
    "options": [
      "assets/images/afeitadora.jpg",
      "assets/images/batidora.jpg",
      "assets/images/refrigerador.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/batidora.mp3"
  },
  {
    "id": 27,
    "question": "",
    "options": [
      "assets/images/colgador.jpg",
      "assets/images/colador.jpg",
      "assets/images/cucharon.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/colador.mp3"
  },
  {
    "id": 28,
    "question": "",
    "options": [
      "assets/images/colador.jpg",
      "assets/images/cucharon.jpg",
      "assets/images/colgador.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/colgador.mp3"
  },
  {
    "id": 29,
    "question": "",
    "options": [
      "assets/images/colgador.jpg",
      "assets/images/colador.jpg",
      "assets/images/cucharon.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/cucharon.mp3"
  },
  {
    "id": 31,
    "question": "",
    "options": [
      "assets/images/cazuela.jpg",
      "assets/images/carpeta.jpg",
      "assets/images/pastelDeChoclo.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/cazuela.mp3"
  },
  {
    "id": 32,
    "question": "",
    "options": [
      "assets/images/cazuela.jpg",
      "assets/images/pastelDeChoclo.jpg",
      "assets/images/carpeta.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/pastelDeChoclo.mp3"
  },
  {
    "id": 33,
    "question": "",
    "options": [
      "assets/images/gorro.jpg",
      "assets/images/bufanda.jpg",
      "assets/images/pastillas.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/pastillas.mp3"
  },
  {
    "id": 34,
    "question": "",
    "options": [
      "assets/images/pañal.jpg",
      "assets/images/pañuelo.jpg",
      "assets/images/poncho.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/pañuelo.mp3"
  },
  {
    "id": 35,
    "question": "",
    "options": [
      "assets/images/pañal.jpg",
      "assets/images/pañuelo.jpg",
      "assets/images/corbata.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/pañal.mp3"
  },
  {
    "id": 36,
    "question": "",
    "options": [
      "assets/images/camiseta.jpg",
      "assets/images/lampara.jpg",
      "assets/images/ampolleta.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/ampolleta.mp3"
  },
  {
    "id": 38,
    "question": "",
    "options": [
      "assets/images/aceite.jpg",
      "assets/images/oregano.jpg",
      "assets/images/aceituna.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/aceite.mp3"
  },
  {
    "id": 39,
    "question": "",
    "options": [
      "assets/images/cinturon.jpg",
      "assets/images/tiburon.jpg",
      "assets/images/pescado.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/tiburon.mp3"
  },
  {
    "id": 40,
    "question": "",
    "options": [
      "assets/images/hervidor.jpg",
      "assets/images/plato.jpg",
      "assets/images/helado.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/hervidor.mp3"
  },
  {
    "id": 41,
    "question": "",
    "options": [
      "assets/images/mantel.jpg",
      "assets/images/alfombra.jpg",
      "assets/images/alpiste.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/alfombra.mp3"
  },
  {
    "id": 42,
    "question": "",
    "options": [
      "assets/images/habas.jpg",
      "assets/images/choza.jpg",
      "assets/images/choclo.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/choclo.mp3"
  },
  {
    "id": 43,
    "question": "",
    "options": [
      "assets/images/zanahoria.jpg",
      "assets/images/piña.jpg",
      "assets/images/zapallo.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/zanahoria.mp3"
  },
  {
    "id": 44,
    "question": "",
    "options": [
      "assets/images/hervidor.jpg",
      "assets/images/tetera.jpg",
      "assets/images/juguera.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/juguera.mp3"
  },
  {
    "id": 46,
    "question": "",
    "options": [
      "assets/images/frambuesa.jpg",
      "assets/images/cereza.jpg",
      "assets/images/frutilla.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/frutilla.mp3"
  },
  {
    "id": 47,
    "question": "",
    "options": [
      "assets/images/refrigerador.jpg",
      "assets/images/cocina.jpg",
      "assets/images/relampago.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/refrigerador.mp3"
  },
  {
    "id": 48,
    "question": "",
    "options": [
      "assets/images/sandia.jpg",
      "assets/images/melon.jpg",
      "assets/images/menton.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/melon.mp3"
  },
  {
    "id": 49,
    "question": "",
    "options": [
      "assets/images/sardina.jpg",
      "assets/images/sandia.jpg",
      "assets/images/melon.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/sandia.mp3"
  },
  {
    "id": 50,
    "question": "",
    "options": [
      "assets/images/zapallo.jpg",
      "assets/images/zanahoria.jpg",
      "assets/images/acelga.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/zapallo.mp3"
  }
];

//data para los dificiles
const List data3 = [
  // {
  //   "id": 1,
  //   "question": "",
  //   "options": [
  //     "assets/images/corbata.jpg",
  //     "assets/images/camiseta.jpg",
  //     "assets/images/cordon.jpg"
  //   ],
  //   "answer_index": 0,
  //   "audio": "assets/audio/corbata.mp3"
  // },
  // {
  //   "id": 2,
  //   "question": "",
  //   "options": [
  //     "assets/images/camiseta.jpg",
  //     "assets/images/corbata.jpg",
  //     "assets/images/cordon.jpg"
  //   ],
  //   "answer_index": 2,
  //   "audio": "assets/audio/cordon.mp3"
  // },
  {
    "id": 3,
    "question": "",
    "options": [
      "assets/images/estuche.jpg",
      "assets/images/corrector.jpg",
      "assets/images/espina.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/estuche.mp3"
  },
  // {
  //   "id": 4,
  //   "question": "",
  //   "options": [
  //     "assets/images/espina.jpg",
  //     "assets/images/raices.jpg",
  //     "assets/images/estuche.jpg"
  //   ],
  //   "answer_index": 0,
  //   "audio": "assets/audio/espina.mp3"
  // },
  {
    "id": 5,
    "question": "",
    "options": [
      "assets/images/boina.jpg",
      "assets/images/sombrero.jpg",
      "assets/images/sobre.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/sombrero.mp3"
  },
  // {
  //   "id": 6,
  //   "question": "",
  //   "options": [
  //     "assets/images/sobre.jpg",
  //     "assets/images/estampilla.jpg",
  //     "assets/images/sombrero.jpg"
  //   ],
  //   "answer_index": 0,
  //   "audio": "assets/audio/sobre.mp3"
  // },
  // {
  //   "id": 7,
  //   "question": "",
  //   "options": [
  //     "assets/images/pluma.jpg",
  //     "assets/images/plumero.jpg",
  //     "assets/images/sombrero.jpg"
  //   ],
  //   "answer_index": 0,
  //   "audio": "assets/audio/pluma.mp3"
  // },
  {
    "id": 8,
    "question": "",
    "options": [
      "assets/images/cuadro.jpg",
      "assets/images/cartulina.jpg",
      "assets/images/cuaderno.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/cuaderno.mp3"
  },
  {
    "id": 9,
    "question": "",
    "options": [
      "assets/images/cuaderno.jpg",
      "assets/images/cuadro.jpg",
      "assets/images/repisa.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/cuadro.mp3"
  },
  // {
  //   "id": 10,
  //   "question": "",
  //   "options": [
  //     "assets/images/bufanda.jpg",
  //     "assets/images/boina.jpg",
  //     "assets/images/burro.jpg"
  //   ],
  //   "answer_index": 0,
  //   "audio": "assets/audio/bufanda.mp3"
  // },
  {
    "id": 11,
    "question": "",
    "options": [
      "assets/images/pijama.jpg",
      "assets/images/pizarra.jpg",
      "assets/images/poleron.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/pijama.mp3"
  },
  {
    "id": 12,
    "question": "",
    "options": [
      "assets/images/pasto.jpg",
      "assets/images/arbol.jpg",
      "assets/images/arcoDeFutbol.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/arbol.mp3"
  },
  {
    "id": 13,
    "question": "",
    "options": [
      "assets/images/lampara.jpg",
      "assets/images/lamina.jpg",
      "assets/images/velador.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/lampara.mp3"
  },
  {
    "id": 14,
    "question": "",
    "options": [
      "assets/images/acuario.jpg",
      "assets/images/anillo.jpg",
      "assets/images/pulsera.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/anillo.mp3"
  },
  {
    "id": 15,
    "question": "",
    "options": [
      "assets/images/computador.jpg",
      "assets/images/cuaderno.jpg",
      "assets/images/cuadro.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/cuadro.mp3"
  },
  // {
  //   "id": 16,
  //   "question": "",
  //   "options": [
  //     "assets/images/copa.jpg",
  //     "assets/images/boca.jpg",
  //     "assets/images/corcho.jpg"
  //   ],
  //   "answer_index": 0,
  //   "audio": "assets/audio/copa.mp3"
  // },
  {
    "id": 17,
    "question": "",
    "options": [
      "assets/images/agua.jpg",
      "assets/images/hilo.jpg",
      "assets/images/aguja.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/aguja.mp3"
  },
  {
    "id": 18,
    "question": "",
    "options": [
      "assets/images/galleta.jpg",
      "assets/images/helado.jpg",
      "assets/images/elefante.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/helado.mp3"
  },
  {
    "id": 19,
    "question": "",
    "options": [
      "assets/images/chocolate.jpg",
      "assets/images/helado.jpg",
      "assets/images/champiñon.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/chocolate.mp3"
  },
  {
    "id": 20,
    "question": "",
    "options": [
      "assets/images/agua.jpg",
      "assets/images/algodon.jpg",
      "assets/images/alga.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/algodon.mp3"
  },
  {
    "id": 21,
    "question": "",
    "options": [
      "assets/images/rama.jpg",
      "assets/images/pala.jpg",
      "assets/images/rastrillo.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/rastrillo.mp3"
  },
  {
    "id": 22,
    "question": "",
    "options": [
      "assets/images/te.jpg",
      "assets/images/cafetera.jpg",
      "assets/images/cafe.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/cafetera.mp3"
  },
  {
    "id": 23,
    "question": "",
    "options": [
      "assets/images/cereza.jpg",
      "assets/images/acelga.jpg",
      "assets/images/cerveza.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/cereza.mp3"
  },
  {
    "id": 24,
    "question": "",
    "options": [
      "assets/images/jarroDeJugo.jpg",
      "assets/images/frambuesa.jpg",
      "assets/images/frasco.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/frasco.mp3"
  },
  {
    "id": 25,
    "question": "",
    "options": [
      "assets/images/aguja.jpg",
      "assets/images/acelga.jpg",
      "assets/images/betarraga.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/acelga.mp3"
  },
  {
    "id": 26,
    "question": "",
    "options": [
      "assets/images/apio.jpg",
      "assets/images/acelga.jpg",
      "assets/images/hamaca.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/apio.mp3"
  },
  {
    "id": 27,
    "question": "",
    "options": [
      "assets/images/nutria.jpg",
      "assets/images/nube.jpg",
      "assets/images/lluvia.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/nube.mp3"
  },
  {
    "id": 29,
    "question": "",
    "options": [
      "assets/images/garbanzos.jpg",
      "assets/images/lentejuelas.jpg",
      "assets/images/lentejas.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/lentejas.mp3"
  },
  {
    "id": 30,
    "question": "",
    "options": [
      "assets/images/taladro.jpg",
      "assets/images/tapa.jpg",
      "assets/images/serrucho.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/taladro.mp3"
  },
  {
    "id": 31,
    "question": "",
    "options": [
      "assets/images/escritorio.jpg",
      "assets/images/velador.jpg",
      "assets/images/escalera.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/escritorio.mp3"
  },
  // {
  //   "id": 32,
  //   "question": "",
  //   "options": [
  //     "assets/images/mamadera.jpg",
  //     "assets/images/escalera.jpg",
  //     "assets/images/ascensor.jpg"
  //   ],
  //   "answer_index": 1,
  //   "audio": "assets/audio/escalera.mp3"
  // },
  {
    "id": 33,
    "question": "",
    "options": [
      "assets/images/tornillo.jpg",
      "assets/images/perro.jpg",
      "assets/images/tortuga.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/tortuga.mp3"
  },
  // {
  //   "id": 35,
  //   "question": "",
  //   "options": [
  //     "assets/images/dado.jpg",
  //     "assets/images/dedo.jpg",
  //     "assets/images/fichas.jpg"
  //   ],
  //   "answer_index": 0,
  //   "audio": "assets/audio/dado.mp3"
  // },
  {
    "id": 36,
    "question": "",
    "options": [
      "assets/images/serrucho.jpg",
      "assets/images/hada.jpg",
      "assets/images/hacha.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/hacha.mp3"
  },
  // {
  //   "id": 37,
  //   "question": "",
  //   "options": [
  //     "assets/images/serrucho.jpg",
  //     "assets/images/pilucho.jpg",
  //     "assets/images/hacha.jpg"
  //   ],
  //   "answer_index": 0,
  //   "audio": "assets/audio/serrucho.mp3"
  // },
  {
    "id": 38,
    "question": "",
    "options": [
      "assets/images/martillo.jpg",
      "assets/images/cuchillo.jpg",
      "assets/images/hacha.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/martillo.mp3"
  },
  {
    "id": 39,
    "question": "",
    "options": [
      "assets/images/hada.jpg",
      "assets/images/haba.jpg",
      "assets/images/porotosVerdes.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/haba.mp3"
  },
  // {
  //   "id": 40,
  //   "question": "",
  //   "options": [
  //     "assets/images/cuerda.jpg",
  //     "assets/images/cueva.jpg",
  //     "assets/images/hilo.jpg"
  //   ],
  //   "answer_index": 0,
  //   "audio": "assets/audio/cuerda.mp3"
  // },
  // {
  //   "id": 41,
  //   "question": "",
  //   "options": [
  //     "assets/images/bala.jpg",
  //     "assets/images/pala.jpg",
  //     "assets/images/martillo.jpg"
  //   ],
  //   "answer_index": 1,
  //   "audio": "assets/audio/pala.mp3"
  // },
  {
    "id": 42,
    "question": "",
    "options": [
      "assets/images/espatula.jpg",
      "assets/images/labial.jpg",
      "assets/images/espejo.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/espejo.mp3"
  },
  {
    "id": 43,
    "question": "",
    "options": [
      "assets/images/maleta.jpg",
      "assets/images/carreta.jpg",
      "assets/images/mochila.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/maleta.mp3"
  },
  {
    "id": 44,
    "question": "",
    "options": [
      "assets/images/sobre.jpg",
      "assets/images/cebra.jpg",
      "assets/images/zorro.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/zorro.mp3"
  },
  {
    "id": 45,
    "question": "",
    "options": [
      "assets/images/leon.jpg",
      "assets/images/puma.jpg",
      "assets/images/puzzle.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/puma.mp3"
  },
  {
    "id": 46,
    "question": "",
    "options": [
      "assets/images/cueva.jpg",
      "assets/images/volante.jpg",
      "assets/images/rueda.jpg"
    ],
    "answer_index": 2,
    "audio": "assets/audio/rueda.mp3"
  },
  {
    "id": 47,
    "question": "",
    "options": [
      "assets/images/carreta.jpg",
      "assets/images/trompeta.jpg",
      "assets/images/pala.jpg"
    ],
    "answer_index": 0,
    "audio": "assets/audio/carreta.mp3"
  },
  // {
  //   "id": 48,
  //   "question": "",
  //   "options": [
  //     "assets/images/esparrago.jpg",
  //     "assets/images/alcachofa.jpg",
  //     "assets/images/alcancia.jpg"
  //   ],
  //   "answer_index": 1,
  //   "audio": "assets/audio/alcachofa.mp3"
  // },
  {
    "id": 49,
    "question": "",
    "options": [
      "assets/images/mortero.jpg",
      "assets/images/mochila.jpg",
      "assets/images/uslero.jpg"
    ],
    "answer_index": 1,
    "audio": "assets/audio/mochila.mp3"
  },
  // {
  //   "id": 50,
  //   "question": "",
  //   "options": [
  //     "assets/images/exprimidor.jpg",
  //     "assets/images/tenedor.jpg",
  //     "assets/images/mortero.jpg"
  //   ],
  //   "answer_index": 0,
  //   "audio": "assets/audio/exprimidor.mp3"
  // }
];
