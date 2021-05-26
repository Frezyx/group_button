import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'blocs/group_button_bloc.dart';
import 'group_custom_button.dart';

class GroupButtonBody extends StatelessWidget {
  const GroupButtonBody({
    Key? key,
    required this.buttons,
    required this.images,
    this.selectedButtons,
    required this.onSelected,
    this.isRadio,
    this.direction,
    this.spacing = 0.0,
    this.selectedTextStyle,
    this.unselectedTextStyle,
    this.selectedColor,
    this.unselectedColor,
    required this.selectedBorderColor,
    required this.unselectedBorderColor,
    this.borderRadius = BorderRadius.zero,
    this.selectedShadow = const [],
    this.unselectedShadow = const [],
    this.buttonWidth,
    this.buttonHeigth,
  }) : super(key: key);

  final List<String> buttons;
  final List<String> images;
  final List<String>? selectedButtons;
  final Function(int, bool) onSelected;
  final bool? isRadio;
  final Axis? direction;
  final double spacing;
  final TextStyle? selectedTextStyle;
  final TextStyle? unselectedTextStyle;
  final Color? selectedColor;
  final Color? unselectedColor;
  final Color selectedBorderColor;
  final Color unselectedBorderColor;
  final BorderRadius? borderRadius;
  final List<BoxShadow> selectedShadow;
  final List<BoxShadow> unselectedShadow;
  final double? buttonWidth;
  final double? buttonHeigth;

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<GroupButtonBloc>(context);

    bloc.initializeSelection(buttons, selectedButtons);

    return Wrap(
      direction: direction ?? Axis.horizontal,
      spacing: spacing,
      runSpacing: spacing,
      children: _buildButtonsList(buttons,images, bloc),
    );
  }

  bool _getCond(int i, GroupButtonBloc bloc) {
    return isRadio!
        ? i == bloc.selectedIndex
        : bloc.selectedIndexes.containsKey(i) &&
            bloc.selectedIndexes[i] == true;
  }

  List<GroupCustomButton> _buildButtonsList(
    List<String> buttons,
    List<String> images,
    GroupButtonBloc bloc,
  ) {
    final rebuildedButtons = <GroupCustomButton>[];
    for (var i = 0; i < buttons.length; i++) {
      final rebuidedButton = GroupCustomButton(
        text: buttons[i],
        image:images[i],
        onPressed: () {
          bloc.selectButton(i, isRadio!);
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
        height: buttonHeigth,
        width: buttonWidth,
      );
      rebuildedButtons.add(rebuidedButton);
    }
    return rebuildedButtons;
  }
}
