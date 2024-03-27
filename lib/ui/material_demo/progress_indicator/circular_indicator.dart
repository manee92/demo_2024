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
  State<ProgressIndicatorDemo> createState() =>
      _ProgressIndicatorDemoState();
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
      body:  Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 100),
              const CircularProgressIndicator(
                backgroundColor: Color(0xffffdad9),
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xff9c4246)),
                // strokeWidth: 10,
              ),
              const SizedBox(height: 30),
              CircularProgressIndicator(
                backgroundColor: const Color(0xffffdad9),
                value: controller.value,
                semanticsLabel: 'Circular progress indicator',
              ),
              const SizedBox(height: 10),
            ],
          ),
      ),
    );
  }
}
