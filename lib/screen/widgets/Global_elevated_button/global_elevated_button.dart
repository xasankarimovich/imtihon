import 'package:flutter/material.dart';
import 'package:imtihon/utils/color/app_color.dart';
import 'package:imtihon/utils/extension/extension.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class GlobalZoomTapButton extends StatelessWidget {
  const GlobalZoomTapButton(
      {super.key, required Null Function() onPressed, required Widget child});

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      child: SizedBox(
        height: 50.h,
        width: double.infinity,
        child: Card(
          child: Center(),
          color: AppColors.c3287FF,
        ),
      ),
    );
  }
}









// import 'package:flutter/material.dart';
//
// class GlobalZoomTapButton extends StatelessWidget {
//   const GlobalZoomTapButton({
//     Key? key,
//     required this.title,
//     required this.onTap,
//     required this.color,
//     this.withBorder = false,
//     required this.height,
//     required this.width,
//     required this.child,
//     required this.decoration,
//   }) : super(key: key);
//
//   final String? title;
//   final Color? color;
//   final VoidCallback? onTap;
//   final bool withBorder;
//   final int height;
//   final double width;
//   final Material child;
//   final BoxDecoration decoration;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: height.toDouble(),
//       width: width,
//       decoration: decoration,
//       child: Material(
//         color: Colors.transparent,
//         child: InkWell(
//           borderRadius: BorderRadius.circular(16),
//           onTap: onTap,
//           child: Center(
//             child: Text(
//               title ?? '',
//               style: const TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
