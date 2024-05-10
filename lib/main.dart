// import 'package:afasia/Screens/Profile/profile_screen.dart';
import 'dart:io';

import 'package:afasia/Screens/Activities/Lectura/NominacionAcciones/nominacion_acciones.dart';
import 'package:afasia/Screens/Activities/Lectura/NominacionObjetos/nominacion_objetos.dart';
import 'package:afasia/Screens/Welcome/welcome_screen.dart';
import 'package:afasia/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(
    Phoenix(
      child: MyApp(),
    ),
  );
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Afasia',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('es', 'ES'),
      ],
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: kPrimaryColor),
        primaryColor: Color(0xFF6F35A5),
        scaffoldBackgroundColor: Colors.white,
      ),
      // home: NominacionAccionesScreen(
      //   actividadesAsignadas: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1],
      // ),
      home: WelcomeScreen(),
    );
  }
}
