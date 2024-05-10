import 'package:afasia/components/text_field_container.dart';
import 'package:afasia/constants.dart';
import 'package:flutter/material.dart';

class RoundedPassword extends StatefulWidget {
  final ValueChanged<String> onChanged;

  const RoundedPassword({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  State<RoundedPassword> createState() => _RoundedPasswordState();
}

class _RoundedPasswordState extends State<RoundedPassword> {
  @override
  var hidePass = true;
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: hidePass,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              !hidePass ? Icons.visibility : Icons.visibility_off,
              color: kPrimaryColor,
            ),
            onPressed: () {
              hidePass = !hidePass;

              setState(() {});
            },
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
