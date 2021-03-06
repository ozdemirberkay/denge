import 'package:denge/utils/appColors.dart';
import 'package:flutter/material.dart';

class DengeButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final Color? color;

  const DengeButton({
    Key? key,
    required this.label,
    this.onPressed,
    this.icon,
    this.color = darkColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        label,
        style: const TextStyle(color: lightColor),
      ),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(primary: darkColor),
    );
  }
}
