import 'package:example/examples/customizable_example/customizable_example_controller.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

class GroupButtonBottomPanel extends StatelessWidget {
  const GroupButtonBottomPanel({
    Key? key,
    required this.controller,
    required this.customizableController,
  }) : super(key: key);

  final CustomizableExampleController customizableController;
  final GroupButtonController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: 300,
      child: Column(
        children: [
          Container(
            height: 100,
            width: size.width,
            decoration: BoxDecoration(
              color: theme.cardColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[100]!,
                  blurRadius: 10,
                  offset: const Offset(0, -10),
                )
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Text(
                    'Buttons count ${customizableController.buttonsCount}',
                    style: theme.textTheme.titleLarge,
                  ),
                ),
                Slider(
                  value: customizableController.buttonsCount.toDouble(),
                  max: 45,
                  divisions: 45,
                  label: customizableController.buttonsCount.toString(),
                  onChanged: (double value) {
                    customizableController.buttonsCount = value.ceil();
                  },
                ),
              ],
            ),
          ),
          Container(
            height: 200,
            width: size.width,
            decoration: BoxDecoration(
              color: theme.cardColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[100]!,
                  blurRadius: 10,
                  offset: const Offset(0, -10),
                )
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Managed by controller',
                  style: theme.textTheme.titleLarge,
                ),
                Wrap(
                  spacing: 10,
                  alignment: WrapAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => controller.selectIndex(0),
                      child: const Text('Select #1'),
                    ),
                    ElevatedButton(
                      onPressed: () => controller.unselectIndex(0),
                      child: const Text('Unselect #1'),
                    ),
                    ElevatedButton(
                      onPressed: () =>
                          controller.selectIndexes([0, 1, 2, 3, 4]),
                      child: const Text('Select line'),
                    ),
                    ElevatedButton(
                      onPressed: () =>
                          controller.unselectIndexes([0, 1, 2, 3, 4]),
                      child: const Text('Unselect line'),
                    ),
                    ElevatedButton(
                      onPressed: () =>
                          controller.toggleIndexes([0, 1, 2, 3, 4]),
                      child: const Text('Toggle line'),
                    ),
                    ElevatedButton(
                      onPressed: () => controller
                        ..unselectAll()
                        ..selectIndexes([2, 7, 12, 17, 22])
                        ..selectIndexes([10, 11, 12, 13, 14]),
                      child: const Text('Make +'),
                    ),
                    ElevatedButton(
                      onPressed: () => controller.unselectAll(),
                      child: const Text('Unselect all'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
