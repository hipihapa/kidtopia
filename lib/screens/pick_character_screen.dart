import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kidtopia/kidtopia/resources.dart';
import 'package:kidtopia/components/bottom_sheet_clipper.dart';
import 'package:kidtopia/components/character_card.dart';

class PickCharacterScreen extends StatelessWidget {
  const PickCharacterScreen({super.key});

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

                  SizedBox(height: 20),

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
            top: MediaQuery.of(context).size.height * 0.3 + 8,
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
                height: MediaQuery.of(context).size.height * 0.7,
                color: Colors.white,
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
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
                                color: const Color.fromARGB(255, 13, 136, 236),
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 120),

                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          clipBehavior: Clip.none,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width / 2 - 100,
                              ),
                              CharacterCard(
                                assetPath: Assets.c3,
                                gradientColors: [
                                  Colors.blueAccent,
                                  Colors.blue.shade700,
                                ],
                                borderColor: Colors.blue,
                              ),
                              SizedBox(width: 20),
                              CharacterCard(
                                assetPath: Assets.c2,
                                gradientColors: [
                                  Colors.orangeAccent,
                                  Colors.deepOrangeAccent,
                                ],
                                borderColor: Colors.orange,
                              ),
                              SizedBox(width: 20),
                              CharacterCard(
                                assetPath: Assets.c5,
                                gradientColors: [
                                  Colors.brown,
                                  Colors.brown.shade700,
                                ],
                                borderColor: Colors.brown,
                              ),
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width / 2 - 100,
                              ),
                            ],
                          ),
                        ),
                      ],
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
}
