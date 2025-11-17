import 'dart:math' as math;
import 'package:flutter/material.dart';

class ConeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    final topWidth = size.width;
    final bottomWidth = size.width * 0.85;
    final cornerRadius = 30.0;

    // Calculate the horizontal offset for the bottom corners
    final bottomOffset = (topWidth - bottomWidth) / 2;

    // Calculate unit vectors for the slanted edges
    final edgeLength = math.sqrt(
      math.pow(bottomOffset, 2) + math.pow(size.height, 2),
    );
    final leftEdgeUnitX = -bottomOffset / edgeLength;
    final leftEdgeUnitY = size.height / edgeLength;

    // Start from top-left, after the rounded corner
    path.moveTo(cornerRadius, 0);

    // Top-left corner (rounded) - use arcToPoint for smooth corner
    path.arcToPoint(
      Offset(0, cornerRadius),
      radius: Radius.circular(cornerRadius),
      clockwise: false,
    );

    // Left edge (slanted) - line to point before bottom-left corner
    final leftBottomX = bottomOffset;
    final leftBottomY = size.height;
    final leftEdgeEndX = leftBottomX - cornerRadius * leftEdgeUnitX;
    final leftEdgeEndY = leftBottomY - cornerRadius * leftEdgeUnitY;
    path.lineTo(leftEdgeEndX, leftEdgeEndY);

    // Bottom-left corner (rounded) - arc from left edge to bottom edge
    path.arcToPoint(
      Offset(leftBottomX + cornerRadius, leftBottomY),
      radius: Radius.circular(cornerRadius),
      clockwise: false,
    );

    // Bottom edge
    path.lineTo(size.width - bottomOffset - cornerRadius, size.height);

    // Bottom-right corner (rounded) - arc from bottom edge to right edge
    final rightBottomX = size.width - bottomOffset;
    final rightBottomY = size.height;
    final rightEdgeEndX = rightBottomX - cornerRadius * leftEdgeUnitX;
    final rightEdgeEndY = rightBottomY - cornerRadius * leftEdgeUnitY;
    path.arcToPoint(
      Offset(rightEdgeEndX, rightEdgeEndY),
      radius: Radius.circular(cornerRadius),
      clockwise: false,
    );

    // Right edge (slanted)
    path.lineTo(size.width, cornerRadius);

    // Top-right corner (rounded)
    path.arcToPoint(
      Offset(size.width - cornerRadius, 0),
      radius: Radius.circular(cornerRadius),
      clockwise: false,
    );

    // Top edge
    path.lineTo(cornerRadius, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
