import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/src/bubble_selection_painter.dart';
import 'package:animated_bottom_navigation_bar/src/tab_item.dart';

class NavigationBarItem extends StatelessWidget {
  final bool isActive;
  final double bubbleRadius;
  final double maxBubbleRadius;
  final Color? bubbleColor;
  final Color? activeColor;
  final Color? inactiveColor;
  final IconData? iconData;
  final double iconScale;
  final double? iconSize;
  final VoidCallback onTap;
  final Widget? child;
  final double? height;

  NavigationBarItem({
    required this.isActive,
    required this.bubbleRadius,
    required this.maxBubbleRadius,
    required this.bubbleColor,
    required this.activeColor,
    required this.inactiveColor,
    required this.iconData,
    required this.iconScale,
    required this.iconSize,
    required this.onTap,
    this.child,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: (height ?? 0) * 0.19),
      child: CustomPaint(
        painter: BubblePainter(
          bubbleRadius: isActive ? bubbleRadius : 0,
          bubbleColor: bubbleColor,
          maxBubbleRadius: maxBubbleRadius,
        ),
        child: InkWell(
          child: Transform.scale(
            scale: isActive ? iconScale : 1,
            child: TabItem(
              isActive: isActive,
              iconData: iconData,
              iconSize: iconSize,
              activeColor: activeColor,
              inactiveColor: inactiveColor,
              child: child,
            ),
          ),
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          onTap: onTap,
        ),
      ),
    );
  }
}
