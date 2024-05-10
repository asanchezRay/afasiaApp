import 'package:afasia/components/text_field_container.dart';
import 'package:afasia/constants.dart';
import 'package:flutter/material.dart';

class RoundedDatepicker extends StatefulWidget {
  final GestureTapCallback onTap;
  TextEditingController inputFieldDateController;
  RoundedDatepicker({
    Key key,
    this.onTap,
    this.inputFieldDateController,
  }) : super(key: key);

  @override
  _RoundedDatepickerState createState() => _RoundedDatepickerState();
}

class _RoundedDatepickerState extends State<RoundedDatepicker> {
  // TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        enableInteractiveSelection: false,
        controller: widget.inputFieldDateController,
        // onChanged: onChanged,
        decoration: InputDecoration(
          hintText: "Fecha de nacimiento",
          icon: Icon(
            Icons.calendar_today,
            color: kPrimaryColor,
          ),
          border: InputBorder.none,
        ),
        onTap: widget.onTap,
        // () {
        //   FocusScope.of(context).requestFocus(new FocusNode());

        //   selectDate(context);
        // },
      ),
    );
  }

  // selectDate(BuildContext context) async {
  //   DateTime picked = await showDatePicker(
  //     context: context,
  //     initialDate: new DateTime.now(),
  //     firstDate: new DateTime(1900),
  //     lastDate: new DateTime.now(),
  //     locale: Locale('es', 'ES'),
  //     builder: (BuildContext context, Widget child) {
  //       return Theme(
  //         data: ThemeData.light().copyWith(
  //           colorScheme: ColorScheme.dark(
  //             primary: kPrimaryColor,
  //             onPrimary: Colors.black,
  //             surface: kPrimaryLightColor,
  //             onSurface: Colors.black,
  //             secondary: Colors.black,
  //             onSecondary: Colors.black,
  //           ),
  //           dialogBackgroundColor: Colors.white,
  //           accentColor: kPrimaryColor,
  //         ),
  //         child: child,
  //       );
  //     },
  //   );

  //   if (picked != null) {
  //     setState(() {
  //       _inputFieldDateController.text = picked.year.toString() +
  //           "-" +
  //           picked.month.toString() +
  //           "-" +
  //           picked.day.toString();
  //     });
  //   }
  // }
}
