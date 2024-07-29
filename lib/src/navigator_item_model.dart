import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class NavigatorItemModel extends StatelessWidget {
  NavigatorItemModel({
    Key? key,
    required this.title,
    this.icon,
    this.iconColor,
    this.iconActiveColor,
    this.titleStyle,
    this.isActive = false,
    this.padding,
    this.width,
  }) : super(key: key);
  final String title;
  final TextStyle? titleStyle;
  final IconData? icon;
  final Color? iconColor;
  final Color? iconActiveColor;
  final bool isActive;
  final EdgeInsetsGeometry? padding;
  final double? width;

  final autoSizeGroup = AutoSizeGroup();

  NavigatorItemModel copyWith({
    String? title,
    TextStyle? titleStyle,
    IconData? icon,
    Color? iconColor,
    Color? iconActiveColor,
    bool? isActive,
    EdgeInsetsGeometry? padding,
    double? width,
  }) =>
      NavigatorItemModel(
        title: title ?? this.title,
        titleStyle: titleStyle ?? this.titleStyle,
        icon: icon ?? this.icon,
        iconColor: iconColor ?? this.iconColor,
        iconActiveColor: iconActiveColor ?? this.iconActiveColor,
        isActive: isActive ?? this.isActive,
        padding: padding ?? this.padding,
        width: width ?? this.width,
      );

  @override
  Widget build(BuildContext context) {
    final color = isActive ? iconActiveColor : iconColor;
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(
            icon,
            size: 24,
            color: color,
          ),
          const SizedBox(height: 4),
          Container(
            // padding: padding ?? const EdgeInsets.symmetric(horizontal: 0),
            width: width ?? 65,
            child: Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 1,
              style:
                  titleStyle?.copyWith(color: color) ?? TextStyle(color: color),
              // group: autoSizeGroup,
            ),
          )
        ],
      ),
    );
  }
}
