import 'package:example/examples/customizable_example/customizable_example_controller.dart';
import 'package:example/examples/customizable_example/widgets/group_button_bottom_panel.dart';

import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

class CustomizableExample extends StatelessWidget {
  CustomizableExample({Key? key}) : super(key: key);
  final controller = GroupButtonController();
  final customizableController = CustomizableExampleController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedBuilder(
        animation: customizableController,
        builder: (context, child) {
          return Scaffold(
            appBar: AppBar(
              shadowColor: Colors.grey[100]?.withOpacity(0.1),
              backgroundColor: Colors.white,
              title: Text(
                'GroupButton 4.5.0',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            body: Center(
              child: GroupButton(
                controller: controller,
                isRadio: false,
                buttons: customizableController.buttons
                    .map((i) => '${i + 1}')
                    .toList(),
                onSelected: (i, selected) => debugPrint('Button #$i $selected'),
                onDisablePressed: (i) =>
                    debugPrint('Disable Button #$i pressed'),
              ),
            ),
            bottomNavigationBar: GroupButtonBottomPanel(
              controller: controller,
              customizableController: customizableController,
            ),
          );
        },
      ),
    );
  }
}
