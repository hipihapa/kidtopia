import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kidtopia/kidtopia/resources.dart';
import 'package:kidtopia/components/blob_container.dart';
import 'package:kidtopia/screens/pick_character_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
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
                    Image.asset(Assets.c1),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 30,
                        left: 40.0,
                        right: 40.0,
                      ),
                      child: SizedBox(
                        child: Column(
                          children: [
                            Stack(
                              clipBehavior: Clip.none,
                              alignment: Alignment.bottomCenter,
                              children: [
                                BlobContainer(
                                  width: double.infinity,
                                  height: 210,
                                  color: Colors.grey.withValues(alpha: 0.4),
                                  border: Border.all(color: Colors.grey),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 22.0),
                                    child: Column(
                                      children: [
                                        HeaderTitle(text: "Kids Dive Into"),

                                        HeaderTitle(text: "Kidtopia Magic"),

                                        SizedBox(height: 6),

                                        SubTitle(text: "Safe and Imaginative"),
                                        SubTitle(
                                          text: "metaverse experience designed",
                                        ),
                                        SubTitle(text: "just for kids!"),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: -18,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              PickCharacterScreen(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.chevron_right,
                                        color: Colors.blue,
                                        size: 40,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
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
        ],
      ),
    );
  }
}

class HeaderTitle extends StatelessWidget {
  final String text;
  const HeaderTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.yesevaOne(
        fontSize: 24,
        fontWeight: FontWeight.w800,
        color: Colors.white,
      ),
    );
  }
}

class SubTitle extends StatelessWidget {
  final String text;
  const SubTitle({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Colors.grey[400],
      ),
    );
  }
}
