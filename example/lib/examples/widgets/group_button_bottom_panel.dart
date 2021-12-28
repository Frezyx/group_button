import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

class GroupButtonBottomPanel extends StatelessWidget {
  const GroupButtonBottomPanel({
    Key key,
    @required this.controller,
  }) : super(key: key);

  final GroupButtonController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                onPressed: () => controller.unselectIndexes([0, 1, 2, 3, 4]),
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
    );
  }
}
