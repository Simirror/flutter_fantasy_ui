import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_fantasy_ui/fantasy_ui.dart';

class BorderDemo extends StatelessWidget {
  const BorderDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('边框演示')),
      body: Center(child: CrossBorderWidget()),
    );
  }
}

class CrossBorderWidget extends StatefulWidget {
  @override
  State<CrossBorderWidget> createState() => _CrossBorderWidgetState();
}

class _CrossBorderWidgetState extends State<CrossBorderWidget> {
  double width = 200;
  double height = 200;
  double padding = 0;
  double margin = 0;
  Color borderColor = Colors.blue;
  Color backgroundColor = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: width,
          height: height,
          color: backgroundColor,
          child: SwallowBorder(
            width: width,
            height: height,
            padding: EdgeInsets.all(padding),
            margin: EdgeInsets.all(margin),
            borderColor: borderColor,
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                children: [
                  const Text('宽度: '),
                  Expanded(
                    child: Slider(
                      value: width,
                      min: 100,
                      max: 400,
                      onChanged: (value) {
                        setState(() {
                          width = value;
                        });
                      },
                    ),
                  ),
                  Text('${width.toStringAsFixed(0)}'),
                ],
              ),
              Row(
                children: [
                  const Text('高度: '),
                  Expanded(
                    child: Slider(
                      value: height,
                      min: 100,
                      max: 400,
                      onChanged: (value) {
                        setState(() {
                          height = value;
                        });
                      },
                    ),
                  ),
                  Text('${height.toStringAsFixed(0)}'),
                ],
              ),
              Row(
                children: [
                  const Text('内边距: '),
                  Expanded(
                    child: Slider(
                      value: padding,
                      min: 0,
                      max: 50,
                      onChanged: (value) {
                        setState(() {
                          padding = value;
                        });
                      },
                    ),
                  ),
                  Text('${padding.toStringAsFixed(0)}'),
                ],
              ),
              Row(
                children: [
                  const Text('外边距: '),
                  Expanded(
                    child: Slider(
                      value: margin,
                      min: 0,
                      max: 50,
                      onChanged: (value) {
                        setState(() {
                          margin = value;
                        });
                      },
                    ),
                  ),
                  Text('${margin.toStringAsFixed(0)}'),
                ],
              ),
              Row(
                children: [
                  const Text('边框颜色: '),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder:
                              (context) => AlertDialog(
                                title: const Text('选择颜色'),
                                content: SingleChildScrollView(
                                  child: ColorPicker(
                                    pickerColor: borderColor,
                                    onColorChanged: (color) {
                                      setState(() {
                                        borderColor = color;
                                      });
                                    },
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed:
                                        () => Navigator.of(context).pop(),
                                    child: const Text('确定'),
                                  ),
                                ],
                              ),
                        );
                      },
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                          color: borderColor,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text('背景颜色: '),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder:
                              (context) => AlertDialog(
                                title: const Text('选择颜色'),
                                content: SingleChildScrollView(
                                  child: ColorPicker(
                                    pickerColor: backgroundColor,
                                    onColorChanged: (color) {
                                      setState(() {
                                        backgroundColor = color;
                                      });
                                    },
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed:
                                        () => Navigator.of(context).pop(),
                                    child: const Text('确定'),
                                  ),
                                ],
                              ),
                        );
                      },
                      child: Container(
                        height: 30,
                        width: 200,
                        decoration: BoxDecoration(
                          color: backgroundColor,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
