import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imtihon/utils/extension/extension.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class GlobalZoomTapButton extends StatefulWidget {
  final VoidCallback onPressed;
  final Widget widget;

  const GlobalZoomTapButton({
    super.key,
    required this.onPressed,
    required this.widget,
  });

  @override
  _GlobalZoomTapButtonState createState() => _GlobalZoomTapButtonState();
}

class _GlobalZoomTapButtonState extends State<GlobalZoomTapButton> {
  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: widget.onPressed,
      child: SizedBox(
        height: 60.h,
        width: double.infinity,
        child: Card(
          color: Colors.blue,
          child: Center(
            child: widget.widget,
          ),
        ),
      ),
    );
  }
}
