import 'package:afasia/constants.dart';
import 'package:flutter/material.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:gender_picker/source/gender_picker.dart';

class GenderSelector extends StatelessWidget {
  final Function(Gender) onChanged;
  const GenderSelector({
    Key key,
    @required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.center,
      child: GenderPickerWithImage(
        showOtherGender: true,
        femaleText: "Femenino",
        maleText: "Masculino",
        otherGenderText: "Sin especificar",
        verticalAlignedText: false,
        // selectedGender: Gender.Male,
        selectedGender: getSexo(),
        selectedGenderTextStyle: TextStyle(
          color: kPrimaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        unSelectedGenderTextStyle: TextStyle(
          color: kPrimaryColor,
          fontWeight: FontWeight.normal,
          fontSize: 18,
        ),

        onChanged: onChanged,
        equallyAligned: true,
        animationDuration: Duration(milliseconds: 300),
        isCircular: true,
        // default : true,
        opacityOfGradient: 0.4,
        padding: const EdgeInsets.all(3),
        size: 60, //default : 40
      ),
    );
  }

  getSexo() {
    if (sexo == "masculino") {
      return Gender.Male;
    } else if (sexo == "femenino") {
      return Gender.Female;
    } else {
      return Gender.Others;
    }
  }
}
