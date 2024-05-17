import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key, required this.icon, this.onPressed, required this.containerColor, required this.iconColor,
  });

  final IconData icon;
  final Function()? onPressed;
  final Color containerColor;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: containerColor,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, color: iconColor,),
        onPressed: onPressed,
      ),
    );
  }
}