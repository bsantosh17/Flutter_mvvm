import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  final IconData icon;
  final double radius;
  final Color backgroundColor;
  final Color iconColor;
  final VoidCallback onPressed;

  const CustomCircleAvatar({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.radius = 24.0,
    this.backgroundColor = Colors.blue,
    this.iconColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(radius),
      child: CircleAvatar(
        radius: radius,
        backgroundColor: backgroundColor,
        child: Icon(
          icon,
          color: iconColor,
          size: radius * 0.8,
        ),
      ),
    );
  }
}
