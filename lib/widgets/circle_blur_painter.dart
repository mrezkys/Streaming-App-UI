import 'package:flutter/material.dart';

class CircleBlurPainter extends CustomPainter {
  CircleBlurPainter({@required this.circleWidth, @required this.circleHeight, this.blurSigma});

  double circleWidth;
  double circleHeight;
  double blurSigma;

  @override
  void paint(Canvas canvas, Size size) {
    Paint line = new Paint()
      ..color = Color(0xFF31A4C8).withOpacity(0.6)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = circleWidth
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, blurSigma);
    canvas.drawOval(Rect.fromLTWH(7, 0, circleWidth, circleHeight), line);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class BlurWidget extends StatelessWidget {
  double width;
  double height;
  double blur;

  BlurWidget({@required this.width, @required this.height, @required this.blur});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(foregroundPainter: CircleBlurPainter(circleWidth: width, circleHeight: height, blurSigma: blur));
  }
}
