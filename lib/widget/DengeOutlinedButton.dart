import 'package:denge/constants/appColors.dart';
import 'package:flutter/material.dart';

class DengeOutlinedButton extends StatefulWidget {
  final String label;
  final IconData icon;
  final bool? reverse;
  final VoidCallback? onPressed;
  final Color color;

  const DengeOutlinedButton(
      {super.key,
      required this.label,
      required this.icon,
      this.reverse = false,
      this.onPressed,
      this.color = darkColor});

  @override
  State<DengeOutlinedButton> createState() => _DengeOutlinedButtonState();
}

class _DengeOutlinedButtonState extends State<DengeOutlinedButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(width: 1.5, color: widget.color),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onPressed: widget.onPressed,
        child: widget.reverse != true
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.label,
                    style: TextStyle(color: widget.color),
                  ),
                  const SizedBox(width: 10),
                  Icon(
                    widget.icon,
                    color: widget.color,
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    widget.icon,
                    color: widget.color,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    widget.label,
                    style: TextStyle(color: widget.color),
                  ),
                ],
              ),
      ),
    );
  }
}
