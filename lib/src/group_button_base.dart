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
    this.isRadio = true,
    this.onDisablePressed,
    this.buttonBuilder,
    this.enableDeselect = false,
    @Deprecated('Use GroupButtonOptions groupingType field '
        'This feature was deprecated after version 4.3.0 ')
        this.groupingType = GroupingType.wrap,
    @Deprecated('Use GroupButtonOptions direction field '
        'This feature was deprecated after version 4.3.0 ')
        this.direction,
    @Deprecated('Use GroupButtonOptions spacing field '
        'This feature was deprecated after version 4.3.0 ')
        this.spacing = 10,
    @Deprecated('Use GroupButtonOptions runSpacing field '
        'This feature was deprecated after version 4.3.0 ')
        this.runSpacing = 0,
    @Deprecated('Use GroupButtonOptions selectedTextStyle field '
        'This feature was deprecated after version 4.3.0 ')
        this.selectedTextStyle = defaultSelectedTextStyle,
    @Deprecated('Use GroupButtonOptions unselectedTextStyle field '
        'This feature was deprecated after version 4.3.0 ')
        this.unselectedTextStyle = defaultUnselectedTextStyle,
    @Deprecated('Use GroupButtonOptions selectedColor field '
        'This feature was deprecated after version 4.3.0 ')
        this.selectedColor,
    @Deprecated('Use GroupButtonOptions unselectedColor field '
        'This feature was deprecated after version 4.3.0 ')
        this.unselectedColor,
    @Deprecated('Use GroupButtonOptions selectedBorderColor field '
        'This feature was deprecated after version 4.3.0 ')
        this.selectedBorderColor,
    @Deprecated('Use GroupButtonOptions unselectedBorderColor field '
        'This feature was deprecated after version 4.3.0 ')
        this.unselectedBorderColor,
    @Deprecated('Use GroupButtonOptions borderRadius field '
        'This feature was deprecated after version 4.3.0 ')
        this.borderRadius,
    @Deprecated('Use GroupButtonOptions selectedShadow field '
        'This feature was deprecated after version 4.3.0 ')
        this.selectedShadow = defaultShadow,
    @Deprecated('Use GroupButtonOptions unselectedShadow field '
        'This feature was deprecated after version 4.3.0 ')
        this.unselectedShadow = defaultShadow,
    @Deprecated('Use GroupButtonOptions buttonHeight field '
        'This feature was deprecated after version 4.3.0 ')
        this.buttonHeight,
    @Deprecated('Use GroupButtonOptions buttonWidth field '
        'This feature was deprecated after version 4.3.0 ')
        this.buttonWidth,
    @Deprecated('Use GroupButtonOptions mainGroupAlignment field '
        'This feature was deprecated after version 4.3.0 ')
        this.mainGroupAlignment = MainGroupAlignment.center,
    @Deprecated('Use GroupButtonOptions crossGroupAlignment field '
        'This feature was deprecated after version 4.3.0 ')
        this.crossGroupAlignment = CrossGroupAlignment.center,
    @Deprecated('Use GroupButtonOptions groupRunAlignment field '
        'This feature was deprecated after version 4.3.0 ')
        this.groupRunAlignment = GroupRunAlignment.center,
    @Deprecated('Use GroupButtonOptions textAlign field '
        'This feature was deprecated after version 4.3.0 ')
        this.textAlign = TextAlign.left,
    @Deprecated('Use GroupButtonOptions textPadding field '
        'This feature was deprecated after version 4.3.0 ')
        this.textPadding = EdgeInsets.zero,
    @Deprecated('Use GroupButtonOptions alignment field '
        'This feature was deprecated after version 4.3.0 ')
        this.alignment,
    @Deprecated('Use GroupButtonOptions elevation field '
        'This feature was deprecated after version 4.3.0 ')
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

  /// bool variable for switching between modes [CheckBox] and [Radio]
  ///
  /// if the [isRadio] = true, only one button can be selected
  /// if the [isRadio] = false, you can select several at once
  final bool isRadio;

  /// bool variable for enable radio button to be deselected
  ///
  /// * if the [isRadio] = true :
  /// - if the [enableDeselect] = true , the selected radio button can be deselected
  /// - if the [enableDeselect] = false , the selected radio button can't be deselected
  ///
  /// * if the [isRadio] = false:
  /// - [enableDeselect] have no effect
  final bool? enableDeselect;

  /// [EdgeInsets] The inner padding of buttons [GroupButton]
  @Deprecated(
    'Use GroupButtonOptions textPadding field '
    'This feature was deprecated after version 4.3.0 ',
  )
  final EdgeInsets textPadding;

  /// [TextAlign] The buttons text alignment [GroupButton]
  @Deprecated(
    'Use GroupButtonOptions textAlign field '
    'This feature was deprecated after version 4.3.0 ',
  )
  final TextAlign textAlign;

  /// [Alignment] Text position inside the buttons in case [buttonWidth] or [buttonHeight] defined.
  @Deprecated(
    'Use GroupButtonOptions alignment field '
    'This feature was deprecated after version 4.3.0 ',
  )
  final AlignmentGeometry? alignment;

  /// [double] The buttons' elevation.
  @Deprecated(
    'Use GroupButtonOptions elevation field '
    'This feature was deprecated after version 4.3.0 ',
  )
  final double? elevation;

  /// The direction of arrangement of the buttons in [GroupButton]
  @Deprecated(
    'Use GroupButtonOptions direction field '
    'This feature was deprecated after version 4.3.0 ',
  )
  final Axis? direction;

  /// The spacing between buttons inside [GroupButton]
  @Deprecated(
    'Use GroupButtonOptions spacing field '
    'This feature was deprecated after version 4.3.0 ',
  )
  final double spacing;

  /// When [groupingType] is [GroupingType.wrap]
  /// this field sets Wrap [runSpacing]
  @Deprecated(
    'Use GroupButtonOptions runSpacing field '
    'This feature was deprecated after version 4.3.0 ',
  )
  final double runSpacing;

  /// [TextStyle] of text of selected button(s)
  @Deprecated(
    'Use GroupButtonOptions selectedTextStyle field '
    'This feature was deprecated after version 4.3.0 ',
  )
  final TextStyle? selectedTextStyle;

  /// [TextStyle] of text of unselected buttons
  @Deprecated(
    'Use GroupButtonOptions unselectedTextStyle field '
    'This feature was deprecated after version 4.3.0 ',
  )
  final TextStyle? unselectedTextStyle;

  /// background [Color] of selected button(s)
  @Deprecated(
    'Use GroupButtonOptions selectedColor field '
    'This feature was deprecated after version 4.3.0 ',
  )
  final Color? selectedColor;

  /// background [Color] of  unselected buttons
  @Deprecated(
    'Use GroupButtonOptions unselectedColor field '
    'This feature was deprecated after version 4.3.0 ',
  )
  final Color? unselectedColor;

  /// border [Color] of selected button(s)
  @Deprecated(
    'Use GroupButtonOptions selectedBorderColor field '
    'This feature was deprecated after version 4.3.0 ',
  )
  final Color? selectedBorderColor;

  /// border [Color] of  unselected buttons
  @Deprecated(
    'Use GroupButtonOptions unselectedBorderColor field '
    'This feature was deprecated after version 4.3.0 ',
  )
  final Color? unselectedBorderColor;

  /// [BorderRadius] of  buttons
  /// How much the button will be rounded
  @Deprecated(
    'Use GroupButtonOptions borderRadius field '
    'This feature was deprecated after version 4.3.0 ',
  )
  final BorderRadius? borderRadius;

  /// list of selected button(s) [BoxShadow]
  @Deprecated(
    'Use GroupButtonOptions selectedShadow field '
    'This feature was deprecated after version 4.3.0 ',
  )
  final List<BoxShadow> selectedShadow;

  /// list of unselected buttons [BoxShadow]
  @Deprecated(
    'Use GroupButtonOptions unselectedShadow field '
    'This feature was deprecated after version 4.3.0 ',
  )
  final List<BoxShadow> unselectedShadow;

  /// Height of Group button
  @Deprecated(
    'Use GroupButtonOptions buttonHeight field '
    'This feature was deprecated after version 4.3.0 ',
  )
  final double? buttonHeight;

  /// Width of group button
  @Deprecated(
    'Use GroupButtonOptions buttonWidth field '
    'This feature was deprecated after version 4.3.0 ',
  )
  final double? buttonWidth;

  /// How the buttons should be placed in the main axis in a layout
  @Deprecated(
    'Use GroupButtonOptions mainGroupAlignment field '
    'This feature was deprecated after version 4.3.0 ',
  )
  final MainGroupAlignment mainGroupAlignment;

  /// How the buttons should be placed along the cross axis in a layout
  @Deprecated(
    'Use GroupButtonOptions crossGroupAlignment field '
    'This feature was deprecated after version 4.3.0 ',
  )
  final CrossGroupAlignment crossGroupAlignment;

  /// How the button runs themselves should be placed along the cross axis in a layout
  @Deprecated(
    'Use GroupButtonOptions groupRunAlignment field '
    'This feature was deprecated after version 4.3.0 ',
  )
  final GroupRunAlignment groupRunAlignment;

  /// The field is responsible for how the buttons will be grouped
  @Deprecated(
    'Use GroupButtonOptions groupingType field '
    'This feature was deprecated after version 4.3.0 ',
  )
  final GroupingType groupingType;

  /// Controller to making widget logic
  final GroupButtonController? controller;

  /// UI settings of package
  final GroupButtonOptions? options;

  final Widget Function(
    bool selected,
    int index,
    BuildContext context,
  )? buttonBuilder;

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
      buttonBuilder: buttonBuilder,
      enableDeselect: enableDeselect,

      /// Options
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
