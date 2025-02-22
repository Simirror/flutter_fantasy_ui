import 'dart:typed_data';
import 'dart:ui';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../common/corner_interface_position.dart';

class ImageBorderBuilder extends StatefulWidget {
  final double width;
  final double height;
  final double borderWidth;
  final double slicingSize;
  final Color borderColor;
  final List<int> elements;
  final Widget? child;
  const ImageBorderBuilder({
    Key? key,
    this.width = 48,
    this.height = 48,
    this.borderWidth = 8,
    this.slicingSize = 8,
    this.borderColor = Colors.black,
    required this.elements,
    required this.child,
  }) : super(key: key);
  @override
  State<ImageBorderBuilder> createState() => _ImageBorderBuilderState();
}

class _ImageBorderBuilderState extends State<ImageBorderBuilder> {
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
    return CustomPaint(
      size: Size(widget.width, widget.height),
      painter: BorderCreaterPainter(
        image: _image,
        slicingSize: widget.slicingSize,
      ),
      child: widget.child,
    );
  }
}

class BorderCreaterPainter extends CustomPainter {
  final ui.Image? image;
  final double slicingSize;

  BorderCreaterPainter({
    required this.image,
    this.slicingSize = 2,
  });
  @override
  void paint(Canvas canvas, Size size) {
    if (image == null) return;
  
    final paint = Paint()..style = PaintingStyle.fill;
    
    // 定义九宫格切割区域，确保四个角的尺寸固定
    final sourceRect = Rect.fromLTRB(
      slicingSize,
      slicingSize,
      image!.width - slicingSize,
      image!.height - slicingSize
    );
    
    // 定义目标区域，保持整体比例
    final destRect = Rect.fromLTWH(0, 0, size.width, size.height);
    
    canvas.drawImageNine(image!, sourceRect, destRect, paint);
  }
  @override
  bool shouldRepaint(covariant BorderCreaterPainter oldDelegate) {
    return image != oldDelegate.image || slicingSize != oldDelegate.slicingSize;
  }
}
