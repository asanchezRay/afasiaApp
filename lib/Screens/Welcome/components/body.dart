import 'dart:ui';

import 'package:afasia/Screens/Login/login_screen.dart';
import 'package:afasia/Screens/Profile/profile_screen.dart';
import 'package:afasia/Screens/Signup/signup_screen.dart';
import 'package:afasia/Screens/Welcome/components/background.dart';
import 'package:afasia/components/rounded_button.dart';
import 'package:afasia/constants.dart';
import 'package:afasia/database/database.dart';
import 'package:afasia/database/models/actividad.class.dart';
import 'package:afasia/database/models/fonoaudiologo.class.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record/record.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  AfasiaDatabase db = AfasiaDatabase();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; // Total height and width

    return FutureBuilder(
      future: db.initDB(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return _showBody(context);
          // return Container();
        } else {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: kPrimaryColor,
            ),
          );
        }
      },
    );
  }

  Widget _showBody(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Map<String, dynamic> data = {};
    var x = db.getLenghtActivities();
    print(x.toString());
    return FutureBuilder(
      future: db.getDataWelcome(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data[0]["contador_actividad"] < activitiesName.length) {
            db.insertAllActivities();
          }
          if (snapshot.data[0]["contador_fonoaudiologo"] >= 1) {
            print(snapshot.data[0]);
            return ProfileScreen();
          } else {
            return Background(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Bienvenido a Afasiapp",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                          color: kPrimaryColor),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Image.asset(
                      "assets/images/brain.jpg",
                      width: size.width * 0.7,
                    ),
                    SizedBox(height: size.height * 0.04),
                    RoundedButton(
                      text: "INGRESAR",
                      width: size.width * 0.8,
                      color: kPrimaryColor,
                      press: () async {
                        await Record.hasPermission();
                        await Permission.storage.request();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return LoginScreen();
                            },
                          ),
                        );
                      },
                    ),
                    RoundedButton(
                      width: size.width * 0.8,
                      text: "REGISTRARSE",
                      color: kPrimaryLightColor,
                      textColor: Colors.black,
                      press: () async {
                        sexo = "masculino";
                        await Record.hasPermission();
                        await Permission.storage.request();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SignUPScreen();
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          }
        } else {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: kPrimaryColor,
            ),
          );
        }
      },
    );
  }
}
