import 'package:flutter/material.dart';

class DengeInput extends StatefulWidget {
  const DengeInput({Key? key}) : super(key: key);

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
        decoration: const InputDecoration(
          labelText: "Deneme",
          border: OutlineInputBorder(
            borderSide: BorderSide(
              // color: Color(0xff305F72),
              color: Colors.pink,
              width: 10,
            ),
          ),
        ),
      ),
    );
  }
}
