import 'dart:typed_data';
import 'dart:ui';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'common/corner_interface_position.dart';

class ImagePanelBuilder extends StatefulWidget {
  final double width;
  final double height;
  final double borderWidth;
  final double slicingSize;
  final double cuttingSize;
  final double innerSize;
  final Color borderColor;
  final List<int> elements;
  final Widget? child;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final Color backgroundColor;
  const ImagePanelBuilder({
    Key? key,
    this.width = 200,
    this.height = 200,
    this.borderWidth = 8,
    this.slicingSize = 20,
    this.cuttingSize = 10,
    this.borderColor = Colors.white,
    required this.elements,
    required this.child,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    this.backgroundColor = Colors.black,
    this.innerSize = 4,
  }) : super(key: key);
  @override
  State<ImagePanelBuilder> createState() => _ImagePanelBuilderState();
}

class _ImagePanelBuilderState extends State<ImagePanelBuilder> {
  ui.Image? _image;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  Future<void> _loadImage() async {
    final Uint8List bytes = Uint8List.fromList(widget.elements);
    final ui.Codec codec = await ui.instantiateImageCodec(bytes);
    final ui.FrameInfo fi = await codec.getNextFrame();
    setState(() {
      _image = fi.image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.backgroundColor,
      width: widget.width,
      height: widget.height,
      margin: widget.margin,
      child: CustomPaint(
        size: Size(widget.width, widget.height),
        painter: BorderCreaterPainter(
          image: _image,
          slicingSize: widget.slicingSize,
          borderColor: widget.borderColor,
          cuttingSize: widget.cuttingSize,
          innerSize: widget.innerSize,
        ),
        child: Padding(
          padding: widget.padding,
          child: widget.child,
        ),
      ),
    );
  }
}

class BorderCreaterPainter extends CustomPainter {
  final ui.Image? image;
  final double slicingSize;
  final double cuttingSize;
  final Color borderColor;
  final double innerSize;
  BorderCreaterPainter({
    required this.image,
    this.slicingSize = 2,
    this.cuttingSize = 4,
    this.innerSize = 8,
    required this.borderColor,
  });
  @override
  void paint(Canvas canvas, Size size) {
    if (image == null) return;

    // 绘制背景层
    final backgroundPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = borderColor.withValues(alpha: 0.3);

    final path = Path()
      ..moveTo(innerSize + cuttingSize, 0 + innerSize)
      ..lineTo(size.width - innerSize - cuttingSize, 0 + innerSize)
      ..lineTo(size.width - cuttingSize - innerSize, cuttingSize + innerSize)
      ..lineTo(size.width - innerSize, cuttingSize + innerSize)
      ..lineTo(size.width - innerSize, size.height - cuttingSize - innerSize)
      ..lineTo(size.width - cuttingSize - innerSize,
          size.height - cuttingSize - innerSize)
      ..lineTo(size.width - cuttingSize - innerSize, size.height - innerSize)
      ..lineTo(cuttingSize + innerSize, size.height - innerSize)
      ..lineTo(cuttingSize + innerSize, size.height - cuttingSize - innerSize)
      ..lineTo(0 + innerSize, size.height - cuttingSize - innerSize)
      ..lineTo(0 + innerSize, cuttingSize + innerSize)
      ..lineTo(cuttingSize + innerSize, cuttingSize + innerSize)
      ..close();

    canvas.drawPath(path, backgroundPaint);

    // 绘制边框
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..colorFilter = ColorFilter.mode(borderColor, BlendMode.srcATop);

    final sourceRect = Rect.fromLTRB(slicingSize, slicingSize,
        image!.width - slicingSize, image!.height - slicingSize);

    final destRect = Rect.fromLTWH(0, 0, size.width, size.height);

    canvas.drawImageNine(image!, sourceRect, destRect, paint);
  }

  @override
  bool shouldRepaint(covariant BorderCreaterPainter oldDelegate) {
    return image != oldDelegate.image ||
        slicingSize != oldDelegate.slicingSize ||
        cuttingSize != oldDelegate.cuttingSize ||
        borderColor != oldDelegate.borderColor;
  }
}
