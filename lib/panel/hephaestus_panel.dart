import 'package:flutter/material.dart';
import 'package:flutter_fantasy_ui/image_panel.dart';

import '../assets.dart';

// ignore: must_be_immutable
class HephaestusPanel extends ImagePanelBuilder {
  HephaestusPanel({
    super.key,
    super.width,
    super.height,
    super.borderWidth = 2,
    super.slicingSize,
    super.borderColor,
    super.margin,
    super.padding,
    this.child,
  }) : super(elements: border_panel_border_012, child: child);
  Widget? child;
}
