import 'package:flutter/material.dart';

class NavBarClipper extends CustomClipper<Path> {
  NavBarClipper();
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 328;
    final double _yScaling = size.height / 221;
    path.lineTo(0.5 * _xScaling, 15.9279 * _yScaling);
    path.cubicTo(
      0.5 * _xScaling,
      7.40944 * _yScaling,
      7.43746 * _xScaling,
      0.5 * _yScaling,
      16 * _xScaling,
      0.5 * _yScaling,
    );
    path.cubicTo(
      16 * _xScaling,
      0.5 * _yScaling,
      312 * _xScaling,
      0.5 * _yScaling,
      312 * _xScaling,
      0.5 * _yScaling,
    );
    path.cubicTo(
      320.563 * _xScaling,
      0.5 * _yScaling,
      327.5 * _xScaling,
      7.40945 * _yScaling,
      327.5 * _xScaling,
      15.9279 * _yScaling,
    );
    path.cubicTo(
      327.5 * _xScaling,
      15.9279 * _yScaling,
      327.5 * _xScaling,
      205.072 * _yScaling,
      327.5 * _xScaling,
      205.072 * _yScaling,
    );
    path.cubicTo(
      327.5 * _xScaling,
      213.591 * _yScaling,
      320.563 * _xScaling,
      220.5 * _yScaling,
      312 * _xScaling,
      220.5 * _yScaling,
    );
    path.cubicTo(
      312 * _xScaling,
      220.5 * _yScaling,
      191.436 * _xScaling,
      220.5 * _yScaling,
      191.436 * _xScaling,
      220.5 * _yScaling,
    );
    path.cubicTo(
      186.096 * _xScaling,
      220.5 * _yScaling,
      181.169 * _xScaling,
      218.242 * _yScaling,
      176.418 * _xScaling,
      215.546 * _yScaling,
    );
    path.cubicTo(
      173.309 * _xScaling,
      213.781 * _yScaling,
      169.478 * _xScaling,
      212.527 * _yScaling,
      164 * _xScaling,
      212.527 * _yScaling,
    );
    path.cubicTo(
      158.522 * _xScaling,
      212.527 * _yScaling,
      154.691 * _xScaling,
      213.781 * _yScaling,
      151.582 * _xScaling,
      215.546 * _yScaling,
    );
    path.cubicTo(
      146.831 * _xScaling,
      218.242 * _yScaling,
      141.904 * _xScaling,
      220.5 * _yScaling,
      136.564 * _xScaling,
      220.5 * _yScaling,
    );
    path.cubicTo(
      136.564 * _xScaling,
      220.5 * _yScaling,
      16 * _xScaling,
      220.5 * _yScaling,
      16 * _xScaling,
      220.5 * _yScaling,
    );
    path.cubicTo(
      7.43746 * _xScaling,
      220.5 * _yScaling,
      0.5 * _xScaling,
      213.591 * _yScaling,
      0.5 * _xScaling,
      205.072 * _yScaling,
    );
    path.cubicTo(
      0.5 * _xScaling,
      205.072 * _yScaling,
      0.5 * _xScaling,
      15.9279 * _yScaling,
      0.5 * _xScaling,
      15.9279 * _yScaling,
    );
    path.cubicTo(
      0.5 * _xScaling,
      15.9279 * _yScaling,
      0.5 * _xScaling,
      15.9279 * _yScaling,
      0.5 * _xScaling,
      15.9279 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
