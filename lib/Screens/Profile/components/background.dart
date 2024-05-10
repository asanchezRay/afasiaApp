import 'dart:io';

import 'package:afasia/constants.dart';
import 'package:afasia/database/database.dart';
import 'package:afasia/database/models/fonoaudiologo.class.dart';
import 'package:flutter/material.dart';

class Background extends StatefulWidget {
  final Widget child;
  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  _BackgroundState createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  AfasiaDatabase db = AfasiaDatabase();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return FutureBuilder(
      future: db.initDB(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return _showFuture(context);
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

  Widget _showFuture(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return FutureBuilder(
      future: db.getFonoaudiologo(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          fonoActivo = snapshot.data[0];
          print("rut");
          print(fonoActivo.imagen);
          return Container(
            width: double.infinity,
            height: size.height,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  top: 0,
                  child: Image.asset(
                    "assets/images/profile_top.png",
                  ),
                ),
                Positioned(
                  top: 50,
                  child: fonoActivo.imagen == ""
                      ? Icon(
                          Icons.account_circle,
                          color: kPrimaryColor,
                          size: size.width * 0.3,
                        )
                      : ClipRRect(
                          borderRadius:
                              BorderRadius.circular(size.width * 0.15),
                          child: Image.file(
                            new File(fonoActivo.imagen),
                            width: size.width * 0.3,
                            height: size.width * 0.3,
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
                Positioned(
                  top: 280,
                  child: Text(
                    snapshot.data[0].nombre,
                    // "hola",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: size.width * 0.05,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Image.asset(
                    "assets/images/login_bottom.png",
                    width: size.width * 0.3,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Text(
                    " versión " + version,
                    style: TextStyle(
                      color: kPrimaryColor.withOpacity(0.6),
                      fontSize: 20,
                    ),
                  ),
                ),
                widget.child,
              ],
            ),
          );
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
}
