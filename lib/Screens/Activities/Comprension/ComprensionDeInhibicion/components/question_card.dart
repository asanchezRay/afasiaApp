import 'package:afasia/Screens/Activities/Comprension/ComprensionDeInhibicion/controllers/question_controller.dart';
import 'package:afasia/Screens/Activities/Comprension/ComprensionDeInhibicion/models/questions.dart';
import 'package:afasia/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key key,
    @required this.question,
  }) : super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context) {
    QuestionControllerCDI _controller = Get.put(QuestionControllerCDI());
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
          Wrap(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,

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
