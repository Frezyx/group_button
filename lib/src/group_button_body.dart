import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'blocs/group_button_bloc.dart';
import 'group_custom_button.dart';

class GroupButtonBody extends StatelessWidget {
  const GroupButtonBody({
    Key key,
    @required this.buttons,
    @required this.onSelected,
    this.isRadio,
    this.direction,
    this.spacing,
    this.selectedTextStyle,
    this.unselectedTextStyle,
    this.selectedColor,
    this.unselectedColor,
    this.selectedBorderColor,
    this.unselectedBorderColor,
    this.borderRadius,
    this.selectedShadow,
    this.unselectedShadow,
  }) : super(key: key);

  final List<String> buttons;
  final Function(int, bool) onSelected;
  final bool isRadio;
  final Axis direction;
  final double spacing;
  final TextStyle selectedTextStyle;
  final TextStyle unselectedTextStyle;
  final Color selectedColor;
  final Color unselectedColor;
  final Color selectedBorderColor;
  final Color unselectedBorderColor;
  final BorderRadius borderRadius;
  final List<BoxShadow> selectedShadow;
  final List<BoxShadow> unselectedShadow;

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

  _getCond(int i, GroupButtonBloc bloc) {
    return isRadio
        ? i == bloc.selectedIndex
        : bloc.selectedIndexes.containsKey(i) &&
            bloc.selectedIndexes[i] == true;
  }

  _buildButtonsList(List<String> buttons, GroupButtonBloc bloc) {
    List<GroupCustomButton> rebuildedButtons = [];
    for (var i = 0; i < buttons.length; i++) {
      GroupCustomButton rebuidedButton = GroupCustomButton(
        text: buttons[i],
        onPressed: () {
          bloc.selectButton(i, isRadio);
          onSelected(
            i,
            _getCond(i, bloc),
          );
        },
        isSelected: _getCond(i, bloc),
        selectedTextStyle: selectedTextStyle,
        unselectedTextStyle: unselectedTextStyle,
        selectedColor: selectedColor,
        unselectedColor: unselectedColor,
        selectedBorderColor: selectedBorderColor,
        unselectedBorderColor: unselectedBorderColor,
        borderRadius: borderRadius,
        selectedShadow: selectedShadow,
        unselectedShadow: unselectedShadow,
      );
      rebuildedButtons.add(rebuidedButton);
    }
    return rebuildedButtons;
  }
}
