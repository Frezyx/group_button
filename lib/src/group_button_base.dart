// ignore_for_file: deprecated_member_use_from_same_package

import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:group_button/src/group_button_body.dart';
import 'package:group_button/src/options/defaults.dart';

class GroupButton extends StatelessWidget {
  const GroupButton({
    Key? key,
    required this.buttons,
    required this.onSelected,
    this.controller,
    this.options,
    this.onDisablePressed,
    this.isRadio = true,
    this.groupingType = GroupingType.wrap,
    this.direction,
    this.spacing = 10,
    this.runSpacing = 0,
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
    @Deprecated(
      'Use GroupButtonController selectedIndex field '
      'This feature was deprecated after v4.2.0 '
      'Field will be removed after version 5.0.0 of package',
    )
        this.selectedButton,
    @Deprecated(
      'Use GroupButtonController disabledIndexes field '
      'This feature was deprecated after v4.2.0 '
      'Field will be removed after version 5.0.0 of package',
    )
        this.disabledButtons = const [],
    @Deprecated(
      'Use GroupButtonController selectedIndexes field '
      'This feature was deprecated after v4.2.0 '
      'Field will be removed after version 5.0.0 of package',
    )
        this.selectedButtons,
  })  : assert(
          (isRadio && selectedButtons == null) ||
              (!isRadio && selectedButton == null),
          'You can use selectedButton field for isRadio [true] and selectedButtons field with isRadio [false]',
        ),
        super(key: key);

  /// Build group button for choising one button
  ///
  /// Selection callback [Function(int index) onSelected]
  /// calling only when button is seletced
  factory GroupButton.radio({
    required List<String> buttons,
    required Function(int index) onSelected,
    Function(int index)? onDisablePressed,
    EdgeInsets textPadding = EdgeInsets.zero,
    TextAlign textAlign = TextAlign.left,
    AlignmentGeometry? alignment,
    double? elevation,
    @Deprecated(
      'Use GroupButtonController disabledIndexes field '
      'This feature was deprecated after v4.2.0 '
      'Field will be removed after version 5.0.0 of package',
    )
        List<int> disabledButtons = const [],
    @Deprecated(
      'Use GroupButtonController selectedIndex field '
      'This feature was deprecated after v4.2.0 '
      'Field will be removed after version 5.0.0 of package',
    )
        int? selectedButton,
    Axis? direction,
    double spacing = 10,
    double runSpacing = 0,
    TextStyle? selectedTextStyle = defaultSelectedTextStyle,
    TextStyle? unselectedTextStyle = defaultUnselectedTextStyle,
    Color? selectedColor,
    Color? unselectedColor,
    Color? selectedBorderColor,
    Color? unselectedBorderColor,
    BorderRadius? borderRadius,
    List<BoxShadow> selectedShadow = defaultShadow,
    List<BoxShadow> unselectedShadow = defaultShadow,
    double? buttonWidth,
    double? buttonHeight,
    MainGroupAlignment mainGroupAlignment = MainGroupAlignment.center,
    CrossGroupAlignment crossGroupAlignment = CrossGroupAlignment.center,
    GroupRunAlignment groupRunAlignment = GroupRunAlignment.center,
    GroupingType groupingType = GroupingType.wrap,
    GroupButtonController? controller,
  }) =>
      GroupButton(
        buttons: buttons,
        disabledButtons: disabledButtons,
        selectedButton: selectedButton,
        onSelected: (index, _) => onSelected(index),
        onDisablePressed: onDisablePressed,
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
        buttonHeight: buttonHeight,
        mainGroupAlignment: mainGroupAlignment,
        crossGroupAlignment: crossGroupAlignment,
        groupRunAlignment: groupRunAlignment,
        groupingType: groupingType,
        textAlign: textAlign,
        textPadding: textPadding,
        alignment: alignment,
        elevation: elevation,
        controller: controller,
      );

