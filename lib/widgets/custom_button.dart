import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color color; // Required: Background color of the button
  final String text; // Required: Button text
  final Color textColor; // Required: Text color
  final VoidCallback onTap; // Required: Tap functionality
  final double? width; // Optional: Button width
  final double? height; // Optional: Button height
  final BorderRadius? borderRadius; // Optional: Border radius for rounded corners
  final List<BoxShadow>? boxShadow; // Optional: Box shadow for elevation
  final BoxBorder? border; // Optional: Border for the button

  const CustomButton({
    super.key,
    required this.color,
    required this.text,
    required this.textColor,
    required this.onTap,
    this.width,
    this.height,
    this.borderRadius,
    this.boxShadow,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 330, // Default width if not provided
        height: height ?? 60, // Default height if not provided
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius ?? BorderRadius.circular(60), // Default radius
          boxShadow: boxShadow,
          border: border,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}