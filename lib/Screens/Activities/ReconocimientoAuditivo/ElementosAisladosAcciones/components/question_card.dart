import 'package:afasia/Screens/Activities/ReconocimientoAuditivo/ElementosAisladosAcciones/controllers/question_controller.dart';
import 'package:afasia/Screens/Activities/ReconocimientoAuditivo/ElementosAisladosAcciones/models/questions.dart';
import 'package:afasia/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

import 'option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key key,
    @required this.question,
  }) : super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context) {
    print("cargo el audio");
    // assetsAudioPlayer.play();
    lastAudioPlay = question.audio;

    QuestionControllerEAA _controller = Get.put(QuestionControllerEAA());
    final assetsAudioPlayer = AssetsAudioPlayer();
    assetsAudioPlayer.open(
      Audio(question.audio),
    );
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
      child: Column(
        children: [
          Text(
            question.question,
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(color: kPrimaryColor),
          ),
          SizedBox(
            height: kDefaultPadding / 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...List.generate(
                question.options.length,
                (index) => Option(
                  index: index,
                  text: question.options[index],
                  press: () => _controller.checkAns(question, index),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
