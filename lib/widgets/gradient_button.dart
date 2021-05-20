import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final LinearGradient gradient;
  final Widget child;
  final double height;
  final double width;
  final double padding;
  final double margin;
  final Function onPressed;
  final BorderRadius borderRadius;

  const GradientButton({
    this.gradient,
    this.borderRadius,
    this.child,
    this.height,
    this.width,
    this.padding,
    this.margin,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(gradient: gradient, borderRadius: borderRadius, boxShadow: [
        BoxShadow(
          blurRadius: 10,
          color: Color(0xFF31A4C8).withOpacity(0.22),
          offset: Offset(0, 4),
        )
      ]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}
