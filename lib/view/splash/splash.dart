import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart' hide Svg;
import 'package:tages_workshop_earth/splash/animations.dart' as a;
import 'package:tages_workshop_earth/view/theme.dart';

class Splash extends StatelessWidget {
  Splash(this.controller, {Key? key})
      :
        // Start animations
        _startLogoAlignment = a.startLogoAlignment(controller),
        _startLogoSize = a.startLogoSize(controller),
        _startLogoRadius = a.startLogoRadius(controller),
        _startBrandScale = a.startBrandScale(controller),

        // End animations
        _endLogoOpacity = a.logoOpacity(controller),
        _endLogoSize = a.endLogoSize(controller),
        _endLogoRadius = a.endLogoRadius(controller),
        super(key: key);

  final AnimationController controller;
  final Animation<double> _startLogoAlignment;
  final Animation<double> _startLogoSize;
  final Animation<BorderRadius> _startLogoRadius;
  final Animation<double> _startBrandScale;

  final Animation<double> _endLogoOpacity;
  final Animation<double> _endLogoSize;
  final Animation<BorderRadius> _endLogoRadius;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        if (controller.value <= 0.5) {
          // start animation
          return _buildLogo(
            context,
            logoOpacity: 1.0,
            logoAlignment: Alignment(0.0, _startLogoAlignment.value),
            logoSize: _startLogoSize.value,
            logoRadius: _startLogoRadius.value,
            brandScale: _startBrandScale.value,
          );
        }

        // end animation
        return _buildLogo(
          context,
          logoOpacity: _endLogoOpacity.value,
          logoAlignment: Alignment.center,
          logoSize: _endLogoSize.value,
          logoRadius: _endLogoRadius.value,
          brandScale: 1.0,
        );
      },
    );
  }

  Widget _buildLogo(
    BuildContext context, {
    required double logoOpacity,
    required Alignment logoAlignment,
    required double logoSize,
    required BorderRadius logoRadius,
    required double brandScale,
  }) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Opacity(
        opacity: logoOpacity,
        child: Center(
          child: Stack(
            children: [
              Align(
                alignment: logoAlignment,
                child: Container(
                  width: logoSize,
                  height: logoSize,
                  decoration: BoxDecoration(
                    color: logoBackgroundColor,
                    borderRadius: logoRadius,
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
                child: Transform.scale(
                  scale: brandScale,
                  child: SvgPicture.asset(branchSvgPath),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
