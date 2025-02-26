import 'package:flutter/material.dart';

class FantasyButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final double width;
  final double height;
  final EdgeInsets margin;
  final Color backgroundColor;
  final Color borderColor;
  final double borderWidth;

  const FantasyButton({
    Key? key,
    required this.child,
    this.onPressed,
    this.width = 200,
    this.height = 50,
    this.margin = EdgeInsets.zero,
    this.backgroundColor = const Color(0xFF1A1A1A),
    this.borderColor = Colors.white,
    this.borderWidth = 2,
  }) : super(key: key);

  @override
  State<FantasyButton> createState() => _FantasyButtonState();
}

class _FantasyButtonState extends State<FantasyButton> {
  bool _isHovered = false;
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onPressed?.call();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: Container(
          width: widget.width,
          height: widget.height,
          margin: widget.margin,
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            border: Border.all(
              color: widget.borderColor.withOpacity(_isHovered ? 1 : 0.8),
              width: widget.borderWidth,
            ),
          ),
          child: CustomPaint(
            painter: FantasyButtonPainter(
              borderColor: widget.borderColor.withOpacity(_isHovered ? 1 : 0.8),
              isPressed: _isPressed,
            ),
            child: Center(
              child: DefaultTextStyle(
                style: TextStyle(
                  color: widget.borderColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                child: widget.child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FantasyButtonPainter extends CustomPainter {
  final Color borderColor;
  final bool isPressed;

  FantasyButtonPainter({
    required this.borderColor,
    required this.isPressed,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    const cornerSize = 12.0;
    final offset = isPressed ? 1.0 : 0.0;

    // 左上角装饰
    canvas.drawPath(
      Path()
        ..moveTo(cornerSize + offset, offset)
        ..lineTo(offset, offset)
        ..lineTo(offset, cornerSize + offset),
      paint,
    );

    // 右上角装饰
    canvas.drawPath(
      Path()
        ..moveTo(size.width - cornerSize - offset, offset)
        ..lineTo(size.width - offset, offset)
        ..lineTo(size.width - offset, cornerSize + offset),
      paint,
    );

    // 左下角装饰
    canvas.drawPath(
      Path()
        ..moveTo(offset, size.height - cornerSize - offset)
        ..lineTo(offset, size.height - offset)
        ..lineTo(cornerSize + offset, size.height - offset),
      paint,
    );

    // 右下角装饰
    canvas.drawPath(
      Path()
        ..moveTo(size.width - cornerSize - offset, size.height - offset)
        ..lineTo(size.width - offset, size.height - offset)
        ..lineTo(size.width - offset, size.height - cornerSize - offset),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant FantasyButtonPainter oldDelegate) {
    return borderColor != oldDelegate.borderColor ||
        isPressed != oldDelegate.isPressed;
  }
}