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
    this.color = const Color(0xff305F72),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        child: Text(
          label,
          style: const TextStyle(color: Color(0xffEAF9FE)),
        ),
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(primary: const Color(0xff305F72)),
      ),
    );
  }
}
