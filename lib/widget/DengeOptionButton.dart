import 'package:denge/utils/appColors.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DengeOptionButton extends StatefulWidget {
  final String option;
  final String correctAnswer;
  final VoidCallback? onPressed;
  Color color;
  Color backgroundColor;

  DengeOptionButton({
    Key? key,
    required this.option,
    required this.correctAnswer,
    this.color = lightColor,
    this.backgroundColor = darkColor,
    this.onPressed,
  }) : super(key: key);

  @override
  State<DengeOptionButton> createState() => _DengeOptionButtonState();
}

class _DengeOptionButtonState extends State<DengeOptionButton> {
  var box = Hive.box("achievements");
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
          onPressed: () async {
            int total = box.get("total") ?? 0;
            await box.put("total", total + 1);
            if (widget.option == widget.correctAnswer) {
              int correct = box.get("correct") ?? 0;
              await box.put("correct", correct + 1);
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
