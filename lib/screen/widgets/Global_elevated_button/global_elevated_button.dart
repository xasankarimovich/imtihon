// global_zoom_tap_button.dart

import 'package:flutter/material.dart';

class GlobalZoomTapButton extends StatelessWidget {
  const GlobalZoomTapButton({
    Key? key,
    required this.title,
    required this.onTap,
    required this.color,
    this.withBorder = false,
    required this.height,
    required this.width,
    this.child,
    required this.decoration,
  }) : super(key: key);

  final String? title;
  final Color? color;
  final VoidCallback? onTap;
  final bool withBorder;
  final int height;
  final double width;
  final Widget? child;
  final BoxDecoration decoration;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.toDouble(),
      width: width,
      decoration: decoration,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: Center(
            child: child ??
                Text(
                  title ?? '',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
