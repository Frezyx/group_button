import 'package:example/examples/extended_example/example.dart';
import 'package:example/examples/provider_example/ui/app.dart';
import 'package:example/examples/styles_example/example.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

/// You can use [GroupButtonExtendedExample]
/// for check all package [GroupingType]'s in one place

/// /// You can use [StylesExample]
/// for check all package style's configuration

/// You can use [GroupButtonProviderExample]
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
          child: GroupButton.radio(
            buttons: List.generate(40, (i) => '$i'),
            onSelected: (i) => debugPrint('Button #$i selected'),
          ),
        ),
      ),
    );
  }
}
