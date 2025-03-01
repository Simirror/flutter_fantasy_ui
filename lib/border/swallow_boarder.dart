import 'package:flutter/material.dart';
import 'package:flutter_fantasy_ui/image_border.dart';

import '../assets.dart';

// ignore: must_be_immutable
class SwallowBorder extends ImageBorderBuilder {
  SwallowBorder({
    super.key,
    super.width,
    super.height,
    super.borderWidth = 2,
    super.slicingSize,
    super.borderColor,
    super.margin = EdgeInsets.zero,
    super.padding = EdgeInsets.zero,
    this.child,
    //super.cornerInterfacePosition = CornerInterfacePosition.center,
  }) : super(elements: border_panel_border_000, child: child);
  Widget? child;
}
