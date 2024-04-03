import 'package:flutter/material.dart';

void main() => runApp(const SwitchApp());

class SwitchApp extends StatelessWidget {
  const SwitchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.green),
      home: Scaffold(
        appBar: AppBar(title: const Text('Switch Example')),
        body: const Center(
          child: SwitchScreen(),
          // child: SwitchExample(),
        ),
      ),
    );
  }
}

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({Key? key}) : super(key: key);

  @override
  State<SwitchScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  bool lightOn = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Light Bulb Control"),
              Switch(
                value: lightOn,
                activeColor: Colors.green,
                onChanged: (bool value) {
                  setState(() {
                    lightOn = value;
                  });
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        lightOn
            ? const Icon(
                Icons.lightbulb,
                size: 150,
                color: Colors.amberAccent,
              )
            : const Icon(
                Icons.lightbulb_outline,
                size: 150,
                color: Colors.amberAccent,
              ),
        const SizedBox(height: 50),
      ],
    );
  }
}

class SwitchExample extends StatefulWidget {
  const SwitchExample({super.key});

  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  bool light1 = true;
  bool light2 = true;
  bool light3 = true;

  @override
  Widget build(BuildContext context) {
    final MaterialStateProperty<Color?> trackColor =
        MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        // Track color when the switch is selected.
        if (states.contains(MaterialState.selected)) {
          return Colors.amber;
        }
        // Otherwise return null to set default track color
        // for remaining states such as when the switch is
        // hovered, focused, or disabled.
        return null;
      },
    );
    final MaterialStateProperty<Color?> overlayColor =
        MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        // Material color when switch is selected.
        if (states.contains(MaterialState.selected)) {
          return Colors.amber.withOpacity(0.54);
        }
        // Material color when switch is disabled.
        if (states.contains(MaterialState.disabled)) {
          return Colors.grey.shade400;
        }
        // Otherwise return null to set default material color
        // for remaining states such as when the switch is
        // hovered, or focused.
        return null;
      },
    );

    final MaterialStateProperty<Icon?> thumbIcon =
        MaterialStateProperty.resolveWith<Icon?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return const Icon(
            Icons.check,
            color: Colors.white,
          );
        }
        return const Icon(Icons.close);
      },
    );

    return Column(
      children: [
        Switch(
          value: light1,
          activeColor: Colors.red,
          onChanged: (bool value) {
            setState(() {
              light1 = value;
            });
          },
        ),
        Switch(
          value: light2,
          overlayColor: overlayColor,
          trackColor: trackColor,
          thumbColor: const MaterialStatePropertyAll<Color>(Colors.black),
          onChanged: (bool value) {
            setState(() {
              light2 = value;
            });
          },
        ),
        Switch(
          value: light3,
          thumbIcon: thumbIcon,
          activeColor: Colors.green,
          onChanged: (bool value) {
            setState(() {
              light3 = value;
            });
          },
        )
      ],
    );
  }
}
