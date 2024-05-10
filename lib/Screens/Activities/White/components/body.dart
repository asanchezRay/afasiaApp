import 'package:afasia/constants.dart';
import 'package:afasia/components/rounded_button_bottom_icon.dart';
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$cantidadActividadesRealizadas/$cantidadActividadesAsignadas",
                    style: TextStyle(fontSize: 80, color: kPrimaryColor),
                  ),
                  Container(
                    height: size.height * 0.2,
                    alignment: Alignment.center,
                    child: RoundedButtonBottomIcon(
                      text: "Siguiente actividad",
                      icon: Icon(
                        Icons.arrow_right,
                        color: kPrimaryLightColor,
                        size: 55,
                      ),
                      press: () {
                        print(index);
                        cantidadActividadesRealizadas =
                            cantidadActividadesRealizadas + 1;

                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) =>
                                  getNext(index, actividadesAsignadas),
                            ),
                            (route) => false);
                      },
                      width: size.width * 0.6,
                    ),
                  ),
                  SizedBox(
                    height: 80,
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
