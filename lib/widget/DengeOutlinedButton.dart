import 'package:denge/utils/appColors.dart';
import 'package:flutter/material.dart';

class DengeOutlinedButton extends StatefulWidget {
  final String label;
  final IconData icon;
  final bool? reverse;
  final VoidCallback? onPressed;

  const DengeOutlinedButton(
      {Key? key,
      required this.label,
      required this.icon,
      this.reverse = false,
      this.onPressed})
      : super(key: key);

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
          side: const BorderSide(width: 1.5, color: darkColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onPressed: widget.onPressed,
        child: widget.reverse != true
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.label,
                    style: const TextStyle(color: darkColor),
                  ),
                  const SizedBox(width: 10),
                  Icon(
                    widget.icon,
                    color: darkColor,
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    widget.icon,
                    color: darkColor,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    widget.label,
                    style: const TextStyle(color: darkColor),
                  ),
                ],
              ),
      ),
    );
  }
}
