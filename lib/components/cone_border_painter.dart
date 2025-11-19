import 'dart:math' as math;
import 'package:flutter/material.dart';

class ConeBorderPainter extends CustomPainter {
  final Color borderColor;
  final double borderWidth;
  final double gap;

  ConeBorderPainter({
    required this.borderColor,
    required this.borderWidth,
    required this.gap,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    final path = _createConePath(size);
    canvas.drawPath(path, paint);
  }

  Path _createConePath(Size size) {
    final path = Path();
    final topWidth = size.width;
    final bottomWidth = size.width * 0.95;
    final cornerRadius = 30.0;

    final bottomOffset = (topWidth - bottomWidth) / 2;
    final edgeLength = math.sqrt(
      math.pow(bottomOffset, 2) + math.pow(size.height, 2),
    );
    final leftEdgeUnitX = -bottomOffset / edgeLength;
    final leftEdgeUnitY = size.height / edgeLength;

    path.moveTo(cornerRadius, 0);
    path.arcToPoint(
      Offset(0, cornerRadius),
      radius: Radius.circular(cornerRadius),
      clockwise: false,
    );

    final leftBottomX = bottomOffset;
    final leftBottomY = size.height;
    final leftEdgeEndX = leftBottomX - cornerRadius * leftEdgeUnitX;
    final leftEdgeEndY = leftBottomY - cornerRadius * leftEdgeUnitY;
    path.lineTo(leftEdgeEndX, leftEdgeEndY);

    path.arcToPoint(
      Offset(leftBottomX + cornerRadius, leftBottomY),
      radius: Radius.circular(cornerRadius),
      clockwise: false,
    );

    path.lineTo(size.width - bottomOffset - cornerRadius, size.height);

    final rightBottomX = size.width - bottomOffset;
    final rightBottomY = size.height;
    final rightEdgeEndX = rightBottomX - cornerRadius * leftEdgeUnitX;
    final rightEdgeEndY = rightBottomY - cornerRadius * leftEdgeUnitY;
    path.arcToPoint(
      Offset(rightEdgeEndX, rightEdgeEndY),
      radius: Radius.circular(cornerRadius),
      clockwise: false,
    );

    path.lineTo(size.width, cornerRadius);

    path.arcToPoint(
      Offset(size.width - cornerRadius, 0),
      radius: Radius.circular(cornerRadius),
      clockwise: false,
    );

    path.lineTo(cornerRadius, 0);
    path.close();

    return path;
  }

  @override
  bool shouldRepaint(ConeBorderPainter oldDelegate) =>
      oldDelegate.borderColor != borderColor ||
      oldDelegate.borderWidth != borderWidth ||
      oldDelegate.gap != gap;
}

