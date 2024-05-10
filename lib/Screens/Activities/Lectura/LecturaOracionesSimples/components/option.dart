import 'package:afasia/Screens/Activities/Lectura/LecturaOracionesSimples/controllers/question_controller.dart';
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
    return GetBuilder<QuestionControllerLOS>(
      init: QuestionControllerLOS(),
      builder: (qnController) {
        Color getTheRightColor() {
          // if (qnController.isAnswered) {
          //   if (index == qnController.correctAns) {
          //     return kGreenColor;
          //   } else if (index == qnController.selectAns &&
          //       qnController.selectAns != qnController.correctAns) {
          //     return kRedColor;
          //   }
          // }
          if (qnController.intentos >= 1 && index == qnController.selectAns) {
            if (index != qnController.correctAns) {
              return kRedColor;
            }
          }
          if (qnController.correctAns == index &&
              qnController.selectAns == qnController.correctAns) {
            return kGreenColor;
          }

          if (qnController.intentos == 2) {
            if (index == qnController.correctAns) {
              return kGreenColor;
            } else {
              return kRedColor;
            }
          }

          return kGrayColor;
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
              border: Border.all(color: getTheRightColor()),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: kDefaultPadding, right: kDefaultPadding),
                  height: 30,
                  width: 30,
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
