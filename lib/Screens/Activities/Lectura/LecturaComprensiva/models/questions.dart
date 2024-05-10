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
    "question": "La señora María hizo un flan. ¿Qué hizo María?",
    "options": [
      'Un flan',
      'Una torta',
      'Un Sandwich',
    ],
    "answer_index": 0,
  },
  {
    "id": 2,
    "question": "Julián fue al supermercado. ¿Dónde fue Julián?",
    "options": [
      'A la feria',
      'Al mall',
      'Al supermercado',
    ],
    "answer_index": 2,
  },
  {
    "id": 3,
    "question": "Sandra fue a Chillán. ¿Dónde fue Sandra?",
    "options": [
      'Chillán',
      'Los Angeles',
      'Temuco',
    ],
    "answer_index": 0,
  },
  {
    "id": 4,
    "question": "Vino el kinesiólogo. ¿Quién vino?",
    "options": [
      'El kinesiólogo',
      'El médico',
      'El nutricionista',
    ],
    "answer_index": 0,
  },
  {
    "id": 5,
    "question": "La enfermera es alta. ¿Quién es alta?",
    "options": [
      'La nutricionista',
      'La enfermera',
      'La fonoaudiologa',
    ],
    "answer_index": 1,
  },
  {
    "id": 6,
    "question": "Él se lava los dientes ¿Qué se lava?",
    "options": [
      'Los dientes',
      'Los pies',
      'El pelo',
    ],
    "answer_index": 0,
  },
  {
    "id": 7,
    "question": "Le duele la espalda ¿Qué le duele?",
    "options": [
      'La espalda',
      'Los pies',
      'La cabeza',
    ],
    "answer_index": 0,
  },
  {
    "id": 8,
    "question": "Juan quiere ir al baño. ¿Dónde quiere ir?",
    "options": [
      'A la cocina',
      'Al comedor',
      'Al baño',
    ],
    "answer_index": 2,
  },
  {
    "id": 9,
    "question": "A Pablo le pica la espalda ¿Qué le pica?",
    "options": [
      'El pie',
      'La espalda',
      'La mano',
    ],
    "answer_index": 1,
  },
  {
    "id": 10,
    "question": "A Renata le duele la cabeza ¿A quién le duele la cabeza",
    "options": [
      'A Renata',
      'A Jose',
      'A Gabriela',
    ],
    "answer_index": 0,
  },
  {
    "id": 11,
    "question":
        "A Inés le gustaría comer una manzana ¿A quién le gustaría comer?",
    "options": [
      'A Inés',
      'A Marcela',
      'A Ximena',
    ],
    "answer_index": 0,
  },
  {
    "id": 12,
    "question":
        "A Tomás le gustaría tomar agua. ¿Qué le gustaría tomar a Tomás?",
    "options": [
      'Sopa',
      'Agua',
      'Helado',
    ],
    "answer_index": 1,
  },
  {
    "id": 13,
    "question": "Me tengo que tomar los remedios. ¿Qué me tengo que tomar?",
    "options": [
      'Los remedios',
      'Los jugos',
      'Las sopas',
    ],
    "answer_index": 0,
  },
  {
    "id": 14,
    "question": "Julieta se quiere ir. ¿Qué quiere Julieta?",
    "options": [
      'Dormir',
      'Ir',
      'Comer',
    ],
    "answer_index": 1,
  },
  {
    "id": 15,
    "question": "La comida no tiene sal. ¿Qué no tiene la comida?",
    "options": [
      'Limón',
      'Agua',
      'Sal',
    ],
    "answer_index": 2,
  },
  // {
  //   "id": 16,
  //   "question": "",
  //   "options": [
  //     'Chillan',
  //     'Los Angeles',
  //     '',
  //   ],
  //   "answer_index": 0,
  // },
  // {
  //   "id": 17,
  //   "question": "",
  //   "options": [
  //     'Chillan',
  //     'Los Angeles',
  //     '',
  //   ],
  //   "answer_index": 2,
  // },
  // {
  //   "id": 18,
  //   "question": "",
  //   "options": [
  //     'Chillan',
  //     'Los Angeles',
  //     '',
  //   ],
  //   "answer_index": 1,
  // },
  // {
  //   "id": 19,
  //   "question": "",
  //   "options": [
  //     'Chillan',
  //     'Los Angeles',
  //     '',
  //   ],
  //   "answer_index": 0,
  // },
  // {
  //   "id": 20,
  //   "question": "",
  //   "options": [
  //     'Chillan',
  //     'Los Angeles',
  //     '',
  //   ],
  //   "answer_index": 2,
  // },
  // {
  //   "id": 21,
  //   "question": "",
  //   "options": [
  //     'Chillan',
  //     'Los Angeles',
  //     '',
  //   ],
  //   "answer_index": 0,
  // },
  // {
  //   "id": 22,
  //   "question": "",
  //   "options": [
  //     'Chillan',
  //     'Los Angeles',
  //     '',
  //   ],
  //   "answer_index": 1,
  // },
  // {
  //   "id": 23,
  //   "question": "",
  //   "options": [
  //     'Chillan',
  //     'Los Angeles',
  //     '',
  //   ],
  //   "answer_index": 0,
  // },
  // {
  //   "id": 24,
  //   "question": "",
  //   "options": [
  //     'Chillan',
  //     'Los Angeles',
  //     '',
  //   ],
  //   "answer_index": 2,
  // },
  // {
  //   "id": 25,
  //   "question": "",
  //   "options": [
  //     'Chillan',
  //     'Los Angeles',
  //     '',
  //   ],
  //   "answer_index": 1,
  // },
  // {
  //   "id": 26,
  //   "question": "",
  //   "options": [
  //     'Chillan',
  //     'Los Angeles',
  //     '',
  //   ],
  //   "answer_index": 0,
  // },
  // {
  //   "id": 27,
  //   "question": "",
  //   "options": [
  //     'Chillan',
  //     'Los Angeles',
  //     '',
  //   ],
  //   "answer_index": 1,
  // },
  // {
  //   "id": 28,
  //   "question": "",
  //   "options": [
  //     'Chillan',
  //     'Los Angeles',
  //     '',
  //   ],
  //   "answer_index": 2,
  // },
  // {
  //   "id": 29,
  //   "question": "",
  //   "options": [
  //     'Chillan',
  //     'Los Angeles',
  //     '',
  //   ],
  //   "answer_index": 2,
  // },
];

const List data2 = data1;
const List data3 = data1;
