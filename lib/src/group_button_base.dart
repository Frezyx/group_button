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
    GroupButtonController? controller,
    GroupButtonOptions? options,
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
  }) =>
      GroupButton(
        buttons: buttons,
        options: options,
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
    GroupButtonController? controller,
    GroupButtonOptions? options,
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

  /// [EdgeInsets] The inner padding of buttons [GroupButton]
  @Deprecated(
    'Use GroupButtonOptions textPadding field '
    'This feature was deprecated after version 5.0.0 ',
  )
  final EdgeInsets textPadding;

  /// [TextAlign] The buttons text alignment [GroupButton]
  @Deprecated(
    'Use GroupButtonOptions textAlign field '
    'This feature was deprecated after version 5.0.0 ',
  )
  final TextAlign textAlign;

  /// [Alignment] Text position inside the buttons in case [buttonWidth] or [buttonHeight] defined.
  @Deprecated(
    'Use GroupButtonOptions alignment field '
    'This feature was deprecated after version 5.0.0 ',
  )
  final AlignmentGeometry? alignment;

  /// [double] The buttons' elevation.
  @Deprecated(
    'Use GroupButtonOptions elevation field '
    'This feature was deprecated after version 5.0.0 ',
  )
  final double? elevation;

  /// The direction of arrangement of the buttons in [GroupButton]
  @Deprecated(
    'Use GroupButtonOptions direction field '
    'This feature was deprecated after version 5.0.0 ',
  )
  final Axis? direction;

  /// The spacing between buttons inside [GroupButton]
  @Deprecated(
    'Use GroupButtonOptions spacing field '
    'This feature was deprecated after version 5.0.0 ',
  )
  final double spacing;

  /// When [groupingType] is [GroupingType.wrap]
  /// this field sets Wrap [runSpacing]
  @Deprecated(
    'Use GroupButtonOptions runSpacing field '
    'This feature was deprecated after version 5.0.0 ',
  )
  final double runSpacing;

  /// [TextStyle] of text of selected button(s)
  @Deprecated(
    'Use GroupButtonOptions selectedTextStyle field '
    'This feature was deprecated after version 5.0.0 ',
  )
  final TextStyle? selectedTextStyle;

  /// [TextStyle] of text of unselected buttons
  @Deprecated(
    'Use GroupButtonOptions unselectedTextStyle field '
    'This feature was deprecated after version 5.0.0 ',
  )
  final TextStyle? unselectedTextStyle;

  /// background [Color] of selected button(s)
  @Deprecated(
    'Use GroupButtonOptions selectedColor field '
    'This feature was deprecated after version 5.0.0 ',
  )
  final Color? selectedColor;

  /// background [Color] of  unselected buttons
  @Deprecated(
    'Use GroupButtonOptions unselectedColor field '
    'This feature was deprecated after version 5.0.0 ',
  )
  final Color? unselectedColor;

  /// border [Color] of selected button(s)
  @Deprecated(
    'Use GroupButtonOptions selectedBorderColor field '
    'This feature was deprecated after version 5.0.0 ',
  )
  final Color? selectedBorderColor;

  /// border [Color] of  unselected buttons
  @Deprecated(
    'Use GroupButtonOptions unselectedBorderColor field '
    'This feature was deprecated after version 5.0.0 ',
  )
  final Color? unselectedBorderColor;

  /// [BorderRadius] of  buttons
  /// How much the button will be rounded
  @Deprecated(
    'Use GroupButtonOptions borderRadius field '
    'This feature was deprecated after version 5.0.0 ',
  )
  final BorderRadius? borderRadius;

  /// list of selected button(s) [BoxShadow]
  @Deprecated(
    'Use GroupButtonOptions selectedShadow field '
    'This feature was deprecated after version 5.0.0 ',
  )
  final List<BoxShadow> selectedShadow;

  /// list of unselected buttons [BoxShadow]
  @Deprecated(
    'Use GroupButtonOptions unselectedShadow field '
    'This feature was deprecated after version 5.0.0 ',
  )
  final List<BoxShadow> unselectedShadow;

  /// Height of Group button
  @Deprecated(
    'Use GroupButtonOptions buttonHeight field '
    'This feature was deprecated after version 5.0.0 ',
  )
  final double? buttonHeight;

  /// Width of group button
  @Deprecated(
    'Use GroupButtonOptions buttonWidth field '
    'This feature was deprecated after version 5.0.0 ',
  )
  final double? buttonWidth;

  /// How the buttons should be placed in the main axis in a layout
  @Deprecated(
    'Use GroupButtonOptions mainGroupAlignment field '
    'This feature was deprecated after version 5.0.0 ',
  )
  final MainGroupAlignment mainGroupAlignment;

  /// How the buttons should be placed along the cross axis in a layout
  @Deprecated(
    'Use GroupButtonOptions crossGroupAlignment field '
    'This feature was deprecated after version 5.0.0 ',
  )
  final CrossGroupAlignment crossGroupAlignment;

  /// How the button runs themselves should be placed along the cross axis in a layout
  @Deprecated(
    'Use GroupButtonOptions groupRunAlignment field '
    'This feature was deprecated after version 5.0.0 ',
  )
  final GroupRunAlignment groupRunAlignment;

  /// The field is responsible for how the buttons will be grouped
  @Deprecated(
    'Use GroupButtonOptions groupingType field '
    'This feature was deprecated after version 5.0.0 ',
  )
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
