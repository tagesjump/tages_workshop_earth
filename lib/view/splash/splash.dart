import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart' hide Svg;
import 'package:tages_workshop_earth/view/theme.dart';

class Splash extends StatelessWidget {
  final logoSize = 250.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          children: [
            Align(
              child: Container(
                width: logoSize,
                height: logoSize,
                decoration: BoxDecoration(
                  color: logoBackgroundColor,
                  borderRadius: BorderRadius.circular(logoSize),
                  border: Border.all(width: 10.0, color: logoBorderColor),
                  image: const DecorationImage(
                    image: AssetImage(earthPngPath),
                    fit: BoxFit.cover,
                  ),
                ),
                child: const SizedBox(),
              ),
            ),
            Align(
              alignment: const Alignment(0.0, .9),
              child: SvgPicture.asset(branchSvgPath),
            ),
          ],
        ),
      ),
    );
  }
}
