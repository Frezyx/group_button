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
  final controller = GroupButtonController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: GroupButton.checkbox(
            controller: controller,
            buttons: List.generate(25, (i) => '$i'),
            onSelected: (i, selected) => debugPrint('Button #$i $selected'),
            selectedButtons: const [5, 6, 7, 8, 9],
          ),
        ),
        bottomNavigationBar: Container(
          height: 150,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Managed by controller',
                style: Theme.of(context).textTheme.headline6,
              ),
              Wrap(
                spacing: 10,
                children: [
                  ElevatedButton(
                    onPressed: () => controller.selectIndexes([0, 1, 2, 3, 4]),
                    child: const Text('Select line'),
                  ),
                  ElevatedButton(
                    onPressed: () =>
                        controller.unselectIndexes([0, 1, 2, 3, 4]),
                    child: const Text('Uelect line'),
                  ),
                  ElevatedButton(
                    onPressed: () => controller.toggleIndexes([0, 1, 2, 3, 4]),
                    child: const Text('Toggle line'),
                  ),
                  ElevatedButton(
                    onPressed: () => controller.unselectAll(),
                    child: const Text('Unselect all'),
                  ),
                  ElevatedButton(
                    onPressed: () => controller
                      ..unselectAll()
                      ..selectIndexes([2, 7, 12, 17, 22])
                      ..selectIndexes([10, 11, 12, 13, 14]),
                    child: const Text('Make +'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
