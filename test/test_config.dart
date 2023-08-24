import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

class GroupButtonTestWidget extends StatefulWidget {
  const GroupButtonTestWidget({Key? key}) : super(key: key);
  @override
  State<GroupButtonTestWidget> createState() => _GroupButtonTestWidgetState();
}

class _GroupButtonTestWidgetState extends State<GroupButtonTestWidget> {
  final buttons = ['12:00', '13:00', '14:00'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GroupButton(
        buttons: buttons,
        controller: GroupButtonController(disabledIndexes: const [2]),
        onSelected: (value, index, _) {
          setState(() => buttons.removeAt(index));
        },
      ),
    );
  }
}
