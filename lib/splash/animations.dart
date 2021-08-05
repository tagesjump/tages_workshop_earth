// import 'package:flutter/material.dart';
//
// /// Move logo to center.
// /// 0.085 -> 0.149
// Animation<double> startLogoAlignment(Animation<double> controller) {
//   return Tween<double>(begin: 0.9, end: 0.0).animate(
//     CurvedAnimation(
//       parent: controller,
//       curve: const Interval(0.085, 0.149, curve: Curves.easeInBack),
//     ),
//   );
// }
//
// /// Transform square logo to circle.
// /// 0.149 -> 0.319
// Animation<BorderRadius> startLogoRadius(Animation<double> controller) {
//   return BorderRadiusTween(begin: BorderRadius.circular(4.0), end: BorderRadius.circular(260.0)).animate(
//     CurvedAnimation(
//       parent: controller,
//       curve: const Interval(0.149, 0.319, curve: Curves.easeIn),
//     ),
//   );
// }
//
// /// Scale logo to normal state.
// /// 0.149 -> 0.319
// Animation<double> startLogoSize(Animation<double> controller) {
//   return Tween<double>(begin: 20.0, end: 200.0).animate(
//     CurvedAnimation(
//       parent: controller,
//       curve: const Interval(0.149, 0.319, curve: Curves.ease),
//     ),
//   );
// }
//
// /// Show brand.
// /// 0.149 -> 0.319
// Animation<double> startBrandScale(Animation<double> controller) {
//   return Tween<double>(begin: 0.0, end: 1.0).animate(
//     CurvedAnimation(
//       parent: controller,
//       curve: const Interval(0.149, 0.319, curve: Curves.easeInOutBack),
//     ),
//   );
// }
//
// /// Transform square logo to circle.
// /// 0.649 -> 0.796
// Animation<BorderRadius> endLogoRadius(Animation<double> controller) {
//   return BorderRadiusTween(begin: BorderRadius.circular(260.0), end: BorderRadius.circular(0.0)).animate(
//     CurvedAnimation(
//       parent: controller,
//       curve: const Interval(0.649, 0.796, curve: Curves.easeInBack),
//     ),
//   );
// }
//
// /// Scale logo to normal state.
// /// 0.649 -> 0.796
// Animation<double> endLogoSize(Animation<double> controller) {
//   return Tween<double>(begin: 200.0, end: 1000.0).animate(
//     CurvedAnimation(
//       parent: controller,
//       curve: const Interval(0.649, 0.796, curve: Curves.easeInBack),
//     ),
//   );
// }
//
// /// Hide logo
// /// 0.875 -> 1.0
// Animation<double> logoOpacity(Animation<double> controller) {
//   return Tween<double>(begin: 1.0, end: 0.5).animate(
//     CurvedAnimation(
//       parent: controller,
//       curve: const Interval(0.875, 1.000, curve: Curves.ease),
//     ),
//   );
// }
