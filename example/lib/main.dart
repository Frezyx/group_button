import 'package:example/examples/extended_example/example.dart';
import 'package:example/examples/provider_example/ui/app.dart';
import 'package:example/examples/styles_example/example.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

/// You can use [GroupButtonExtendedExample] example
/// for check all package [GroupingType]'s in one place

/// /// You can use [StylesExample] example
/// for check all package style's configuration

/// You can use [GroupButtonProviderExample] example
/// using this package with state - managment package like provider

void main() {
  runApp(CommonExample());
}

class CommonExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: GroupButton(
            spacing: 10,
            buttons: ['12:00', '13:00', '14:00', '15:00', '16:00', '17:00'],
            groupingType: GroupingType.wrap,
            borderRadius: BorderRadius.circular(30),
            onSelected: (i, selected) => print('Button #$i selected'),
          ),
        ),
      ),
    );
  }
}
