import 'dart:ui';

import 'package:flutter/material.dart';

class secondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Hero(
        tag: 'blackbox',
        createRectTween: _createRectTween,
        child: Container(
          color: Colors.black,
          alignment: Alignment.center,
          child: Text(
            'Destination',
            // style: kStyle,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  static RectTween _createRectTween(Rect begin, Rect end) {
    return CircularRectTween(begin: begin, end: end);
  }
}

class CircularRectTween extends RectTween {
  CircularRectTween({Rect begin, Rect end}) : super(begin: begin, end: end) {}

  @override
  Rect lerp(double t) {
    final double width = lerpDouble(begin.width, end.width, t);
    double startWidthCenter = begin.left + (begin.width / 2);
    double startHeightCenter = begin.top + (begin.height / 2);

    return Rect.fromCircle(
        center: Offset(startWidthCenter, startHeightCenter),
        radius: width * 1.7);
  }
}
