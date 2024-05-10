import 'package:afasia/Screens/Activities/Lectura/LecturaComprensiva/controllers/question_controller.dart';
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
    return GetBuilder<QuestionControllerLC>(
      init: QuestionControllerLC(),
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
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: kDefaultPadding, right: kDefaultPadding),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: getTheRightColor() == kGrayColor
                            ? Colors.transparent
                            : getTheRightColor(),
                        borderRadius: BorderRadius.circular(50),
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
                        ? Text(" ")
                        : getTheRightColor() == kRedColor
                            ? Text(
                                "Incorrecto",
                                style:
                                    TextStyle(color: kRedColor, fontSize: 18),
                              )
                            : Text(
                                "Correcto",
                                style:
                                    TextStyle(color: kGreenColor, fontSize: 18),
                              ),
                  ],
                ),
                Text(
                  text,
                  style: TextStyle(color: kPrimaryColor, fontSize: 35),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
