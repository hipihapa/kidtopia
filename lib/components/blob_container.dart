import 'package:flutter/material.dart';

class BlobContainer extends StatelessWidget {
  final double width;
  final double height;
  final Color? color;
  final Border? border;
  final Widget child;

  const BlobContainer({
    super.key,
    required this.width,
    required this.height,
    this.color,
    this.border,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CustomPaint(
        painter: border != null ? BlobBorderPainter(border: border!) : null,
        child: ClipPath(
          clipper: BlobClipper(),
          clipBehavior: Clip.antiAlias,
          child: Container(
            width: width,
            height: height,
            color: color,
            child: child,
          ),
        ),
      ),
    );
  }
}

class BlobClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // Start from top-left corner area
    path.moveTo(size.width * 0.15, 0);

    // Top edge: gentle curve
    path.cubicTo(
      size.width * 0.35,
      size.height * 0.10, // inward curve
      size.width * 0.65,
      size.height * 0.10, // inward curve
      size.width * 0.85,
      0, // end point
    );

    // Top-right corner: smoothly rounded
    path.cubicTo(
      size.width * 0.90,
      0, // gradual start
      size.width * 0.97,
      size.height * 0.03, // gentle curve
      size.width,
      size.height * 0.15, // settle
    );

    // Right edge: straight
    path.cubicTo(
      size.width,
      size.height * 0.4, // straight
      size.width,
      size.height * 0.6, // straight
      size.width,
      size.height * 0.85, // move toward corner
    );

    // Bottom-right corner: smoothly rounded
    path.cubicTo(
      size.width * 0.97,
      size.height * 0.97, // gentle curve
      size.width * 0.90,
      size.height, // gradual end
      size.width * 0.85,
      size.height, // settle
    );

    // Bottom edge: gentle curve
    path.cubicTo(
      size.width * 0.65,
      size.height * 0.90, // inward curve
      size.width * 0.35,
      size.height * 0.90, // inward curve
      size.width * 0.15,
      size.height, // end point
    );

    // Bottom-left corner: smoothly rounded
    path.cubicTo(
      size.width * 0.10,
      size.height, // gradual start
      size.width * 0.03,
      size.height * 0.97, // gentle curve
      0,
      size.height * 0.85, // settle
    );

    // Left edge: straight
    path.cubicTo(
      0,
      size.height * 0.6, // straight
      0,
      size.height * 0.4, // straight
      0,
      size.height * 0.15, // move toward corner
    );

    // Top-left corner: smoothly rounded
    path.cubicTo(
      0.03 * size.width,
      size.height * 0.03, // gentle curve
      size.width * 0.10,
      0, // gradual end
      size.width * 0.15,
      0, // back to start
    );

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class BlobBorderPainter extends CustomPainter {
  final Border border;

  BlobBorderPainter({required this.border});

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();

    // Same path as BlobClipper
    path.moveTo(size.width * 0.15, 0);

    path.cubicTo(
      size.width * 0.35,
      size.height * 0.10,
      size.width * 0.65,
      size.height * 0.10,
      size.width * 0.85,
      0,
    );

    path.cubicTo(
      size.width * 0.90,
      0,
      size.width * 0.97,
      size.height * 0.03,
      size.width,
      size.height * 0.15,
    );

    path.cubicTo(
      size.width,
      size.height * 0.4,
      size.width,
      size.height * 0.6,
      size.width,
      size.height * 0.85,
    );

    path.cubicTo(
      size.width * 0.97,
      size.height * 0.97,
      size.width * 0.90,
      size.height,
      size.width * 0.85,
      size.height,
    );

    path.cubicTo(
      size.width * 0.65,
      size.height * 0.90,
      size.width * 0.35,
      size.height * 0.90,
      size.width * 0.15,
      size.height,
    );

    path.cubicTo(
      size.width * 0.10,
      size.height,
      size.width * 0.03,
      size.height * 0.97,
      0,
      size.height * 0.85,
    );

    path.cubicTo(
      0,
      size.height * 0.6,
      0,
      size.height * 0.4,
      0,
      size.height * 0.15,
    );

    path.cubicTo(
      0.03 * size.width,
      size.height * 0.03,
      size.width * 0.10,
      0,
      size.width * 0.15,
      0,
    );

    path.close();

    final paint = Paint()
      ..color = border.top.color
      ..strokeWidth = border.top.width
      ..style = PaintingStyle.stroke;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
