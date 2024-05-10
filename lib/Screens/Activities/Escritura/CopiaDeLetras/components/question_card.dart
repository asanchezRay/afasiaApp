import 'dart:ui';

import 'package:afasia/Screens/Activities/Escritura/CopiaDeLetras/controllers/question_controller.dart';
import 'package:afasia/Screens/Activities/Escritura/CopiaDeLetras/models/questions.dart';
import 'package:afasia/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';

class QuestionCard extends StatefulWidget {
  QuestionCard({
    Key key,
    @required this.question,
  }) : super(key: key);

  final Question question;

  @override
  _QuestionCardState createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  List<DrawingArea> points = [];

  Color selectedColor;

  double strokeWidth;

  @override
  void initState() {
    super.initState();
    selectedColor = Colors.black;
    strokeWidth = 2.0;
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
    QuestionControllerCL _controller = Get.put(QuestionControllerCL());
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: width * 0.895,
          height: height * 0.7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                blurRadius: 5.0,
                spreadRadius: 1.0,
              )
            ],
          ),
          child: GestureDetector(
            onPanDown: (details) {
              setState(() {
                points.add(DrawingArea(
                  point: details.localPosition,
                  areaPaint: Paint()
                    ..strokeCap = StrokeCap.round
                    ..isAntiAlias = true
                    ..color = selectedColor
                    ..strokeWidth = strokeWidth,
                ));
              });
            },
            onPanUpdate: (details) {
              setState(() {
                points.add(DrawingArea(
                  point: details.localPosition,
                  areaPaint: Paint()
                    ..strokeCap = StrokeCap.round
                    ..isAntiAlias = true
                    ..color = selectedColor
                    ..strokeWidth = strokeWidth,
                ));
              });
            },
            onPanEnd: (details) {
              setState(() {
                points.add(null);
              });
            },
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              child: CustomPaint(
                painter: MyCustomPainter(
                  points: points,
                  color: selectedColor,
                  strokeWidth: strokeWidth,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          // height: 20,
          width: 10,
        ),
        Container(
          width: width * 0.05,
          height: height * 0.7,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Text("Color"),
              IconButton(
                icon: Icon(
                  Icons.color_lens,
                  color: selectedColor,
                ),
                onPressed: () {
                  selectColor();
                },
              ),
              Expanded(
                child: RotatedBox(
                  quarterTurns: 3,
                  child: Slider(
                    min: 1.0,
                    max: 7.0,
                    activeColor: selectedColor,
                    value: strokeWidth,
                    onChanged: (value) {
                      setState(() {
                        strokeWidth = value;
                      });
                    },
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.layers_clear),
                onPressed: () {
                  setState(() {
                    points.clear();
                  });
                },
              ),
              Text("Borrar"),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        )
      ],
    );
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
