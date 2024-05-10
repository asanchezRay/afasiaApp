import 'package:afasia/Screens/Activities/Escritura/CopiaDeOraciones/controllers/question_controller.dart';
import 'package:flutter/material.dart';
import 'package:afasia/constants.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
// import 'package:afasia/controllers/question_controller.dart';
import 'package:get/get.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      width: double.infinity,
      height: 35,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xFF3F4768),
          width: 3,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: GetBuilder<QuestionControllerCO>(
        init: QuestionControllerCO(),
        builder: (controller) {
          return Stack(
            children: [
              LayoutBuilder(
                builder: (context, constraints) => Container(
                  width: constraints.maxWidth * controller.animation.value,
                  decoration: BoxDecoration(
                    gradient: kPrimaryGradient,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding / 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${(controller.animation.value * 60).round()} seg",
                        style: TextStyle(color: Colors.white),
                      ),
                      // WebsafeSvg()  9:00
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
