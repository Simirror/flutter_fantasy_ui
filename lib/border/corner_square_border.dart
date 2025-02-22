import 'package:flutter/material.dart';

class CornerSquareBorder extends StatelessWidget {
  final double width;
  final double height;
  final double borderWidth;
  final double squareSize;
  final Color borderColor;

  const CornerSquareBorder({
    Key? key,
    this.width = 200,
    this.height = 200,
    this.borderWidth = 2,
    this.squareSize = 20,
    this.borderColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, height),
      painter: CornerSquareBorderPainter(
        borderWidth: borderWidth,
        squareSize: squareSize,
        borderColor: borderColor,
      ),
    );
  }
}

class CornerSquareBorderPainter extends CustomPainter {
  final double borderWidth;
  final double squareSize;
  final Color borderColor;

  CornerSquareBorderPainter({
    required this.borderWidth,
    required this.squareSize,
    required this.borderColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    // 绘制四条边
    // 上边
    canvas.drawLine(
      Offset(squareSize, 0),
      Offset(size.width - squareSize, 0),
      paint,
    );
    // 右边
    canvas.drawLine(
      Offset(size.width, squareSize),
      Offset(size.width, size.height - squareSize),
      paint,
    );
    // 下边
    canvas.drawLine(
      Offset(squareSize, size.height),
      Offset(size.width - squareSize, size.height),
      paint,
    );
    // 左边
    canvas.drawLine(
      Offset(0, squareSize),
      Offset(0, size.height - squareSize),
      paint,
    );

    // 绘制四个角的空心正方形
    // 左上角
    canvas.drawRect(
      Rect.fromLTWH(0, 0, squareSize, squareSize),
      paint,
    );
    // 右上角
    canvas.drawRect(
      Rect.fromLTWH(size.width - squareSize, 0, squareSize, squareSize),
      paint,
    );
    // 右下角
    canvas.drawRect(
      Rect.fromLTWH(
        size.width - squareSize,
        size.height - squareSize,
        squareSize,
        squareSize,
      ),
      paint,
    );
    // 左下角
    canvas.drawRect(
      Rect.fromLTWH(0, size.height - squareSize, squareSize, squareSize),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
