import 'package:flutter/material.dart';
import 'package:flutter_fantasy_ui/border/border_creater.dart';
import 'package:flutter_fantasy_ui/fantasy_ui.dart';

void main() {
  runApp(MaterialApp(home: Scaffold(body: Center(child: CrossBorderWidget()))));
}

class CrossBorderWidget extends StatefulWidget {
  @override
  State<CrossBorderWidget> createState() => _CrossBorderWidgetState();
}

class _CrossBorderWidgetState extends State<CrossBorderWidget> {
  double width = 200;
  double height = 200;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: width,
          height: height,
          color: Colors.blue,
          child: SwallowBorder(
            width: width,
            height: height,
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
            ],
          ),
        ),
      ],
    );
  }
}
