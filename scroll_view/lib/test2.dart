import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatelessWidget(),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.bodyText2!,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return Column(
            children: <Widget>[
              Container(
                // A fixed-height child.
                color: const Color(0xffeeee00), // Yellow
                height: 150.0,
                alignment: Alignment.center,
                child: const Text('Fixed Height Content'),
              ),
              Expanded(
                // A flexible child that will grow to fit the viewport but
                // still be at least as big as necessary to fit its contents.
                child: Column(
                  children: const [
                    Text('1', style: TextStyle(color: Colors.yellow)),
                    Text('1', style: TextStyle(color: Colors.yellow)),
                    Text('1', style: TextStyle(color: Colors.yellow)),
                    Text('1', style: TextStyle(color: Colors.yellow)),
                    Text('1', style: TextStyle(color: Colors.yellow)),
                    Text('1', style: TextStyle(color: Colors.yellow)),
                    Text('2', style: TextStyle(color: Colors.yellow)),
                    Text('2', style: TextStyle(color: Colors.yellow)),
                    Text('2', style: TextStyle(color: Colors.yellow)),
                    Text('2', style: TextStyle(color: Colors.yellow)),
                    Text('2', style: TextStyle(color: Colors.yellow)),
                    Text('2', style: TextStyle(color: Colors.yellow)),
                    Text('2', style: TextStyle(color: Colors.yellow)),
                    Text('2', style: TextStyle(color: Colors.yellow)),
                    Text('2', style: TextStyle(color: Colors.yellow)),
                    Text('2', style: TextStyle(color: Colors.yellow)),
                    Text('2', style: TextStyle(color: Colors.yellow)),
                    Text('2', style: TextStyle(color: Colors.yellow)),
                    Text('2', style: TextStyle(color: Colors.yellow)),
                    Text('2', style: TextStyle(color: Colors.yellow)),
                    Text('2', style: TextStyle(color: Colors.yellow)),
                    Text('2', style: TextStyle(color: Colors.yellow)),
                    Text('2', style: TextStyle(color: Colors.yellow)),
                    Text('2', style: TextStyle(color: Colors.yellow)),
                    Text('2', style: TextStyle(color: Colors.yellow)),
                    Text('2', style: TextStyle(color: Colors.yellow)),
                    Text('2', style: TextStyle(color: Colors.yellow)),
                    Text('2', style: TextStyle(color: Colors.yellow)),
                    Text('2', style: TextStyle(color: Colors.yellow)),
                    Text('2', style: TextStyle(color: Colors.yellow)),
                    Text('2', style: TextStyle(color: Colors.yellow)),
                    Text('2', style: TextStyle(color: Colors.yellow)),
                    Text('2', style: TextStyle(color: Colors.yellow)),
                    Text('2', style: TextStyle(color: Colors.yellow)),
                    Text('2', style: TextStyle(color: Colors.yellow)),
                    Text('2', style: TextStyle(color: Colors.yellow)),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
