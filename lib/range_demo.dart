import 'package:flutter/material.dart';


class RangePickerDemo extends StatefulWidget {
  const RangePickerDemo({Key? key}) : super(key: key);

  @override
  State<RangePickerDemo> createState() => _RangePickerDemoState();
}

class _RangePickerDemoState extends State<RangePickerDemo> {
  RangeValues _currentRangeValues = const RangeValues(09.25, 15.50);

  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      values: _currentRangeValues,
      max: 23,
      min: 00.00,
      divisions: 96,
      labels: RangeLabels(
        _currentRangeValues.start.round().toString(),
        _currentRangeValues.end.round().toString(),
      ),
      onChanged: (RangeValues values) {
        setState(() {
          _currentRangeValues = values;
        });
      },
    );
  }
}
