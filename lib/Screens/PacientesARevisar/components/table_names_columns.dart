import 'package:afasia/constants.dart';
import 'package:flutter/material.dart';

class TableNamesColumns extends StatelessWidget {
  const TableNamesColumns({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.05,
      color: kPrimaryLightColor,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: size.width * 0.35,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Text(
              "Nombre",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          // Container(
          //   height: size.height * 0.05,
          //   width: 1,
          //   color: kPrimaryColor,
          // ),
          Container(
            width: size.width * 0.35,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Text(
              "Apellido",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Container(
          //   height: size.height * 0.05,
          //   width: 1,
          //   color: kPrimaryColor,
          // ),
          Container(
            // width: size.width * 0.5,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Text(
              "Ir a Revisar",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
