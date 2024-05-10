import 'dart:io';
import 'dart:math';

import 'package:afasia/Screens/Activities/Lectura/NominacionAcciones/controllers/question_controller.dart';
import 'package:afasia/Screens/Activities/Lectura/NominacionAcciones/models/questions.dart';
import 'package:afasia/constants.dart';
import 'package:afasia/database/database.dart';
import 'package:afasia/database/models/lecturaOraciones.class.dart';
import 'package:afasia/database/models/nominacion.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:flutter_sound_platform_interface/flutter_sound_recorder_platform_interface.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'option.dart';

typedef _Fn = void Function();

const theSource = AudioSource.microphone;

class QuestionCard extends StatefulWidget {
  const QuestionCard({
    Key key,
    @required this.question,
  }) : super(key: key);

  final Question question;

  @override
  _QuestionCardState createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  bool _isRecording = false;
  bool _isDisabledPlayButton = true;
  bool _isPaused = false;
  bool _stringCreated = true;
  int _recordDuration = 0;

  var filename;
  var file;

  final _audioRecorder = Record();

  @override
  void initState() {
    _isRecording = false;
    super.initState();
  }

  @override
  void dispose() {
    // _audioRecorder.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    QuestionControllerNA _controller = Get.put(QuestionControllerNA());
    if (_stringCreated) {
      filename = generateRandomString(50) + '.m4a';
    }
    print(filename);
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        // vertical: kDefaultPadding,
      ),
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withOpacity(0.4),
        //     blurRadius: 5.0,
        //     spreadRadius: 1.0,
        //   )
        // ],
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          // Text(
          //   widget.question.question,
          //   style: Theme.of(context)
          //       .textTheme
          //       .headline6
          //       .copyWith(color: kPrimaryColor, fontSize: 60),
          // ),
          Image.asset(
            widget.question.question,
            width: 400,
          ),
          SizedBox(
            width: kDefaultPadding * 2,
          ),
          Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: kDefaultPadding * 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RawMaterialButton(
                    onPressed: () async {
                      final directory =
                          await getApplicationDocumentsDirectory();
                      print(directory.path);

                      if (_isRecording == false) {
                        _isRecording = true;
                        bool result = await Record.hasPermission();
                        final directory =
                            await getApplicationDocumentsDirectory();

                        print("path" + directory.path + '/${filename}');
                        await Record.start(
                          path: directory.path + '/${filename}',
                          encoder: AudioEncoder.AAC, // by default
                          bitRate: 128000, // by default
                          samplingRate: 44100, // by default
                        );
                      } else {
                        _isRecording = false;
                        _isDisabledPlayButton = false;
                        await Record.stop();
                      }
                      setState(() {
                        _stringCreated = false;
                      });
                    },
                    elevation: 2.0,
                    fillColor: kPrimaryLightColor,
                    child: Column(
                      children: [
                        Icon(
                          !_isRecording ? Icons.mic : Icons.stop,
                          size: 150.0,
                          color: kPrimaryColor,
                        ),
                        Text(
                          !_isRecording ? "Grabar" : "Detener",
                          style: TextStyle(fontSize: 24, color: kPrimaryColor),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(30.0),
                    shape: CircleBorder(),
                  ),
                  SizedBox(
                    width: kDefaultPadding * 2,
                  ),
                  RawMaterialButton(
                    onPressed: () async {
                      if (!_isDisabledPlayButton) {
                        final directory =
                            await getApplicationDocumentsDirectory();
                        final assetsAudioPlayer = AssetsAudioPlayer();
                        assetsAudioPlayer
                            .open(Audio.file(directory.path + '/${filename}'));
                      }
                    },
                    elevation: 2.0,
                    fillColor: _isDisabledPlayButton
                        ? Colors.grey[400]
                        : kPrimaryLightColor,
                    child: Column(
                      children: [
                        Icon(
                          Icons.play_arrow,
                          size: 150.0,
                          color: _isDisabledPlayButton
                              ? Colors.white
                              : kPrimaryColor,
                        ),
                        Text(
                          "Reproducir",
                          style: TextStyle(
                              fontSize: 24,
                              color: _isDisabledPlayButton
                                  ? Colors.white
                                  : kPrimaryColor),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(30.0),
                    shape: CircleBorder(),
                  ),
                  SizedBox(
                    width: kDefaultPadding * 2,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RawMaterialButton(
                    onPressed: () async {
                      AfasiaDatabase db = AfasiaDatabase();
                      // var db = await database;
                      await db.initDB();
                      var actividad = Nominacion(rutPacienteTrabajando, 1,
                          widget.question.question, filename, 0);
                      await db.insertarActividadNominacionAcciones(actividad);

                      if (!_isDisabledPlayButton) {
                        _controller.nextQuestion();
                      }
                    },
                    elevation: 2.0,
                    fillColor: _isDisabledPlayButton
                        ? Colors.grey[400]
                        : kPrimaryLightColor,
                    child: Column(
                      children: [
                        Icon(
                          Icons.navigate_next,
                          semanticLabel: "siguiente",
                          size: 150.0,
                          color: _isDisabledPlayButton
                              ? Colors.white
                              : kPrimaryColor,
                        ),
                        Text(
                          "Siguiente",
                          style: TextStyle(
                              fontSize: 24,
                              color: _isDisabledPlayButton
                                  ? Colors.white
                                  : kPrimaryColor),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(30.0),
                    shape: CircleBorder(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
