import 'package:flutter/material.dart';

class BottomSheetClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final cornerRadius = 40.0;
    final inwardCurve = 35.0; // How much the top middle curves inward

    // Start from bottom-left corner
    path.moveTo(0, size.height);

    // Bottom edge: straight
    path.lineTo(size.width, size.height);

    // Right edge: straight
    path.lineTo(size.width, cornerRadius);

    // Top-right corner: smoothly rounded using quadratic bezier
    // Control point at the corner vertex for perfect quarter circle
    path.quadraticBezierTo(
      size.width,
      0, // control point at corner
      size.width - cornerRadius,
      0, // end point
    );

    // Top edge with inward curve in the middle
    // From right corner area to middle (with inward curve)
    path.cubicTo(
      size.width * 0.82,
      inwardCurve * 0.1, // smooth transition from corner
      size.width * 0.65,
      inwardCurve, // inward curve
      size.width * 0.5,
      inwardCurve, // deepest point in the middle
    );

    // From middle to left corner area (with inward curve)
    // Mirror the right side exactly
    path.cubicTo(
      size.width * 0.35,
      inwardCurve, // inward curve
      size.width * 0.18,
      inwardCurve * 0.1, // smooth transition to corner (mirrors right side)
      cornerRadius,
      0, // end point at left corner start (mirrors right: size.width - cornerRadius)
    );

    // Top-left corner: smoothly rounded using cubic bezier for perfect quarter circle
    // This ensures the corner is fully rounded, matching the right side
    path.cubicTo(
      cornerRadius * 0.5,
      0, // first control point
      0,
      cornerRadius * 0.5, // second control point
      0,
      cornerRadius, // end point on left edge
    );

    // Left edge: straight
    path.lineTo(0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