  /// Build group button for choising several
  ///
  /// Selection callback [Function(int index, bool selected) onSelected]
  /// calling when button
  /// is seletced or unselected with [bool selected] field
  factory GroupButton.checkbox({
    required List<String> buttons,
    required Function(int index, bool selected) onSelected,
    Function(int index)? onDisablePressed,
    EdgeInsets textPadding = EdgeInsets.zero,
    TextAlign textAlign = TextAlign.left,
    AlignmentGeometry? alignment,
    double? elevation,
    @Deprecated(
      'Use GroupButtonController disabledIndexes field '
      'This feature was deprecated after v4.2.0 '
      'Field will be removed after version 5.0.0 of package',
    )
        List<int> disabledButtons = const [],
    @Deprecated(
      'Use GroupButtonController selectedIndexes field '
      'This feature was deprecated after v4.2.0 '
      'Field will be removed after version 5.0.0 of package',
    )
        List<int>? selectedButtons,
    Axis? direction,
    double spacing = 10,
    double runSpacing = 0,
    TextStyle? selectedTextStyle = defaultSelectedTextStyle,
    TextStyle? unselectedTextStyle = defaultUnselectedTextStyle,
    Color? selectedColor,
    Color? unselectedColor,
    Color? selectedBorderColor,
    Color? unselectedBorderColor,
    BorderRadius? borderRadius,
    List<BoxShadow> selectedShadow = defaultShadow,
    List<BoxShadow> unselectedShadow = defaultShadow,
    double? buttonWidth,
    double? buttonHeight,
    MainGroupAlignment mainGroupAlignment = MainGroupAlignment.center,
    CrossGroupAlignment crossGroupAlignment = CrossGroupAlignment.center,
    GroupRunAlignment groupRunAlignment = GroupRunAlignment.center,
    GroupingType groupingType = GroupingType.wrap,
    GroupButtonController? controller,
  }) =>
      GroupButton(
        isRadio: false,
        buttons: buttons,
        disabledButtons: disabledButtons,
        selectedButtons: selectedButtons,
        onSelected: onSelected,
        onDisablePressed: onDisablePressed,
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
        buttonHeight: buttonHeight,
        mainGroupAlignment: mainGroupAlignment,
        crossGroupAlignment: crossGroupAlignment,
        groupRunAlignment: groupRunAlignment,
        groupingType: groupingType,
        textAlign: textAlign,
        textPadding: textPadding,
        alignment: alignment,
        elevation: elevation,
        controller: controller,
      );

  /// [EdgeInsets] The inner padding of buttons [GroupButton]
  final EdgeInsets textPadding;

  /// [TextAlign] The buttons text alignment [GroupButton]
  final TextAlign textAlign;

  /// [Alignment] Text position inside the buttons in case [buttonWidth] or [buttonHeight] defined.
  final AlignmentGeometry? alignment;

  /// [double] The buttons' elevation.
  final double? elevation;

  /// [String] list that will be displayed on buttons in the [GroupButton]
  final List<String> buttons;

  /// [int] button ids that are disabled.
  @Deprecated(
    'Use GroupButtonController selectedIndex field '
    'This feature was deprecated after v4.2.0 '
    'Field will be removed after version 5.0.0 of package',
  )
  final List<int> disabledButtons;

  /// [int] button ids that is selected initially.
  /// /// Using when [isRadio] is false
  @Deprecated(
    'Use GroupButtonController selectedIndexes field '
    'This feature was deprecated after v4.2.0 '
    'Field will be removed after version 5.0.0 of package',
  )
  final List<int>? selectedButtons;

  /// [int] button initially selected id
  /// Using when [isRadio] is true
  @Deprecated(
    'Use GroupButtonController selectedIndex field '
    'This feature was deprecated after v4.2.0 '
    'Field will be removed after version 5.0.0 of package',
  )
  final int? selectedButton;

  /// Callback [Function] works by clicking on a group element
  ///
  /// Return int [index] of selected button and [isSelected] if [isRadio] = false
  final Function(int index, bool isSelected) onSelected;

  /// Callback [Function] works by clicking on a disabled group element
  ///
  /// Return int [index] of selected button
  final Function(int index)? onDisablePressed;

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

  /// Controller to making widget logic
  final GroupButtonController? controller;

  /// UI settings of package
  final GroupButtonOptions? options;

  @override
  Widget build(BuildContext context) {
    return GroupButtonBody(
      controller: controller,
      buttons: buttons,
      disabledButtons: disabledButtons,
      selectedButtons: selectedButtons,
      selectedButton: selectedButton,
      onSelected: onSelected,
      onDisablePressed: onDisablePressed,
      isRadio: isRadio,
      direction: options?.direction ?? direction,
      spacing: options?.spacing ?? spacing,
      runSpacing: options?.runSpacing ?? runSpacing,
      selectedTextStyle: options?.selectedTextStyle ?? selectedTextStyle,
      unselectedTextStyle: options?.unselectedTextStyle ?? unselectedTextStyle,
      selectedColor: options?.selectedColor ?? selectedColor,
      unselectedColor: options?.unselectedColor ?? unselectedColor,
      selectedBorderColor: options?.selectedBorderColor ?? selectedBorderColor,
      unselectedBorderColor:
          options?.unselectedBorderColor ?? unselectedBorderColor,
      borderRadius: options?.borderRadius ?? borderRadius,
      selectedShadow: options?.selectedShadow ?? selectedShadow,
      unselectedShadow: options?.unselectedShadow ?? unselectedShadow,
      buttonWidth: options?.buttonWidth ?? buttonWidth,
      buttonHeigth: options?.buttonHeight ?? buttonHeight,
      mainGroupAlignment: options?.mainGroupAlignment ?? mainGroupAlignment,
      crossGroupAlignment: options?.crossGroupAlignment ?? crossGroupAlignment,
      groupRunAlignment: options?.groupRunAlignment ?? groupRunAlignment,
      groupingType: options?.groupingType ?? groupingType,
      textAlign: options?.textAlign ?? textAlign,
      textPadding: options?.textPadding ?? textPadding,
      alignment: options?.alignment ?? alignment,
      elevation: options?.elevation ?? elevation,
    );
  }
}
