import 'package:denge/utils/appColors.dart';
import 'package:flutter/material.dart';

class DengeInput extends StatefulWidget {
  final String? labelText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final IconData suffixIcon;

  const DengeInput(
      {Key? key,
      this.labelText,
      required this.controller,
      this.keyboardType = TextInputType.text,
      this.obscureText = false,
      required this.suffixIcon})
      : super(key: key);

  @override
  State<DengeInput> createState() => _DengeInputState();
}

class _DengeInputState extends State<DengeInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        keyboardType: TextInputType.text,
        controller: widget.controller,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: TextStyle(color: darkColor),
          suffixIcon: Icon(
            widget.suffixIcon,
            color: darkColor,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              // color: darkColor,
              color: Colors.pink,
              width: 10,
            ),
          ),
        ),
      ),
    );
  }
}
