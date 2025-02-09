import 'package:denge/constants/appColors.dart';
import 'package:flutter/material.dart';

class DengeButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final Color? color;

  const DengeButton({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
    this.color = darkColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(backgroundColor: darkColor),
      child: Text(
        label,
      ),
    );
  }
}
