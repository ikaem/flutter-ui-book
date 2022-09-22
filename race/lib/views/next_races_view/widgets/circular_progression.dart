import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircularProgressPainter extends CustomPainter {
  final double progression;

  const CircularProgressPainter({
    required this.progression,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // this is the background rail
    final railPaint = Paint()
      ..color = Colors.grey.withAlpha(150)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;

    // the is the progress arc
    final arcPaint = Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;

    // this is now drawing the actual rail on canvas
    // this is center of the arc
    final center = size.width / 2;

    canvas.drawArc(
      Rect.fromCircle(
        // what is the offset
        // ok, so it might be offset from top left of the screen, pair of x,y coordiantes
        center: Offset(
          center,
          center,
        ),
        // also, radiuse is same as the offset i guess
        radius: center,
      ),
      // this is start angle - not sure why it has to be pi
      -pi / 2,
      pi * 2,
      false,
      railPaint,
    );

// dawring progression arc - this one should be on top of the previus one - but has blue color
    canvas.drawArc(
      Rect.fromCircle(
        // what is the offset
        // ok, so it might be offset from top left of the screen, pair of x,y coordiantes
        center: Offset(
          center,
          center,
        ),
        // also, radiuse is same as the offset i guess
        radius: center,
      ),
      // this is start angle - not sure why it has to be pi
      // ajd with -pi / 2, we place it at the start - in the middle of the circule
      -pi / 2,
      // not sure why * progession
      // 2pi is full circule - so 100
      // it starts from the top
      pi * 2 * progression,
      false,
      arcPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CircularProgressPainter oldDelegate) {
    return progression != oldDelegate.progression;
  }
}
