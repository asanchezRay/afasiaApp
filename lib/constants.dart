import 'dart:math';

import 'package:afasia/Screens/Activities/Comprension/ComprensionDeInhibicion/comprension_inhibicion.dart';
import 'package:afasia/Screens/Activities/Escritura/CopiaDeLetras/copia_de_letras_screen.dart';
import 'package:afasia/Screens/Activities/Escritura/CopiaDeOraciones/copia_de_letras_oraciones.dart';
import 'package:afasia/Screens/Activities/Escritura/CopiaDePalabras/copia_de_letras_palabras.dart';
import 'package:afasia/Screens/Activities/Escritura/EscrituraAlDictado/escritura_al_dictado.dart';
import 'package:afasia/Screens/Activities/Escritura/EscrituraAutomatica/escritura_automatica.dart';
import 'package:afasia/Screens/Activities/Escritura/EscrituraDescriptiva/escritura_descriptiva_screen.dart';
import 'package:afasia/Screens/Activities/Lectura/CompletacionDeOraciones/completacion_oraciones.dart';
import 'package:afasia/Screens/Activities/Lectura/FormulacionDeOraciones/formulacion_oraciones_screen.dart';
import 'package:afasia/Screens/Activities/Lectura/LecturaOracionesSimples/lectura_comprensiva.dart';
import 'package:afasia/Screens/Activities/Lectura/NominacionAcciones/nominacion_acciones.dart';
import 'package:afasia/Screens/Activities/Lectura/NominacionObjetos/nominacion_objetos.dart';
import 'package:afasia/Screens/Activities/ReconocimientoAuditivo/ElementosAisladosAcciones/acciones_screen.dart';
import 'package:afasia/Screens/Activities/ReconocimientoAuditivo/ElementosAisladosDistractoresSemanticos/distractores_semanticos.dart';
import 'package:afasia/Screens/Activities/ReconocimientoAuditivo/ElementosAisladosObjetos/objetos_screen.dart';
import 'package:afasia/Screens/Welcome/welcome_screen.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

import 'Screens/Activities/Lectura/LecturaComprensiva/lectura_comprensiva.dart';
import 'Screens/Activities/Lectura/LecturaPalabras/lectura_palabras.dart';
import 'database/models/fonoaudiologo.class.dart';

const kPrimaryColor = Color(0xFF6F35A5);
const kPrimaryLightColor = Color(0xFFF1E6FF);

const double kDefaultPadding = 20.0;

const version = "0.97";

String urlDomain = "https://as.proyectotitulacion.cl";

Fonoaudiologo fonoActivo;

const kGrayColor = Color(0xFFEEEEEE);
const kRedColor = Color(0xFFE92E30);
const kGreenColor = Color(0xFF6AC259);

const kPrimaryGradient = LinearGradient(
  colors: [Color(0xFF6F35A5), Color.fromRGBO(138, 35, 135, 1.0)],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

String generateRandomString(int len) {
  var r = Random();
  const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  return List.generate(len, (index) => _chars[r.nextInt(_chars.length)]).join();
}

const activitiesName = [
  "Reconocimiento auditivo de objetos aislados",
  "Reconocimiento auditivo de acciones aisladas",
  "Reconocimiento auditivo de distractores semánticos",
  "Comprensión de inhibición",
  "Formulación de oraciones",
  "Completación de oraciones",
  "Lectura de oraciones simples",
  "Lectura comprensiva",
  "Lectura de palabras",
  "Copia de letras",
  "Copia de palabras",
  "Copia de oraciones",
  "Escritura automática",
  "Escritura al dictado",
  "Escritura descriptiva",
  "Nominacion de acciones",
  "Nominacion de objetos",
];

Widget getNext(int index, List<int> actividadesAsignadas) {
  switch (index) {
    case 0:
      return ElementosAisladosObjetosScreen(
        actividadesAsignadas: actividadesAsignadas,
      );
    case 1:
      return ElementosAisladosAccionesScreen(
        actividadesAsignadas: actividadesAsignadas,
      );
    case 2:
      return ElementosAisladosDistractoresSemanticosScreen(
        actividadesAsignadas: actividadesAsignadas,
      );
    case 3:
      return ComprensionInhibicionScreen(
        actividadesAsignadas: actividadesAsignadas,
      );
    case 4:
      return FormulacionOraciones(
        actividadesAsignadas: actividadesAsignadas,
      );
    case 5:
      return CompletacionDeOracionesScreen(
        actividadesAsignadas: actividadesAsignadas,
      );
    case 6:
      return LecturaOracionesSimplesScreen(
        actividadesAsignadas: actividadesAsignadas,
      );
    case 7:
      return LecturaComprensivaScreen(
        actividadesAsignadas: actividadesAsignadas,
      );
    case 8:
      return LecturaPalabrasScreen(
        actividadesAsignadas: actividadesAsignadas,
      );
    case 9:
      return CopiaLetrasScreen(
        actividadesAsignadas: actividadesAsignadas,
      );
    case 10:
      return CopiaPalabrasScreen(
        actividadesAsignadas: actividadesAsignadas,
      );
    case 11:
      return CopiaOracionesScreen(
        actividadesAsignadas: actividadesAsignadas,
      );
    case 12:
      return EscrituraAutomaticaScreen(
        actividadesAsignadas: actividadesAsignadas,
      );
    case 13:
      return EscrituraAlDictadoScreen(
        actividadesAsignadas: actividadesAsignadas,
      );
    case 14:
      return EscrituraDescriptivaScreen(
        actividadesAsignadas: actividadesAsignadas,
      );
    case 15:
      return NominacionAccionesScreen(
        actividadesAsignadas: actividadesAsignadas,
      );
    case 16:
      return NominacionObjetosScreen(
        actividadesAsignadas: actividadesAsignadas,
      );
  }
}

//variables globales

var rutPacienteTrabajando;

var lastAudioPlay = "";

void replayLastAudio() {
  final assetsAudioPlayer = AssetsAudioPlayer();
  assetsAudioPlayer.open(
    Audio(lastAudioPlay),
  );
  // assetsAudioPlayer.play();
}

var correccionLectura = {};
var correccionCopia = {};
var correccionAlDictado = {};
var correccionNominacionAcciones = {};
var correccionNominacionObjetos = {};

var sexo = "masculino";

var cantidadActividadesAsignadas;
int cantidadActividadesRealizadas = 0;
