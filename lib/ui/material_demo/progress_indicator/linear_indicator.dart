import 'package:flutter/material.dart';

void main() => runApp(const ProgressIndicatorApp());

class ProgressIndicatorApp extends StatelessWidget {
  const ProgressIndicatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true, colorSchemeSeed: const Color(0xff9c4246)),
      home: const ProgressIndicatorDemo(),
    );
  }
}

class ProgressIndicatorDemo extends StatefulWidget {
  const ProgressIndicatorDemo({super.key});

  @override
  State<ProgressIndicatorDemo> createState() => _ProgressIndicatorDemoState();
}

class _ProgressIndicatorDemoState extends State<ProgressIndicatorDemo>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const LinearProgressIndicator(
              backgroundColor: Color(0xffffdad9),
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xff9c4246)),
            ),
            const SizedBox(height: 50),
            LinearProgressIndicator(
              value: controller.value,
              semanticsLabel: 'Linear progress indicator',
            ),
          ],
        ),
      ),
    );
  }
}
