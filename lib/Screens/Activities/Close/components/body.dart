import 'dart:io';

import 'package:afasia/Screens/Welcome/welcome_screen.dart';
import 'package:afasia/constants.dart';
import 'package:afasia/components/rounded_button_bottom_icon.dart';
import 'package:afasia/database/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class Body extends StatefulWidget {
  final List<int> actividadesAsignadas;
  final int index;
  const Body({
    Key key,
    @required this.actividadesAsignadas,
    this.index,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState(actividadesAsignadas, index);
}

class _BodyState extends State<Body> {
  final List<int> actividadesAsignadas;
  int index;
  _BodyState(this.actividadesAsignadas, this.index);

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  dispose() {
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    // ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Stack(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // AnimationCustom(),
          SpinKitRipple(
            color: kPrimaryColor,
            size: 800,
            borderWidth: 8,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      "Ha terminado todas sus actividades \n devuelva la tablet al profesional",
                      style: TextStyle(color: kPrimaryColor, fontSize: 34),
                    ),
                  ),
                  Container(
                    height: size.height * 0.2,
                    alignment: Alignment.center,
                    child: RoundedButtonBottomIcon(
                      text: "Cerrar Aplicación",
                      icon: Icon(
                        Icons.close,
                        color: kPrimaryLightColor,
                        size: 55,
                      ),
                      press: () async {
                        AfasiaDatabase db = AfasiaDatabase();
                        await db.initDB();
                        db.deleteFonoaudiologo();
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return WelcomeScreen();
                            },
                          ),
                          ModalRoute.withName(''),
                        );
                        exit(0);
                      },
                      width: size.width * 0.6,
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
