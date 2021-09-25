library group_button;

import 'package:flutter/material.dart';

import 'src/group_button_body.dart';
import 'src/group_custom_button.dart';
import 'src/utils/defaults.dart';
import 'src/utils/filter_element.dart';
import 'src/utils/utils.dart';

export 'src/utils/utils.dart';

class GroupButton extends StatelessWidget {
  const GroupButton({
    Key? key,
    required this.buttons,
    required this.onSelected,
    this.selectedButtons,
    this.isRadio = true,
    this.groupingType = GroupingType.wrap,
    this.direction,
    this.spacing = 0,
    this.runSpacing = 0,
    this.selectedTextStyle = Defaults.kDefaultSelectedTextStyle,
    this.unselectedTextStyle = Defaults.kDefaultUnselectedTextStyle,
    this.selectedColor,
    this.unselectedColor,
    this.selectedBorderColor,
    this.unselectedBorderColor,
    this.borderRadius,
    this.selectedShadow = Defaults.kDefaultShadow,
    this.unselectedShadow = Defaults.kDefaultShadow,
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

  /// When [groupingType] is [GroupingType.wrap]
  /// this field sets Wrap [runSpacing]
  final double runSpacing;

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
      runSpacing: runSpacing,
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

}

class ElementsGroupButton extends StatelessWidget {
  const ElementsGroupButton({
    required Key key,
    required this.buttons,
    required this.onSelected,
    this.isRadio = true,
    this.groupingType = GroupingType.wrap,
    this.direction,
    this.spacing = 0,
    this.runSpacing = 0,
    this.selectedTextStyle = Defaults.kDefaultSelectedTextStyle,
    this.unselectedTextStyle = Defaults.kDefaultUnselectedTextStyle,
    this.selectedColor,
    this.unselectedColor,
    this.selectedBorderColor,
    this.unselectedBorderColor,
    this.borderRadius,
    this.selectedShadow = Defaults.kDefaultShadow,
    this.unselectedShadow = Defaults.kDefaultShadow,
    this.buttonHeight,
    this.buttonWidth,
    this.mainGroupAlignment = MainGroupAlignment.center,
    this.crossGroupAlignment = CrossGroupAlignment.center,
    this.groupRunAlignment = GroupRunAlignment.center,
  }):
        super(key: key);

  /// [String] list that will be displayed on buttons in the [GroupButton]
  final List<FilterElement> buttons;

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

  /// When [groupingType] is [GroupingType.wrap]
  /// this field sets Wrap [runSpacing]
  final double runSpacing;

  /// [TextStyle] of text of selected button(s)
  final TextStyle selectedTextStyle;

  /// [TextStyle] of text of unselected buttons
  final TextStyle unselectedTextStyle;

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
    return _buildBodyByGroupingType();
  }

  Widget _buildBodyByGroupingType() {
    switch (groupingType) {
      case GroupingType.row:
        return Row(
          mainAxisAlignment: mainGroupAlignment.toAxis(),
          crossAxisAlignment: crossGroupAlignment.toAxis(),
          children: _buildButtonsList(buttons),
        );
      case GroupingType.column:
        return Column(
          mainAxisAlignment: mainGroupAlignment.toAxis(),
          crossAxisAlignment: crossGroupAlignment.toAxis(),
          children: _buildButtonsList(buttons),
        );

      case GroupingType.wrap:
      default:
        return Wrap(
          direction: direction ?? Axis.horizontal,
          spacing: spacing,
          runSpacing: runSpacing,
          crossAxisAlignment: crossGroupAlignment.toWrap(),
          runAlignment: groupRunAlignment.toWrap(),
          alignment: mainGroupAlignment.toWrap(),
          children: _buildButtonsList(buttons),
        );
    }
  }


  List<Widget> _buildButtonsList(
      List<FilterElement> buttons,
      ) {
    final rebuildedButtons = <Widget>[];
    for (var i = 0; i < buttons.length; i++) {
      Widget rebuidedButton = GroupCustomButton(
        text: buttons[i].text,
        onPressed: () {
          _selectButton(i);
          onSelected(
            i,
            buttons[i].selected,
          );
        },
        isSelected: buttons[i].selected,
        selectedTextStyle: selectedTextStyle,
        unselectedTextStyle: unselectedTextStyle,
        selectedColor: selectedColor,
        unselectedColor: unselectedColor,
        selectedBorderColor: selectedBorderColor,
        unselectedBorderColor: unselectedBorderColor,
        borderRadius: borderRadius,
        selectedShadow: selectedShadow,
        unselectedShadow: unselectedShadow,
        height: buttonHeight,
        width: buttonWidth,
      );

      /// Padding adding
      /// when groupingType is row or column
      if (spacing != 0.0) {
        if (groupingType == GroupingType.row) {
          rebuidedButton = Padding(
            padding: EdgeInsets.symmetric(horizontal: spacing),
            child: rebuidedButton,
          );
        } else if (groupingType == GroupingType.column) {
          rebuidedButton = Padding(
            padding: EdgeInsets.symmetric(vertical: spacing),
            child: rebuidedButton,
          );
        }
      }

      rebuildedButtons.add(rebuidedButton);
    }
    return rebuildedButtons;
  }

  void _selectButton(int i) {
    if (isRadio) {
      for (final element in buttons) {
        element.selected=false;
      }
      buttons[i].selected=true;
    } else {
      buttons[i].selected=!buttons[i].selected;
    }
  }

}

