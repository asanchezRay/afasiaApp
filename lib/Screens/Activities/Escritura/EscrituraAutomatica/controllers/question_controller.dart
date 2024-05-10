import 'package:afasia/Screens/Activities/Close/close_screen.dart';
import 'package:afasia/Screens/Activities/Escritura/EscrituraAutomatica/models/questions.dart';
import 'package:afasia/Screens/Welcome/welcome_screen.dart';
import 'package:afasia/constants.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restart/flutter_restart.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:afasia/Screens/Activities/White/white_screen.dart';

class QuestionControllerEA extends GetxController
    with SingleGetTickerProviderMixin {
  QuestionControllerEA(
      {this.context,
      this.id,
      this.actividadesAsignadas,
      this.guardarPantallazo});
  final guardarPantallazo;
  BuildContext context;
  int id;
  List<int> actividadesAsignadas;

  AnimationController _animationController;
  Animation _animation;
  // so that we can access our animation outside
  Animation get animation => this._animation;

  PageController _pageController;
  PageController get pageController => this._pageController;

  List<Question> _questions;
  List<Question> get questions => this._questions;

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  int _correctAns;
  int get correctAns => this._correctAns;

  int _selectAns = -1;
  int get selectAns => this._selectAns;

  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => this._numOfCorrectAns;

  int _intentos = 0;
  int get intentos => this._intentos;

  @override
  void onInit() {
    _setQuestion();

    this._questions.shuffle();
    this._questions = this._questions.sublist(0, this._questions.length);

    _animationController = AnimationController(vsync: this);
    _animation = Tween<double>(begin: 1, end: 0).animate(_animationController)
      ..addListener(() {
        update();
      });

    // _animationController.forward().whenComplete(nextQuestion);

    _pageController = PageController();

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }

  // void checkAns(Question question, int selectedIndex) {
  //   _isAnswered = true;
  //   _correctAns = 999;
  //   _selectAns = selectedIndex;

  //   if (_correctAns == _selectAns || _intentos >= 1) {
  //     _numOfCorrectAns++;
  //     print(_intentos);
  //     // _animationController.forward(from: 0.98).whenComplete(nextQuestion);
  //     _animationController.stop();
  //     Future.delayed(Duration(milliseconds: 1000), () {
  //       nextQuestion();
  //     });
  //   }

  //   if (_intentos == 1) {
  //     _intentos++;
  //   }

  //   if (_selectAns != _correctAns && _intentos < 1) {
  //     _intentos++;
  //     _animationController.reset();
  //     _animationController.forward(from: 0.66).whenComplete(nextQuestion);
  //   }

  //   update();
  // }

  void nextQuestion() {
    guardarPantallazo();
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _intentos = 0;
      _selectAns = -1;
      _pageController.nextPage(
        duration: Duration(milliseconds: 700),
        curve: Curves.ease,
      );
      _animationController.reset();
      // _animationController.forward().whenComplete(nextQuestion);
    } else {
      _nextRoute();
    }
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }

  void _setQuestion() {
    int dificultad = actividadesAsignadas[id];
    if (dificultad == 1) {
      this._questions = data1
          .map(
            (question) => Question(
              id: question['id'],
              question: question['question'],
              audio: question['audio'],
              // answer: question['answer_index'],
              // options: question['options'],
            ),
          )
          .toList();
    }
    if (dificultad == 2) {
      this._questions = data2
          .map(
            (question) => Question(
              id: question['id'],
              question: question['question'],
              audio: question['audio'],
              // answer: question['answer_index'],
              // options: question['options'],
            ),
          )
          .toList();
    }
    if (dificultad == 3) {
      this._questions = data3
          .map(
            (question) => Question(
              id: question['id'],
              question: question['question'],
              audio: question['audio'],
              // answer: question['answer_index'],
              // options: question['options'],
            ),
          )
          .toList();
    }
  }

  void _nextRoute() {
    for (var i = id + 1; i < actividadesAsignadas.length; i++) {
      print("actividad");
      print(actividadesAsignadas[i]);
      if (actividadesAsignadas[i] != 0) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => WhiteScreen(
                actividadesAsignadas: actividadesAsignadas,
                index: i,
              ),
            ),
            (route) => false);
        break;
      } else {
        if (i + 1 == actividadesAsignadas.length) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => CloseScreen(),
              ),
              (route) => false);
          break;
        }
      }
    }
  }
}
