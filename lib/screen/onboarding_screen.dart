import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nft_ui/widgets/images_list_view.dart';
import 'package:slide_to_act/slide_to_act.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // Get device size
    final size = MediaQuery.of(context).size;
    final isSmallDevice = size.width < 360;
    final double sidePadding = size.width * 0.06;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned.fill(
            child: ShaderMask(
              blendMode: BlendMode.dstOut,
              shaderCallback: (rect) {
                return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.transparent,
                    Colors.black.withOpacity(0.8),
                    Colors.black.withOpacity(0.9),
                    Colors.black,
                  ],
                  stops: const [0, 0.62, 0.67, 0.85, 1],
                ).createShader(rect);
              },
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: size.height * 0.03),
                    ImagesListView(startIndex: 1, duration: 25),
                    SizedBox(height: size.height * 0.01),
                    ImagesListView(startIndex: 3, duration: 45),
                    SizedBox(height: size.height * 0.01),
                    ImagesListView(startIndex: 5, duration: 65),
                    SizedBox(height: size.height * 0.01),
                    ImagesListView(startIndex: 8, duration: 30),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: size.height * 0.06,
            left: sidePadding,
            right: sidePadding,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Text(
                    "Discover NFT\nCollections",
                    style: GoogleFonts.poppins(
                      fontSize: isSmallDevice ? 30 : size.width * 0.09,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      height: 1.2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                Center(
                  child: Text(
                    "Explore the top collection of NFTs and\n buy and sell your NFTs as well.",
                    style: TextStyle(
                      fontSize: isSmallDevice ? 14 : size.width * 0.038,
                      color: Colors.black54,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Builder(
                  builder: (context) {
                    final GlobalKey<SlideActionState> key = GlobalKey();
                    return SlideAction(
                      key: key,
                      height: size.height * 0.08,
                      sliderButtonIconSize: size.width * 0.04,
                      sliderRotate: false,
                      borderRadius: 30,
                      elevation: 0,
                      innerColor: Colors.white,
                      outerColor: const Color(0xFFF4B7A8),
                      sliderButtonIcon: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                      ),
                      text: "Start Experience",
                      textStyle: GoogleFonts.poppins(
                        fontSize: isSmallDevice ? 16 : size.width * 0.05,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      onSubmit: () {
                        Future.delayed(
                          const Duration(milliseconds: 500),
                          () {},
                        );
                        return null;
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
