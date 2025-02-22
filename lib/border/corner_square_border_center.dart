import 'package:flutter/material.dart';

class CornerSquareBorderCenter extends StatelessWidget {
  final double width;
  final double height;
  final double borderWidth;
  final double squareSize;
  final Color borderColor;

  const CornerSquareBorderCenter({
    Key? key,
    this.width = 200,
    this.height = 200,
    this.borderWidth = 4,
    this.squareSize = 4,
    this.borderColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, height),
      painter: CornerSquareBorderCenterPainter(
        borderWidth: borderWidth,
        squareSize: squareSize,
        borderColor: borderColor,
      ),
    );
  }
}

class CornerSquareBorderCenterPainter extends CustomPainter {
  final double borderWidth;
  final double squareSize;
  final Color borderColor;

  CornerSquareBorderCenterPainter({
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
      Offset(squareSize, squareSize / 2),
      Offset(size.width - squareSize, squareSize / 2),
      paint,
    );
    // 右边
    canvas.drawLine(
      Offset(size.width - squareSize / 2, squareSize),
      Offset(size.width - squareSize / 2, size.height - squareSize),
      paint,
    );
    // 下边
    canvas.drawLine(
      Offset(squareSize, size.height - squareSize / 2),
      Offset(size.width - squareSize, size.height - squareSize / 2),
      paint,
    );
    // 左边
    canvas.drawLine(
      Offset(squareSize / 2, squareSize),
      Offset(squareSize / 2, size.height - squareSize),
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
