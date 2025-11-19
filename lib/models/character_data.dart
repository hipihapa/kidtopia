import 'package:flutter/material.dart';

class CharacterData {
  final String name;
  final List<String> descriptionLines;
  final String coins;
  final String assetPath;
  final List<Color> gradientColors;
  final Color borderColor;

  CharacterData({
    required this.name,
    required this.descriptionLines,
    required this.coins,
    required this.assetPath,
    required this.gradientColors,
    required this.borderColor,
  });
}
