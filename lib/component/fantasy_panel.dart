import 'package:flutter/material.dart';

class FantasyPanel extends StatelessWidget {
  final Widget? child;
  final double width;
  final double height;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Color backgroundColor;
  final Color borderColor;

  const FantasyPanel({
    Key? key,
    this.child,
    this.width = 300,
    this.height = 200,
    this.padding = const EdgeInsets.all(16),
    this.margin = EdgeInsets.zero,
    this.backgroundColor = const Color(0xFF1A1A1A),
    this.borderColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: borderColor, width: 2),
        borderRadius: BorderRadius.circular(4),
      ),
      child: CustomPaint(
        painter: FantasyBorderPainter(borderColor: borderColor),
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}

class FantasyBorderPainter extends CustomPainter {
  final Color borderColor;

  FantasyBorderPainter({required this.borderColor});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // 绘制四个角的装饰
    const cornerSize = 20.0;
    
    // 左上角
    canvas.drawPath(
      Path()
        ..moveTo(0, cornerSize)
        ..lineTo(0, 0)
        ..lineTo(cornerSize, 0),
      paint,
    );

    // 右上角
    canvas.drawPath(
      Path()
        ..moveTo(size.width - cornerSize, 0)
        ..lineTo(size.width, 0)
        ..lineTo(size.width, cornerSize),
      paint,
    );

    // 左下角
    canvas.drawPath(
      Path()
        ..moveTo(0, size.height - cornerSize)
        ..lineTo(0, size.height)
        ..lineTo(cornerSize, size.height),
      paint,
    );

    // 右下角
    canvas.drawPath(
      Path()
        ..moveTo(size.width - cornerSize, size.height)
        ..lineTo(size.width, size.height)
        ..lineTo(size.width, size.height - cornerSize),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant FantasyBorderPainter oldDelegate) {
    return borderColor != oldDelegate.borderColor;
  }
}