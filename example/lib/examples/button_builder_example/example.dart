import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

class ButtonBuilderExample extends StatelessWidget {
  ButtonBuilderExample({Key? key}) : super(key: key);

  final _controller = GroupButtonController(
    selectedIndex: 20,
    selectedIndexes: [1, 2, 3, 4, 5],
    disabledIndexes: [10, 12, 13, 14, 15],
  );

  final _buttons = List.generate(25, (i) => '${i + 1}');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView(
          children: [
            GroupButton(
              controller: _controller,
              isRadio: false,
              options: GroupButtonOptions(
                groupingType: GroupingType.column,
              ),
              buttons: _buttons,
              buttonBuilder: (selected, index, context) {
                return CheckBoxTile(
                  title: _buttons[index],
                  selected: selected,
                  onTap: () {
                    if (!selected) {
                      _controller.selectIndex(index);
                      return;
                    }
                    _controller.unselectIndex(index);
                  },
                );
              },
              onSelected: (i, selected) => debugPrint('Button #$i $selected'),
            ),
          ],
        ),
      ),
    );
  }
}

class CheckBoxTile extends StatelessWidget {
  const CheckBoxTile({
    Key? key,
    required this.selected,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  final String title;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: onTap,
      leading: Checkbox(
        value: selected,
        onChanged: (val) {
          onTap();
        },
      ),
    );
  }
}
