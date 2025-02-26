import 'package:flutter/material.dart';
import 'package:flutter_fantasy_ui/image_border.dart';

import '../assets.dart';

// ignore: must_be_immutable
class SirenBorder extends ImageBorderBuilder {
  SirenBorder({
    super.key,
    super.width,
    super.height,
    super.borderWidth = 2,
    super.slicingSize,
    super.borderColor,
    this.child,
  }) : super(elements: border_panel_border_021, child: child);
  Widget? child;
}
