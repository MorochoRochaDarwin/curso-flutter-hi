import 'package:flutter/material.dart';

class InputText extends StatefulWidget {
  final String label;
  final bool isSecure;
  final TextInputType keyboardType;
  final Function(String) validator;

  const InputText(
      {Key key,
      @required this.label,
      this.isSecure = false,
      this.keyboardType = TextInputType.text,
      this.validator})
      : super(key: key);

  @override
  InputTextState createState() => InputTextState();
}

class InputTextState extends State<InputText> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      obscureText: widget.isSecure,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(bottom: 5),
          labelText: widget.label,
          labelStyle: TextStyle(color: Colors.black45),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black45))),
    );
  }
}
