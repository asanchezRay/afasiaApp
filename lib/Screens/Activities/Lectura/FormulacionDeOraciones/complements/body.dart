import 'package:afasia/Screens/Activities/Lectura/FormulacionDeOraciones/controllers/question_controller.dart';
import 'package:afasia/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
    @required this.oracionCorrecta,
    this.index,
  }) : super(key: key);

  final List<String> oracionCorrecta;
  final int index;

  @override
  _BodyState createState() => _BodyState(oracionCorrecta, index);
}

class _BodyState extends State<Body> {
  final List<String> oracionCorrecta;
  final int index;
  _BodyState(this.oracionCorrecta, this.index);
  List<bool> acepted = <bool>[];
  QuestionControllerFO _controller = Get.put(QuestionControllerFO());

  @override
  void initState() {
    for (var i = 0; i < oracionCorrecta.length; i++) {
      acepted.add(false);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Column oracion = _getOracion();
    Column oracionTarget = _getOracionTarget();

    oracion.children.shuffle();
    print(oracion);
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding,
      ),
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          oracion,
          Divider(
            height: 10,
          ),
          oracionTarget,
        ],
      ),
    );
  }

  Column _getOracion() {
    List<Draggable> oracion = <Draggable>[];

    for (var i = 0; i < oracionCorrecta.length; i++) {
      if (oracionCorrecta[i] == '¿' || oracionCorrecta[i] == '?') {
        acepted[i] = true;
      } else {
        oracion.add(
          Draggable(
            child: acepted[i]
                ? Container()
                : _drawDragItem(oracionCorrecta[i], false),
            feedback: _drawDragItem(oracionCorrecta[i], false),
            childWhenDragging: Container(),
            data: i,
            onDragCompleted: () {},
          ),
        );
      }
    }
    oracion.shuffle();

    if (oracion.length <= 3) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: oracion,
          ),
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: oracion.sublist(0, 3),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: oracion.sublist(3, oracion.length),
          ),
        ],
      );
    }

    // return oracion;
  }

  Column _getOracionTarget() {
    List<Widget> oracionTarget = <Widget>[];
    for (var i = 0; i < oracionCorrecta.length; i++) {
      oracionTarget.add(
        DragTarget(
          builder: (context, oracion, rejectedData) {
            return acepted[i]
                ? _drawDragItem(oracionCorrecta[i], true)
                : _drawDragItem(
                    _getStringWithMaxLengthWord(oracionCorrecta), true);
          },
          onWillAccept: (data) {
            print(data);
            return true;
          },
          onAccept: (data) {
            if (data == i) {
              setState(() {
                acepted[i] = true;
              });
            }
            if (_checkAnswer()) {
              _controller.nextQuestion();
            }
          },
        ),
      );
    }
    if (oracionTarget.length <= 3) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: oracionTarget,
          ),
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: oracionTarget.sublist(0, 3),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: oracionTarget.sublist(3, oracionTarget.length),
          ),
        ],
      );
    }
  }

  _drawDragItem(String s, bool color) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: color ? kPrimaryColor : kPrimaryLightColor,
      ),
      child: Text(
        s,
        style: TextStyle(
          color: color ? kPrimaryLightColor : kPrimaryColor,
          fontSize: 35,
        ),
      ),
      // color: kPrimaryColor,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(12),
    );
  }

  String _getStringWithMaxLengthWord(List<String> oracion) {
    int max = -1;
    for (var i = 0; i < oracion.length; i++) {
      if (oracion[i].length > max) {
        max = oracion[i].length;
      }
    }
    String s = "  ";
    for (var i = 0; i < max; i++) {
      s += " ";
    }
    return s;
  }

  bool _checkAnswer() {
    for (var i = 0; i < acepted.length; i++) {
      if (acepted[i] == false) {
        return false;
      }
    }
    return true;
  }
}
