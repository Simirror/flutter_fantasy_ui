import 'package:flutter/material.dart';
import 'package:flutter_fantasy_ui/image_border.dart';

import '../assets.dart';

// ignore: must_be_immutable
class AtlasBorder extends ImageBorderBuilder {
  AtlasBorder({
    super.key,
    super.width = 200,
    super.height = 200,
    super.borderWidth,
    super.slicingSize,
    super.borderColor,
    this.child,
  }) : super(elements: border_panel_border_015, child: child);
  Widget? child;
}
