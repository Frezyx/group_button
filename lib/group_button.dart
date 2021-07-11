library group_button;

import 'package:flutter/material.dart';

import 'src/group_button_body.dart';
import 'src/utils/utils.dart';

export 'src/utils/utils.dart';

class GroupButton extends StatelessWidget {
  const GroupButton({
    Key? key,
    required this.buttons,
    required this.onSelected,
    this.selectedButtons,
    this.isRadio = true,
    this.groupingType = GroupingType.wrapp,
    this.direction,
    this.spacing = 0,
    this.selectedTextStyle = _kDefaultSelectedTextStyle,
    this.unselectedTextStyle = _kDefaultUnselectedTextStyle,
    this.selectedColor,
    this.unselectedColor,
    this.selectedBorderColor,
    this.unselectedBorderColor,
    this.borderRadius,
    this.selectedShadow = _kDefaultShadow,
    this.unselectedShadow = _kDefaultShadow,
    this.buttonHeight,
    this.buttonWidth,
    this.selectedButton,
    this.mainGroupAlignment = MainGroupAlignment.center,
    this.crossGroupAlignment = CrossGroupAlignment.center,
    this.groupRunAlignment = GroupRunAlignment.center,
  })  : assert(
          (isRadio && selectedButtons == null) ||
              (!isRadio && selectedButton == null),
          "You can use selectedButton field for isRadio [true] and selectedButtons field with isadio [false]",
        ),
        super(key: key);

  /// [String] list that will be displayed on buttons in the [GroupButton]
  final List<String> buttons;

  /// [int] button ids that is selected initially.
  /// /// Using when [isRadio] is false
  final List<int>? selectedButtons;

  /// [int] button initially selected id
  /// Using when [isRadio] is true
  final int? selectedButton;

  /// Callback [Function] works by clicking on a group element
  ///
  /// Return int [index] of selected button and [isSelected] if [isRadio] = false
  final Function(int index, bool isSelected) onSelected;

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
  final TextStyle? selectedTextStyle;

  /// [TextStyle] of text of unselected buttons
  final TextStyle? unselectedTextStyle;

  /// background [Color] of selected button(s)
  final Color? selectedColor;

  /// background [Color] of  unselected buttons
  final Color? unselectedColor;

  /// border [Color] of selected button(s)
  final Color? selectedBorderColor;

  /// border [Color] of  unselected buttons
  final Color? unselectedBorderColor;

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

  /// How the buttons should be placed in the main axis in a layout
  final MainGroupAlignment mainGroupAlignment;

  /// How the buttons should be placed along the cross axis in a layout
  final CrossGroupAlignment crossGroupAlignment;

  /// How the button runs themselves should be placed along the cross axis in a layout
  final GroupRunAlignment groupRunAlignment;

  /// The field is responsible for how the buttons will be grouped
  final GroupingType groupingType;

  @override
  Widget build(BuildContext context) {
    return GroupButtonBody(
      buttons: buttons,
      selectedButtons: selectedButtons,
      selectedButton: selectedButton,
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
      mainGroupAlignment: mainGroupAlignment,
      crossGroupAlignment: crossGroupAlignment,
      groupRunAlignment: groupRunAlignment,
      groupingType: groupingType,
    );
  }

  static const _kDefaultShadow = <BoxShadow>[
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

  static const _kDefaultSelectedTextStyle =
      TextStyle(fontSize: 14, color: Colors.white);
  static const _kDefaultUnselectedTextStyle =
      TextStyle(fontSize: 14, color: Colors.black);

  static const Color _kDefaultSelectedColor = Colors.green;
  static const Color _kDefaultUnselectedColor = Colors.white;
}
