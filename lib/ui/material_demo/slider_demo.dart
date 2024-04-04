import 'package:flutter/material.dart';

void main() => runApp(const SliderApp());

class SliderApp extends StatelessWidget {
  const SliderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: const Color(0xff446d2a),
      ),
      home: const SliderExample(),
    );
  }
}

class SliderExample extends StatefulWidget {
  const SliderExample({super.key});

  @override
  State<SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  double _mediaValue = 30.0;
  double _ringToneValue = 80.0;
  double _notificationValue = 15.0;
  double _alarmsValue = 60.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sound & vibration')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("VOLUME",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: Color(0xff1a1c17))),
            const SizedBox(height: 12),
            ItemRow(
              label: "Media",
              icon: Icons.music_note_outlined,
              value: _mediaValue,
              onChanged: (double value) {
                setState(() {
                  _mediaValue = value;
                });
              },
            ),
            ItemRow(
              label: "Ringtone",
              icon: Icons.notifications_active_outlined,
              value: _ringToneValue,
              onChanged: (double value) {
                setState(() {
                  _ringToneValue = value;
                });
              },
            ),
            ItemRow(
              label: "Notifications",
              icon: Icons.notifications,
              value: _notificationValue,
              onChanged: (double value) {
                setState(() {
                  _notificationValue = value;
                });
              },
            ),
            ItemRow(
              label: "Alarms",
              icon: Icons.access_alarm,
              value: _alarmsValue,
              onChanged: (double value) {
                setState(() {
                  _alarmsValue = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ItemRow extends StatelessWidget {
  const ItemRow(
      {Key? key,
      required this.icon,
      required this.label,
      required this.value,
      required this.onChanged})
      : super(key: key);
  final IconData icon;
  final String label;
  final double value;
  final void Function(double)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xff1a1c17)),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 22.0),
                child: Text(
                  label,
                  textAlign: TextAlign.left,
                  style:
                      const TextStyle(fontSize: 15, color: Color(0xff1a1c17)),
                ),
              ),
              SliderTheme(
                data: const SliderThemeData(trackHeight: 12),
                child: Slider(
                  value: value,
                  inactiveColor: const Color(0xffcaf3ab),
                  max: 100,
                  label: value.round().toString(),
                  onChanged: onChanged,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
