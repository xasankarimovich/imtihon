import 'package:flutter/material.dart';
import 'package:imtihon/utils/color/app_color.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class GlobalZoomTapButton extends StatelessWidget {
  const GlobalZoomTapButton(
      {super.key, required Null Function() onPressed, required Widget child});

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: Card(
          child: Center(child: Text('Login')),
          color: AppColors.c3287FF,
        ),
      ),
    );
  }
}
