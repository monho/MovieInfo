import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(final BuildContext context) => const MaterialApp(
    home: Scaffold(
      body: Center(
        child: Column(children: [
          Text(
            '가장 인기있는MM', 
            style: TextStyle(
              fontSize: 16,
            )
        )
        ]
        ),
      ),
    ),
  );
}
