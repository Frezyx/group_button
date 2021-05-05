import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

const testButtons = ['9:00', '5:00'];

class GroupButtonWrapper extends StatefulWidget {
  const GroupButtonWrapper({
    Key? key,
    this.deleting = false,
    this.buttons = testButtons,
  }) : super(key: key);
  final bool deleting;
  final List<String> buttons;

  @override
  _GroupButtonWrapperState createState() => _GroupButtonWrapperState();
}

class _GroupButtonWrapperState extends State<GroupButtonWrapper> {
  List<String> buttons = testButtons;

  @override
  void initState() {
    setState(() {
      buttons = widget.buttons;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GroupButton(
        buttons: buttons,
        onSelected: (index, _) {
          if (widget.deleting) {
            setState(() => buttons.removeAt(index));
          }
        },
      ),
    );
  }
}
