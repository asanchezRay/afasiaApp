import 'package:afasia/Screens/Activities/Lectura/FormulacionDeOraciones/complements/body.dart';
import 'package:afasia/Screens/Activities/Lectura/FormulacionDeOraciones/complements/progress_bar.dart';
import 'package:afasia/Screens/Activities/Lectura/FormulacionDeOraciones/controllers/question_controller.dart';
import 'package:afasia/Screens/Activities/Lectura/FormulacionDeOraciones/models/questions.dart';
import 'package:afasia/constants.dart';
// import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class FormulacionOraciones extends StatefulWidget {
  final List<int> actividadesAsignadas;

  const FormulacionOraciones({Key key, @required this.actividadesAsignadas})
      : super(key: key);
  @override
  _FormulacionOraciones createState() =>
      _FormulacionOraciones(actividadesAsignadas);
}

class _FormulacionOraciones extends State<FormulacionOraciones> {
  final id = 4;

  String localFilePath;
  List<Question> _questions;

  List<Question> get questions => this._questions;

  List<bool> acepted = <bool>[];
  List<int> actividadesAsignadas;
  _FormulacionOraciones(this.actividadesAsignadas);

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
    QuestionControllerFO _questionController = Get.put(QuestionControllerFO(
      context: context,
      id: id,
      actividadesAsignadas: actividadesAsignadas,
    ));
    print(_questionController.questionNumber);
    // audioCache.play('audio/audio.mp3');
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          // ScaffoldMessenger.of(context).showSnackBar(
          //     SnackBar(content: Text('The System Back Button is Deactivated')));
          return false;
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: kPrimaryLightColor,
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: kDefaultPadding),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: Container(),
                  ),
                  SizedBox(height: kDefaultPadding / 2),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: Obx(
                      () => Text.rich(
                        TextSpan(
                          text:
                              "Arrastre las palabras a los cuadros de abajo para ordenar la oración.\nPregunta ${_questionController.questionNumber.value}/${_questionController.questions.length}",
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              .copyWith(color: kPrimaryColor),
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 1.5,
                  ),
                  Expanded(
                    child: PageView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      controller: _questionController.pageController,
                      onPageChanged: _questionController.updateTheQnNum,
                      itemCount: _questionController.questions.length,
                      itemBuilder: (context, index) => Body(
                        oracionCorrecta:
                            _questionController.questions[index].question,
                        index: index,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
