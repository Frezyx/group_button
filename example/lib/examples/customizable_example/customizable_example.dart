import 'package:example/drawer.dart';
import 'package:example/examples/customizable_example/customizable_example_controller.dart';
import 'package:example/examples/customizable_example/widgets/group_button_bottom_panel.dart';

import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

class CustomizableExample extends StatelessWidget {
  CustomizableExample({Key? key}) : super(key: key);
  final GroupButtonController controller = GroupButtonController(
    onDisablePressed: (i) => debugPrint('Disable Button #$i pressed'),
  );
  final CustomizableExampleController customizableController =
      CustomizableExampleController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: Text(
          'GroupButton 5.0.0',
        ),
      ),
      body: AnimatedBuilder(
        animation: customizableController,
        builder: (context, child) {
          return Center(
            child: GroupButton(
              controller: controller,
              isRadio: false,
              buttons: customizableController.buttons
                  .map((i) => '${i + 1}')
                  .toList(),
              onSelected: (val, i, selected) =>
                  debugPrint('Button: $val index: $i $selected'),
            ),
          );
        },
      ),
      bottomNavigationBar: GroupButtonBottomPanel(
        controller: controller,
        customizableController: customizableController,
      ),
    );
  }
}
