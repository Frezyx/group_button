library group_button;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/blocs/group_button_bloc.dart';
import 'src/group_button_body.dart';

class GroupButton extends StatelessWidget {
  /// [String] list that will be displayed on buttons in the [GroupButton]
  final List<String> buttons;

  /// [String] buttons that is selected initially.
  final List<String>? selectedButtons;

  /// Callback [Function] works by clicking on a group element
  ///
  /// Return int [index] of selected button and [isSelected] if [isRadio] = false
  final Function(int, bool) onSelected;

  /// bool variable for switching between modes [ChackBox] and [Radio]
  ///
  /// if the [isRadio] = true, only one button can be selected
  /// if the [isRadio] = false, you can select several at once
  final bool isRadio;

  /// The direction of arrangement of the buttons in [GroupButton]
  final Axis? direction;

  /// The spacing between buttons inside [GroupButton]
  final double spacing;

  /// [TextStyle] of text of selected button(s)
  final TextStyle selectedTextStyle;

  /// [TextStyle] of text of unselected buttons
  final TextStyle unselectedTextStyle;

  /// background [Color] of selected button(s)
  final Color selectedColor;

  /// background [Color] of  unselected buttons
  final Color unselectedColor;

  /// border [Color] of selected button(s)
  final Color selectedBorderColor;

  /// border [Color] of  unselected buttons
  final Color unselectedBorderColor;

  /// [BorderRadius] of  buttons
  /// How much the button will be rounded
  final BorderRadius? borderRadius;

  /// list of selected button(s) [BoxShadow]
  final List<BoxShadow> selectedShadow;

  /// list of unselected buttons [BoxShadow]
  final List<BoxShadow> unselectedShadow;

  /// Height of Group button
  final double? buttonHeight;

  /// Width of group button
  final double? buttonWidth;

  const GroupButton({
    Key? key,
    required this.buttons,
    required this.onSelected,
    this.selectedButtons,
    this.isRadio = true,
    this.direction,
    this.spacing = 0,
    this.selectedTextStyle = _defaultSelectedTextStyle,
    this.unselectedTextStyle = _defaultUnselectedTextStyle,
    this.selectedColor = _defaultSelectedColor,
    this.unselectedColor = _defaultUnselectedColor,
    this.selectedBorderColor = Colors.transparent,
    this.unselectedBorderColor = Colors.transparent,
    this.borderRadius,
    this.selectedShadow = _defaultShadow,
    this.unselectedShadow = _defaultShadow,
    this.buttonHeight,
    this.buttonWidth,
  })  : assert(
          !isRadio || selectedButtons == null || selectedButtons.length <= 1,
          "When isRadio=true, selectedButtons can't contain multiple buttons.",
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GroupButtonBloc>(
      create: (_) => GroupButtonBloc(),
      child: GroupButtonBody(
        buttons: buttons,
        selectedButtons: selectedButtons,
        onSelected: onSelected,
        isRadio: isRadio,
        direction: direction,
        spacing: spacing,
        selectedTextStyle: selectedTextStyle,
        unselectedTextStyle: unselectedTextStyle,
        selectedColor: selectedColor,
        unselectedColor: unselectedColor,
        selectedBorderColor: selectedBorderColor,
        unselectedBorderColor: unselectedBorderColor,
        borderRadius: borderRadius,
        selectedShadow: selectedShadow,
        unselectedShadow: unselectedShadow,
        buttonWidth: buttonWidth,
        buttonHeigth: buttonHeight,
      ),
    );
  }

  static const _defaultShadow = <BoxShadow>[
    BoxShadow(
      color: Color.fromARGB(18, 18, 18, 20),
      blurRadius: 25.0,
      spreadRadius: 1.0,
      offset: Offset(
        0.0,
        2.0,
      ),
    )
  ];

  static const _defaultSelectedTextStyle =
      TextStyle(fontSize: 14, color: Colors.white);
  static const _defaultUnselectedTextStyle =
      TextStyle(fontSize: 14, color: Colors.black);

  static const Color _defaultSelectedColor = Colors.green;
  static const Color _defaultUnselectedColor = Colors.white;
}
