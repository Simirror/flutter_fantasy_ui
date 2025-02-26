import 'package:flutter/material.dart';
import 'package:flutter_fantasy_ui/component/fantasy_button.dart';
import 'package:flutter_fantasy_ui/component/fantasy_panel.dart';

class ComponentShowcase extends StatelessWidget {
  const ComponentShowcase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('组件展示')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'FantasyButton 示例',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              children: [
                FantasyButton(
                  onPressed: () {},
                  child: const Text('默认按钮'),
                ),
                FantasyButton(
                  onPressed: () {},
                  backgroundColor: Colors.purple[900]!,
                  borderColor: Colors.purple[200]!,
                  child: const Text('紫色主题'),
                ),
                FantasyButton(
                  onPressed: () {},
                  width: 150,
                  height: 40,
                  backgroundColor: Colors.green[900]!,
                  borderColor: Colors.green[200]!,
                  child: const Text('小尺寸'),
                ),
              ],
            ),
            const SizedBox(height: 40),
            const Text(
              'FantasyPanel 示例',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              children: [
                FantasyPanel(
                  child: const Center(
                    child: Text(
                      '默认面板',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                FantasyPanel(
                  backgroundColor: Colors.purple[900]!,
                  borderColor: Colors.purple[200]!,
                  width: 200,
                  height: 150,
                  child: const Center(
                    child: Text(
                      '紫色主题\n小尺寸',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                FantasyPanel(
                  backgroundColor: Colors.green[900]!,
                  borderColor: Colors.green[200]!,
                  padding: const EdgeInsets.all(24),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check_circle, color: Colors.green, size: 48),
                      SizedBox(height: 16),
                      Text(
                        '自定义内容',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}