import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  final List<Widget> buttons;

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

  _buildButtonsList(List<Widget> buttons, GroupButtonBloc bloc) {
    List<InkWell> rebuildedButtons = [];
    for (var i = 0; i < buttons.length; i++) {
      InkWell rebuidedButton = InkWell(
        child: buttons[i],
        onTap: () => bloc.selectButton(i),
      );
      rebuildedButtons.add(rebuidedButton);
    }
    return buttons;
  }
}
