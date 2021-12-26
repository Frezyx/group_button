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
          child: GroupButton.radio(
            controller: controller,
            buttons: List.generate(40, (i) => '$i'),
            onSelected: (i) => debugPrint('Button #$i selected'),
          ),
        ),
        floatingActionButton: Container(
          height: 100,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Managed by controller',
                style: Theme.of(context).textTheme.headline6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => controller.setSelectedIndex(0),
                    child: const Text('Choise 0'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () => controller.setSelectedIndex(1),
                    child: const Text('Choise 1'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () => controller.setSelectedIndex(3),
                    child: const Text('Choise 3'),
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
