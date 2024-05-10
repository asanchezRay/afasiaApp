import 'package:afasia/Screens/Activities/ReconocimientoAuditivo/ElementosAisladosAcciones/controllers/question_controller.dart';
import 'package:afasia/constants.dart';
// import 'package:afasia/controllers/question_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Option extends StatelessWidget {
  const Option({
    Key key,
    this.text,
    this.index,
    this.press,
  }) : super(key: key);

  final String text;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionControllerEAA>(
      init: QuestionControllerEAA(),
      builder: (qnController) {
        Color getTheRightColor() {
          if (qnController.alternativas[index] == 0) {
            if (qnController.intentos == 2) {
              return kGreenColor;
            }
            return kGrayColor;
          }
          if (qnController.alternativas[index] == 1) {
            return kGreenColor;
          }
          if (qnController.alternativas[index] == -1) {
            return kRedColor;
          }
          return kGreenColor;
        }

        IconData getTheRightIcon() {
          return getTheRightColor() == kRedColor ? Icons.close : Icons.done;
        }

        return InkWell(
          onTap: press,
          child: Container(
            margin: EdgeInsets.only(top: kDefaultPadding),
            padding: EdgeInsets.all(kDefaultPadding),
            decoration: BoxDecoration(
              border: Border.all(color: getTheRightColor(), width: 5),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  text,
                  width: 250,
                  height: 250,
                  fit: BoxFit.fitWidth,
                ),
                Container(
                  margin: EdgeInsets.only(top: kDefaultPadding),
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: getTheRightColor() == kGrayColor
                        ? Colors.transparent
                        : getTheRightColor(),
                    borderRadius: BorderRadius.circular(80),
                    border: Border.all(color: getTheRightColor()),
                  ),
                  child: getTheRightColor() == kGrayColor
                      ? null
                      : Icon(
                          getTheRightIcon(),
                          color: Colors.white,
                          size: 40,
                        ),
                ),
                getTheRightColor() == kGrayColor
                    ? SizedBox(
                        height: 27,
                      )
                    : getTheRightColor() == kRedColor
                        ? Text(
                            "Incorrecto",
                            style: TextStyle(color: kRedColor, fontSize: 25),
                          )
                        : Text(
                            "Correcto",
                            style: TextStyle(color: kGreenColor, fontSize: 25),
                          ),
              ],
            ),
          ),
        );
      },
    );
  }
}
