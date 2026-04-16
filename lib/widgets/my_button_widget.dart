import 'package:flutter/material.dart';

class MyButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color? color;
  final Color? textColor;
  final Border? border;

  const MyButtonWidget({
    super.key,
    required this.onPressed,
    required this.text,
    this.color,
    this.border, this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
            side: border?.top ?? BorderSide.none,
          ),
          elevation: 0,
        ),
        child: Text(text, style: TextStyle(color: textColor)),
      ),
    );
  }
}