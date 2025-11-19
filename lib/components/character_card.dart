import 'package:flutter/material.dart';
import 'package:kidtopia/components/cone_clipper.dart';
import 'package:kidtopia/components/cone_border_painter.dart';

class CharacterCard extends StatelessWidget {
  final String assetPath;
  final List<Color> gradientColors;
  final Color borderColor;
  final double scale;
  final double borderOpacity;

  const CharacterCard({
    super.key,
    required this.assetPath,
    required this.gradientColors,
    this.borderColor = Colors.orange,
    this.scale = 1.0,
    this.borderOpacity = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    // Adjust border width and gap based on scale and opacity
    final adjustedBorderWidth = 2.0 + (borderOpacity * 4.0); // 2-6px border
    final adjustedGap = 4.0 + (borderOpacity * 4.0); // 4-8px gap

    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Border layer with opacity
        Opacity(
          opacity: 0.3 + (borderOpacity * 0.7), // 0.3-1.0 opacity
          child: CustomPaint(
            size: Size(200, 240),
            painter: ConeBorderPainter(
              borderColor: borderColor,
              borderWidth: adjustedBorderWidth,
              gap: adjustedGap,
            ),
          ),
        ),
        // Content layer with gap
        Positioned(
          left: adjustedGap,
          top: adjustedGap,
          right: adjustedGap,
          bottom: adjustedGap,
          child: ClipPath(
            clipper: ConeClipper(),
            child: Container(
              width: 200 - (adjustedGap * 2),
              height: 240 - (adjustedGap * 2),
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
          left: adjustedGap,
          top: 0,
          right: adjustedGap,
          child: Transform.translate(
            offset: Offset(0, -100),
            child: Image.asset(assetPath, width: 200, height: 300),
          ),
        ),
      ],
    );
  }
}
