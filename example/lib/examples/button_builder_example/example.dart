import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

class ButtonBuilderExample extends StatelessWidget {
  ButtonBuilderExample({Key key}) : super(key: key);

  final controller = GroupButtonController(
    selectedIndex: 20,
    selectedIndexes: [1, 2, 3, 4, 5],
    disabledIndexes: [10, 12, 13, 14, 15],
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
            buttonBuilder: (selected, index, context) {},
            onSelected: (i, selected) => debugPrint('Button #$i $selected'),
          ),
        ),
      ),
    );
  }
}
