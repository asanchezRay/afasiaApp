import 'dart:typed_data';
import 'dart:ui';

import 'package:afasia/Screens/Activities/Escritura/EscrituraAutomatica/components/progress_bar.dart';
import 'package:afasia/Screens/Activities/Escritura/EscrituraAutomatica/components/question_card.dart';
import 'package:afasia/Screens/Activities/Escritura/EscrituraAutomatica/controllers/question_controller.dart';
import 'package:afasia/components/rounded_button.dart';
import 'package:afasia/constants.dart';
import 'package:afasia/database/database.dart';
import 'package:afasia/database/models/copia.class.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';

class EscrituraAutomaticaScreen extends StatefulWidget {
  final List<int> actividadesAsignadas;

  const EscrituraAutomaticaScreen(
      {Key key, @required this.actividadesAsignadas})
      : super(key: key);
  @override
  _EscrituraAutomaticaScreenState createState() =>
      _EscrituraAutomaticaScreenState(actividadesAsignadas);
}

class _EscrituraAutomaticaScreenState extends State<EscrituraAutomaticaScreen> {
  List<DrawingArea> points = [];
  Color selectedColor;
  double strokeWidth;
  int id = 12;
  //Create an instance of ScreenshotController
  ScreenshotController screenshotController = ScreenshotController();
  Uint8List _imageFile;

  List<int> actividadesAsignadas;
  _EscrituraAutomaticaScreenState(this.actividadesAsignadas);

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    selectedColor = Colors.black;
    strokeWidth = 2.0;
  }

  @override
  dispose() {
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    // ]);
    super.dispose();
  }

  void selectColor() {
    showDialog(
      context: context,
      builder: (_) => new AlertDialog(
        title: const Text('Cambiar Color'),
        content: SingleChildScrollView(
          child: BlockPicker(
            pickerColor: selectedColor,
            onColorChanged: (color) {
              setState(() {
                selectedColor = color;
              });
            },
          ),
        ),
        actions: <Widget>[
          FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cerrar"))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    QuestionControllerEA _questionController = Get.put(QuestionControllerEA(
      context: context,
      id: id,
      actividadesAsignadas: actividadesAsignadas,
      guardarPantallazo: this.guardarPantallazo,
    ));

    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          // ScaffoldMessenger.of(context).showSnackBar(
          //     SnackBar(content: Text('The System Back Button is Deactivated')));
          return false;
        },
        child: Screenshot(
          controller: screenshotController,
          child: _showBody(_questionController),
        ),
      ),
    );
  }

  Widget _showBody(QuestionControllerEA _questionController) {
    final double width = MediaQuery.of(context).size.width;
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: kPrimaryLightColor,
          ),
        ),
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: kDefaultPadding),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Obx(
                  () => Text.rich(
                    TextSpan(
                      text:
                          "${_questionController.questions[_questionController.questionNumber.value - 1].question} ",
                      style: Theme.of(context).textTheme.headline3.copyWith(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                      children: [
                        TextSpan(
                          text:
                              "\nPregunta ${_questionController.questionNumber.value}/${_questionController.questions.length}",
                          style: Theme.of(context)
                              .textTheme
                              .headline5
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
              // SizedBox(height: kDefaultPadding),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 24, bottom: 10),
                    child: RoundedButton(
                      width: 400,
                      text: "Siguiente pregunta",
                      color: kPrimaryColor,
                      textSize: 30,
                      press: () {
                        _questionController.nextQuestion();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  guardarPantallazo() {
    screenshotController.capture().then((image) async {
      var name = generateRandomString(35);
      //Capture Done

      if (!(await Permission.storage.status.isGranted))
        await Permission.storage.request();
      final result = await ImageGallerySaver.saveImage(
        image,
        name: name,
      );

      Copia actividad = Copia(
        rutPacienteTrabajando,
        4,
        name,
        0,
      );
      AfasiaDatabase db = AfasiaDatabase();
      await db.initDB();

      await db.insertarActividadCopia(actividad);
      await db.getAllCopias();
      setState(() {
        _imageFile = image;
      });
    }).catchError((onError) {
      print(onError);
    });
  }
}

class DrawingArea {
  Offset point;
  Paint areaPaint;

  DrawingArea({this.point, this.areaPaint});
}

class MyCustomPainter extends CustomPainter {
  List<DrawingArea> points;
  Color color;
  double strokeWidth;

  MyCustomPainter({this.points, this.color, this.strokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    Paint background = Paint()..color = Colors.white;
    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(rect, background);

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        Paint paint = points[i].areaPaint;
        canvas.drawLine(points[i].point, points[i + 1].point, paint);
      } else if (points[i] != null && points[i + 1] == null) {
        Paint paint = points[i].areaPaint;
        canvas.drawPoints(PointMode.points, [points[i].point], paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
