import 'package:example/examples/customizable_example/customizable_example.dart';
import 'package:example/examples/extended_example/example.dart';
import 'package:example/examples/full_options_example/full_options_example.dart';
import 'package:example/examples/generics_example/generics_example.dart';
import 'package:example/examples/styles_example/example.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

import 'examples/button_builder_example/example.dart';

/// Use [GroupButtonExtendedExample]
/// to check all package [GroupingType]'s in one place

/// Use [StylesExample]
/// to check all package style's configuration

/// Use [CustomizableExample]
/// to check package power

/// Use [ButtonBuilderExample]
/// to check how button builder works
///
/// In this example GroupButton work as
/// common flutter [Checkbox] and [Radio] buttons

/// Use [FullOptionsSelectedExample]
/// to check all [GroupButtonOptions]

/// Use [GenericsExample]
/// to checl how works generic button values

void main() {
  runApp(FullOptionsSelectedExample());
}

class CommonExample extends StatelessWidget {
  CommonExample({Key? key}) : super(key: key);

  final controller = GroupButtonController(
    selectedIndex: 20,
    selectedIndexes: [0, 1, 2, 3, 4],
    disabledIndexes: [10, 12, 13, 14, 15, 23],
    onDisablePressed: (i) => print('Button #$i is disabled'),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: GroupButton(
            controller: controller,
            isRadio: false,
            buttons: List.generate(25, (i) => '${i + 1}'),
            maxSelected: 10,
            onSelected: (val, i, selected) =>
                debugPrint('Button: $val index: $i selected: $selected'),
          ),
        ),
      ),
    );
  }
}
