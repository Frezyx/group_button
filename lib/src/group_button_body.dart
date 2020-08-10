import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../group_buttons.dart';
import 'blocs/group_button_bloc.dart';

class GroupButtonBody extends StatelessWidget {
  const GroupButtonBody({
    Key key,
    this.direction,
    this.spacing,
    @required this.buttons,
  }) : super(key: key);

  final Axis direction;
  final double spacing;
  final List<String> buttons;

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<GroupButtonBloc>(context);
    return Wrap(
      direction: direction ?? Axis.horizontal,
      spacing: spacing,
      runSpacing: spacing,
      children: _buildButtonsList(buttons, bloc),
    );
  }

  _buildButtonsList(List<String> buttons, GroupButtonBloc bloc) {
    List<GroupCustomButton> rebuildedButtons = [];
    for (var i = 0; i < buttons.length; i++) {
      GroupCustomButton rebuidedButton = GroupCustomButton(
        text: buttons[i],
        onPressed: () => bloc.selectButton(i),
        isSelected: i == bloc.selectedIndex,
      );
      rebuildedButtons.add(rebuidedButton);
    }
    return rebuildedButtons;
  }
}
