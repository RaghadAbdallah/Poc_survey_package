import 'package:flutter/material.dart';

class CustomThumbShape extends SliderComponentShape {
  final double thumbRadius;
  final Color thumbColor;
  final Color textColor;
  final TextStyle textStyle;
  final Color borderColor;
  final double borderWidth;

  CustomThumbShape({
    required this.thumbRadius,
    required this.thumbColor,
    required this.textColor,
    required this.textStyle,
    required this.borderColor,
    required this.borderWidth,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
      PaintingContext context,
      Offset center, {
        required Animation<double> activationAnimation,
        required Animation<double> enableAnimation,
        required bool isDiscrete,
        required TextPainter labelPainter,
        required RenderBox parentBox,
        required Size sizeWithOverflow,
        required SliderThemeData sliderTheme,
        required TextDirection textDirection,
        required double textScaleFactor,
        required double value,
      }) {
    final Paint thumbPaint = Paint()..color = thumbColor;
    final Paint borderPaint = Paint()
      ..color = borderColor
      ..strokeWidth = borderWidth
      ..style = PaintingStyle.stroke;

    context.canvas.drawCircle(center, thumbRadius, thumbPaint);
    context.canvas.drawCircle(center, thumbRadius, borderPaint);

    labelPainter.text = TextSpan(
      text: value.toString(),
      style: textStyle.copyWith(color: textColor,fontSize: 11),
    );
    labelPainter.layout();
    labelPainter.paint(context.canvas, center - Offset(labelPainter.width / 2, labelPainter.height / 2));
  }
}
