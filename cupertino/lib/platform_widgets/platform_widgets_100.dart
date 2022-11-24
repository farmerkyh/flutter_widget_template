// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

void main() => runApp(const MaterialApp(home: PlatformWidget100()));

class PlatformWidget100 extends StatelessWidget {
  const PlatformWidget100({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('child: Theme.of(context).platform')),
      body: PlatformWidget(
        material: (_, __) => const Text('material'),
        cupertino: (context, platform) => const Text('cupertino'),
      ),
    );
  }
}
