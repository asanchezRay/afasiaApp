import 'package:afasia/Screens/Activities/Comprension/ComprensionDeInhibicion/components/progress_bar.dart';
import 'package:afasia/Screens/Activities/Comprension/ComprensionDeInhibicion/controllers/question_controller.dart';
import 'package:afasia/constants.dart';
// import 'package:afasia/controllers/question_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'question_card.dart';

class Body extends StatefulWidget {
  final List<int> actividadesAsignadas;
  const Body({
    Key key,
    @required this.actividadesAsignadas,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState(actividadesAsignadas);
}

class _BodyState extends State<Body> {
  final List<int> actividadesAsignadas;
  _BodyState(this.actividadesAsignadas);

  final id = 3;
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
    QuestionControllerCDI _questionController = Get.put(QuestionControllerCDI(
      context: context,
      id: id,
      actividadesAsignadas: actividadesAsignadas,
    ));

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: kPrimaryLightColor,
          ),
        ),
        // WebsafeSvg.asset("assets/icons/bg.svg", fit: BoxFit.fill),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Container(),
              ),
              SizedBox(height: kDefaultPadding),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Obx(
                  () => Text.rich(
                    TextSpan(
                      text:
                          "Pregunta ${_questionController.questionNumber.value}",
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(color: kPrimaryColor),
                      children: [
                        TextSpan(
                          text:
                              "/${_questionController.questions.length}      Toque la foto que no corresponde al grupo",
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              .copyWith(color: kPrimaryColor),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Divider(
                thickness: 1.5,
              ),
              SizedBox(height: kDefaultPadding),
              Expanded(
                child: PageView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _questionController.pageController,
                  onPageChanged: _questionController.updateTheQnNum,
                  itemCount: _questionController.questions.length,
                  itemBuilder: (context, index) => QuestionCard(
                    question: _questionController.questions[index],
                  ),
                ),
              ),
              SizedBox(height: kDefaultPadding),
            ],
          ),
        ),
      ],
    );
  }
}
