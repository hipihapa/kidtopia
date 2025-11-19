import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kidtopia/kidtopia/resources.dart';
import 'package:kidtopia/components/bottom_sheet_clipper.dart';
import 'package:kidtopia/components/character_card.dart';

class PickCharacterScreen extends StatefulWidget {
  const PickCharacterScreen({super.key});

  @override
  State<PickCharacterScreen> createState() => _PickCharacterScreenState();
}

class _PickCharacterScreenState extends State<PickCharacterScreen> {
  late ScrollController _scrollController;
  double _scrollOffset = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {
        _scrollOffset = _scrollController.offset;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // Calculate scale and border visibility based on card position
  Map<String, double> _getCardTransform(int cardIndex, double screenWidth) {
    final cardWidth = 200.0;
    final spacing = 20.0;
    final totalCardWidth = cardWidth + spacing;

    // Account for the leading SizedBox offset
    final leadingOffset = screenWidth / 2 - 100;

    // Calculate the position of this card (including leading offset)
    final cardPosition =
        leadingOffset + (cardIndex * totalCardWidth) - _scrollOffset;

    // Calculate the center of the viewport
    final viewportCenter = screenWidth / 2;

    // Calculate distance from center
    final cardCenter = cardPosition + (cardWidth / 2);
    final distanceFromCenter = (cardCenter - viewportCenter).abs();

    // Calculate scale (1.1 at center, 0.9 at edges)
    final maxScale = 1.1;
    final minScale = 0.9;
    final scaleRange = maxScale - minScale;
    final normalizedDistance = (distanceFromCenter / (screenWidth / 2)).clamp(
      0.0,
      1.0,
    );
    final scale = maxScale - (scaleRange * normalizedDistance);

    // Calculate border prominence (1.0 at center, 0.0 at edges)
    final borderOpacity = (1.0 - normalizedDistance).clamp(0.0, 1.0);

    return {'scale': scale, 'borderOpacity': borderOpacity};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.bg),
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0, top: 10.0),
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.grey.withValues(alpha: 0.4),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(Assets.p1),
                                  ),
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                              ),

                              SizedBox(width: 10),

                              Padding(
                                padding: const EdgeInsets.only(right: 6.0),
                                child: Container(
                                  width: 34,
                                  height: 34,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(Assets.p2),
                                    ),
                                    color: Colors.grey.withValues(alpha: 0.4),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(right: 30.0),
                        child: Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.grey.withValues(alpha: 0.4),
                                border: Border.all(color: Colors.grey),
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  Assets.joystick,
                                  width: 10,
                                  height: 10,
                                  color: Colors.white,
                                ),
                              ),
                            ),

                            SizedBox(width: 10),

                            Container(
                              width: 90,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.grey.withValues(alpha: 0.4),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.grey),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 8.0,
                                      top: 8.0,
                                      bottom: 8.0,
                                    ),
                                    child: Image.asset(Assets.coin),
                                  ),
                                  // Icon(Icons.attach_money, size: 18, color: Colors.white),
                                  SizedBox(width: 6),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 2.0),
                                    child: Text(
                                      "3,100",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 18),

                  Column(
                    children: [
                      Text(
                        "Hand-Pick Your",
                        style: GoogleFonts.yesevaOne(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Character",
                        style: GoogleFonts.yesevaOne(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            top: MediaQuery.of(context).size.height * 0.25 + 8,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 50,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipPath(
              clipper: BottomSheetClipper(),
              clipBehavior: Clip.antiAlias,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.76,
                color: Colors.white,
                child: SingleChildScrollView(
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                        right: 20.0,
                        // top: 10.0,
                        bottom: 10.0,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Explore",
                                style: GoogleFonts.yesevaOne(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "View More",
                                style: GoogleFonts.yesevaOne(
                                  color: const Color.fromARGB(
                                    255,
                                    13,
                                    136,
                                    236,
                                  ),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 120),

                          SingleChildScrollView(
                            controller: _scrollController,
                            scrollDirection: Axis.horizontal,
                            clipBehavior: Clip.none,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 2 -
                                      100,
                                ),
                                _buildTransformedCard(
                                  context: context,
                                  cardIndex: 0,
                                  assetPath: Assets.c3,
                                  gradientColors: [
                                    Colors.blueAccent,
                                    Colors.blue.shade700,
                                  ],
                                  borderColor: Colors.blue,
                                ),
                                SizedBox(width: 20),
                                _buildTransformedCard(
                                  context: context,
                                  cardIndex: 1,
                                  assetPath: Assets.c2,
                                  gradientColors: [
                                    Colors.orangeAccent,
                                    Colors.deepOrangeAccent,
                                  ],
                                  borderColor: Colors.orange,
                                ),
                                SizedBox(width: 20),
                                _buildTransformedCard(
                                  context: context,
                                  cardIndex: 2,
                                  assetPath: Assets.c5,
                                  gradientColors: [
                                    Colors.brown,
                                    Colors.brown.shade700,
                                  ],
                                  borderColor: Colors.brown,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 2 -
                                      100,
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 18),

                          Text(
                            "Kenjiro",
                            style: GoogleFonts.yesevaOne(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Enigmatic explorer guiding metaverse",
                            style: GoogleFonts.yesevaOne(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "adventure through endless digital",
                            style: GoogleFonts.yesevaOne(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "dimensions.",
                            style: GoogleFonts.yesevaOne(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 10),

                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  const Color.fromARGB(255, 12, 89, 196),
                                  Colors.blue.shade700,
                                ],
                              ),
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blue.withValues(alpha: 0.5),
                                  spreadRadius: 1,
                                  blurRadius: 12,
                                  offset: Offset(
                                    0,
                                    4,
                                  ), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 10.0,
                                right: 10.0,
                                top: 4.0,
                                bottom: 4.0,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(
                                    Assets.coin,
                                    width: 25,
                                    height: 25,
                                  ),
                                  SizedBox(width: 6),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Text(
                                      "1,240",
                                      style: GoogleFonts.yesevaOne(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransformedCard({
    required BuildContext context,
    required int cardIndex,
    required String assetPath,
    required List<Color> gradientColors,
    required Color borderColor,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final transform = _getCardTransform(cardIndex, screenWidth);
    final scale = transform['scale']!;
    final borderOpacity = transform['borderOpacity']!;

    return Transform.scale(
      scale: scale,
      child: CharacterCard(
        assetPath: assetPath,
        gradientColors: gradientColors,
        borderColor: borderColor,
        scale: scale,
        borderOpacity: borderOpacity,
      ),
    );
  }
}
