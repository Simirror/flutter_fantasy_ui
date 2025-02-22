import 'package:flutter/material.dart';

import '../common/corner_interface_position.dart';

class BorderCreater extends StatelessWidget {
  final double width;
  final double height;
  final double borderWidth;
  final double shapeSize;
  final Color borderColor;
  final CornerInterfacePosition cornerInterfacePosition;

  const BorderCreater({
    Key? key,
    this.width = 200,
    this.height = 200,
    this.borderWidth = 2,
    this.shapeSize = 20,
    this.borderColor = Colors.black,
    this.cornerInterfacePosition = CornerInterfacePosition.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, height),
      painter: BorderCreaterPainter(
        borderWidth: borderWidth,
        shapeSize: shapeSize,
        borderColor: borderColor,
        cornerInterfacePosition: cornerInterfacePosition,
      ),
    );
  }
}

class BorderCreaterPainter extends CustomPainter {
  final double borderWidth;
  final double shapeSize;
  final Color borderColor;
  final CornerInterfacePosition cornerInterfacePosition;
  BorderCreaterPainter({
    required this.borderWidth,
    required this.shapeSize,
    required this.borderColor,
    required this.cornerInterfacePosition,
  });

  @override
  void paint(Canvas canvas, Size size) {
    drawBorder(canvas, size);

    drawShape(canvas, size);
    // // 绘制四个角的空心正方形
    // // 左上角
    // canvas.drawRect(
    //   Rect.fromLTWH(0, 0, squareSize, squareSize),
    //   paint,
    // );

    // canvas.drawAtlas(atlas, transforms, rects, colors, blendMode, cullRect, paint)
    // // 右上角
    // canvas.drawRect(
    //   Rect.fromLTWH(size.width - squareSize, 0, squareSize, squareSize),
    //   paint,
    // );
    // // 右下角
    // canvas.drawRect(
    //   Rect.fromLTWH(
    //     size.width - squareSize,
    //     size.height - squareSize,
    //     squareSize,
    //     squareSize,
    //   ),
    //   paint,
    // );
    // // 左下角
    // canvas.drawRect(
    //   Rect.fromLTWH(0, size.height - squareSize, squareSize, squareSize),
    //   paint,
    // );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  void drawBorder(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;
    // 绘制四条边
    final double interfaceSize =
        cornerInterfacePosition == CornerInterfacePosition.inner
            ? shapeSize
            : cornerInterfacePosition == CornerInterfacePosition.center
                ? shapeSize / 2
                : 0;
    ;

    // 上边
    canvas.drawLine(
      Offset(shapeSize, interfaceSize),
      Offset(size.width - shapeSize, interfaceSize),
      paint,
    );
    // 右边
    canvas.drawLine(
      Offset(size.width - interfaceSize, shapeSize),
      Offset(size.width - interfaceSize, size.height - shapeSize),
      paint,
    );
    // 下边
    canvas.drawLine(
      Offset(shapeSize, size.height - interfaceSize),
      Offset(size.width - shapeSize, size.height - interfaceSize),
      paint,
    );
    // 左边
    canvas.drawLine(
      Offset(interfaceSize, shapeSize),
      Offset(interfaceSize, size.height - shapeSize),
      paint,
    );
  }

  void drawShape(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    // 在左上角绘制一个形状
    canvas.drawRect(
      Rect.fromLTWH(0, 0, shapeSize, shapeSize),
      paint,
    );

    // 在其他三个角分别旋转绘制三个
    // 右上角
    canvas.save();
    canvas.rotate(-90 * 3.1415926535897932 / 180);

    canvas.restore();
    // 右下角
    canvas.save();
    canvas.rotate(-180 * 3.1415926535897932 / 180);

    canvas.restore();
    // 左下角
    canvas.save();
    canvas.rotate(-270 * 3.1415926535897932 / 180);
    canvas.restore();
  }
}
