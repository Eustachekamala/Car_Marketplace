import 'package:flutter/material.dart';

class DoubleCircleDetailIconDetailWidget extends StatelessWidget {
  final IconData icon;

  const DoubleCircleDetailIconDetailWidget({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border(
          left: BorderSide(color: Colors.white.withAlpha(50)),
          right: BorderSide(color: Colors.white.withAlpha(50)),
        ),
      ),
      child: Center(
        child: Container(
          height: 36,
          width: 36,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white.withAlpha(60)),
          ),
          child: Center(child: Icon(icon, size: 18)),
        ),
      ),
    );
  }
}
