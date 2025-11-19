import 'package:flutter/material.dart';
import 'package:kidtopia/kidtopia/resources.dart';
import 'package:kidtopia/models/character_data.dart';

final List<CharacterData> availableCharacters = [
  CharacterData(
    name: "Zephyr",
    descriptionLines: [
      "Swift warrior mastering wind elements",
      "with lightning-fast reflexes and",
      "unmatched agility.",
    ],
    coins: "890",
    assetPath: Assets.c3,
    gradientColors: [Colors.blueAccent, Colors.blue.shade700],
    borderColor: Colors.blue,
  ),
  CharacterData(
    name: "Kenjiro",
    descriptionLines: [
      "Enigmatic explorer guiding metaverse",
      "adventure through endless digital",
      "dimensions.",
    ],
    coins: "1,240",
    assetPath: Assets.c2,
    gradientColors: [Colors.orangeAccent, Colors.deepOrangeAccent],
    borderColor: Colors.orange,
  ),
  CharacterData(
    name: "Terra",
    descriptionLines: [
      "Earth guardian protecting nature with",
      "powerful abilities and unwavering",
      "determination.",
    ],
    coins: "1,050",
    assetPath: Assets.c5,
    gradientColors: [Colors.brown, Colors.brown.shade700],
    borderColor: Colors.brown,
  ),
];

