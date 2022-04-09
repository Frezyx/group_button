import 'package:flutter/material.dart';

import 'package:group_button/group_button.dart';
import 'package:group_button/src/options/defaults.dart';

/// UI settings of package
class GroupButtonOptions {
  const GroupButtonOptions({
    this.groupingType = GroupingType.wrap,
    this.direction,
    this.spacing = 10,
    this.runSpacing = 10,
    this.selectedTextStyle = defaultSelectedTextStyle,
    this.unselectedTextStyle = defaultUnselectedTextStyle,
    this.selectedColor,
    this.unselectedColor,
    this.selectedBorderColor,
    this.unselectedBorderColor,
    this.borderRadius,
    this.selectedShadow = defaultShadow,
    this.unselectedShadow = defaultShadow,
    this.buttonHeight,
    this.buttonWidth,
    this.mainGroupAlignment = MainGroupAlignment.center,
    this.crossGroupAlignment = CrossGroupAlignment.center,
    this.groupRunAlignment = GroupRunAlignment.center,
    this.textAlign = TextAlign.left,
    this.textPadding = EdgeInsets.zero,
    this.alignment,
    this.elevation,
  });

  /// [EdgeInsets] The inner padding of buttons [GroupButton]
  final EdgeInsets textPadding;

  /// [TextAlign] The buttons text alignment [GroupButton]
  final TextAlign textAlign;

  /// [Alignment] Text position inside the buttons in case [buttonWidth] or [buttonHeight] defined.
  final AlignmentGeometry? alignment;

  /// [double] The buttons' elevation.
  final double? elevation;

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
}
