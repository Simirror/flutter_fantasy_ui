import 'package:flutter/material.dart';

import 'container/border_showcase.dart';
import 'container/border_demo.dart';
import 'container/panel_showcase.dart';
import 'components/component_showcase.dart';

void main() {
  runApp(MaterialApp(home: const MyHomePage()));
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Fantasy UI Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BorderShowcase(),
                  ),
                );
              },
              child: const Text('查看所有边框样式'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BorderDemo()),
                );
              },
              child: const Text('边框演示'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PanelShowcase(),
                  ),
                );
              },
              child: const Text('查看所有面板样式'),
            ),
          ],
        ),
      ),
    );
  }
}
