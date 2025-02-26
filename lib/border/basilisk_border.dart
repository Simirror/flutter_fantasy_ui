import 'package:flutter/material.dart';
import 'package:flutter_fantasy_ui/image_border.dart';

import '../assets.dart';

// ignore: must_be_immutable
class BasiliskBorder extends ImageBorderBuilder {
  BasiliskBorder({
    super.key,
    super.width,
    super.height,
    super.borderWidth = 5,
    super.slicingSize,
    super.borderColor,
    this.child,
  }) : super(elements: border_panel_border_012, child: child);
  Widget? child;
}
