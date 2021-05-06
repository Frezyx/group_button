import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

class GroupButtonWrapper extends StatefulWidget {
  const GroupButtonWrapper();
  @override
  _GroupButtonWrapperState createState() => _GroupButtonWrapperState();
}

class _GroupButtonWrapperState extends State<GroupButtonWrapper> {
  List<String> buttons = ['12:00', '13:00'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GroupButton(
        buttons: buttons,
        onSelected: (index, _) {
          setState(() => buttons.removeAt(index));
        },
      ),
    );
  }
}
