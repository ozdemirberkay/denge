import 'package:denge/utils/appColors.dart';
import 'package:flutter/material.dart';

class DengeOptionButton extends StatefulWidget {
  final String option;
  final String correctAnswer;

  Color color;
  Color backgroundColor;

  DengeOptionButton({
    Key? key,
    required this.option,
    required this.correctAnswer,
    this.color = lightColor,
    this.backgroundColor = darkColor,
  }) : super(key: key);

  @override
  State<DengeOptionButton> createState() => _DengeOptionButtonState();
}

class _DengeOptionButtonState extends State<DengeOptionButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            backgroundColor: widget.backgroundColor,
            side: BorderSide(width: 3, color: widget.color),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          onPressed: () {
            if (widget.option == widget.correctAnswer) {
              setState(() {
                widget.color = Colors.green;
                widget.backgroundColor = const Color(0xffC9F4DE);
              });
            } else {
              setState(() {
                widget.color = Colors.red;
                widget.backgroundColor = const Color(0xffEBD6DA);
              });
            }
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: Text(
              widget.option,
              style: TextStyle(color: widget.color, fontSize: 17),
            ),
          )),
    );
  }
}
