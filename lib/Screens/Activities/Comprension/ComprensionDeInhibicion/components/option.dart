import 'package:afasia/Screens/Activities/Comprension/ComprensionDeInhibicion/controllers/question_controller.dart';
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
    return GetBuilder<QuestionControllerCDI>(
      init: QuestionControllerCDI(),
      builder: (qnController) {
        Color getTheRightColor() {
          if (qnController.alternativas[index] == 0) {
            if (qnController.intentos == 2) {
              if (index != qnController.correctAns) {
                return kGrayColor;
              } else {
                return kGreenColor;
              }
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
        // Color getTheRightColor() {
        //   // if (qnController.isAnswered) {
        //   //   if (index == qnController.correctAns) {
        //   //     return kGreenColor;
        //   //   } else if (index == qnController.selectAns &&
        //   //       qnController.selectAns != qnController.correctAns) {
        //   //     return kRedColor;
        //   //   }
        //   // }
        //   if (qnController.intentos >= 1 && index == qnController.selectAns) {
        //     if (index != qnController.correctAns) {
        //       return kRedColor;
        //     }
        //   }
        //   if (qnController.correctAns == index &&
        //       qnController.selectAns == qnController.correctAns) {
        //     return kGreenColor;
        //   }

        //   if (qnController.intentos == 2) {
        //     if (index == qnController.correctAns) {
        //       return kGreenColor;
        //     } else {
        //       return kRedColor;
        //     }
        //   }

        //   return kGrayColor;
        // }

        IconData getTheRightIcon() {
          return getTheRightColor() == kRedColor ? Icons.close : Icons.done;
        }

        return InkWell(
          onTap: press,
          child: Container(
            margin:
                EdgeInsets.only(top: kDefaultPadding * 2, left: 5, right: 5),
            padding: EdgeInsets.all(kDefaultPadding / 2),
            decoration: BoxDecoration(
              border: Border.all(color: getTheRightColor(), width: 5),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  text,
                  width: 190,
                  height: 190,
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
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: getTheRightColor()),
                  ),
                  child: getTheRightColor() == kGrayColor
                      ? null
                      : Icon(
                          getTheRightIcon(),
                          color: Colors.white,
                          size: 30,
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
