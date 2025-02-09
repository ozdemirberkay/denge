import 'package:denge/constants/appColors.dart';
import 'package:flutter/material.dart';

class DengeInput extends StatefulWidget {
  final String? labelText;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final IconData suffixIcon;
  final FormFieldValidator<String>? validator;
  final FocusNode? focusNode;
  const DengeInput(
      {super.key,
      this.labelText,
      required this.controller,
      this.keyboardType = TextInputType.text,
      this.obscureText = false,
      required this.suffixIcon,
      this.validator,
      this.focusNode});

  @override
  State<DengeInput> createState() => _DengeInputState();
}

class _DengeInputState extends State<DengeInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        focusNode: widget.focusNode,
        keyboardType: widget.keyboardType,
        validator: widget.validator,
        controller: widget.controller,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: const TextStyle(color: darkColor),
          suffixIcon: Icon(
            widget.suffixIcon,
            color: darkColor,
          ),
          border: const OutlineInputBorder(
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
