import 'package:flutter/material.dart';
import 'package:kidtopia/components/cone_clipper.dart';
import 'package:kidtopia/components/cone_border_painter.dart';

class CharacterCard extends StatelessWidget {
  final String assetPath;
  final List<Color> gradientColors;
  final Color borderColor;

  const CharacterCard({
    super.key,
    required this.assetPath,
    required this.gradientColors,
    this.borderColor = Colors.orange,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Border layer
        CustomPaint(
          size: Size(200, 240),
          painter: ConeBorderPainter(
            borderColor: borderColor,
            borderWidth: 2,
            gap: 4,
          ),
        ),
        // Content layer with gap
        Positioned(
          left: 4,
          top: 4,
          right: 4,
          bottom: 4,
          child: ClipPath(
            clipper: ConeClipper(),
            child: Container(
              width: 200 - 8,
              height: 240 - 8,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: gradientColors,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
        ),
        // Image positioned to extend outside - half above container
        Positioned(
          left: 4,
          top: 0,
          right: 4,
          child: Transform.translate(
            offset: Offset(0, -100),
            child: Image.asset(assetPath, width: 200, height: 300),
          ),
        ),
      ],
    );
  }
}
