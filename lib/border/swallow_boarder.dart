import 'package:flutter/material.dart';
import 'package:flutter_fantasy_ui/border/image_border.dart';

import '../assets.dart';

// ignore: must_be_immutable
class SwallowBorder extends ImageBorderBuilder {
  SwallowBorder({
    super.key,
    super.width = 200,
    super.height = 200,
    super.borderWidth = 2,
    super.slicingSize = 18,
    super.borderColor = Colors.black,
    this.child,
    //super.cornerInterfacePosition = CornerInterfacePosition.center,
  }) : super(elements: border_panel_border_003, child: child);
  Widget? child;
}
