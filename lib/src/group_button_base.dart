// ignore_for_file: deprecated_member_use_from_same_package

import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:group_button/src/group_button_body.dart';

class GroupButton<T> extends StatelessWidget {
  const GroupButton({
    Key? key,
    required this.buttons,
    this.onSelected,
    this.controller,
    this.options = const GroupButtonOptions(),
    this.isRadio = true,
    this.buttonIndexedBuilder,
    this.buttonBuilder,
    this.buttonIndexedTextBuilder,
    this.buttonTextBuilder,
    this.enableDeselect = false,
    this.maxSelected,
    @Deprecated(
      'Use GroupButtonController onDisabledButtonPressed field '
      'This feature was deprecated after version 4.6.0 ',
    )
    this.onDisablePressed,
  })  : assert(
          maxSelected != null ? maxSelected >= 0 : true,
          'maxSelected must not be negative',
        ),
        assert((buttonBuilder == null && buttonIndexedBuilder == null) ||
            !(buttonBuilder != null && buttonIndexedBuilder != null)),
        super(key: key);

  /// [String] list that will be displayed on buttons in the [GroupButton]
  final List<T> buttons;

  /// Callback [Function] works by clicking on a group element
  ///
  /// Return int [index] of selected button and [isSelected] if [isRadio] = false
  final Function(T value, int index, bool isSelected)? onSelected;

  /// Callback [Function] works by clicking on a disabled group element
  ///
  /// Return int [index] of selected button
  @Deprecated(
    'Use GroupButtonController onDisabledButtonPressed field '
    'This feature was deprecated after version 4.6.0 ',
  )
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

  /// int variable for setting max selected buttons for [CheckBox]
  ///
  /// [maxSelected] must not be negative.
  final int? maxSelected;

  /// Controller to making widget logic
  final GroupButtonController? controller;

  /// UI settings of package
  final GroupButtonOptions options;

  /// Custom builder method to create
  /// Your own custom buttons by button [int] index
  final GroupButtonIndexedBuilder? buttonIndexedBuilder;

  /// Custom builder method to create
  /// Your own custom buttons by button [T] value
  final GroupButtonValueBuilder<T>? buttonBuilder;

  /// This is a custom builder method that
  /// allows you to set your own custom text for buttons based on their [index].
  ///
  /// If you do not set up [buttonIndexedBuilder] and [buttonBuilder],
  /// the text will be displayed on top of the button.
  final GroupButtonIndexedTextBuilder? buttonIndexedTextBuilder;

  /// This is a custom builder method that
  /// allows you to set your own custom text for buttons based on their [value].
  ///
  /// If you do not set up [buttonIndexedBuilder] and [buttonBuilder],
  /// the text will be displayed on top of the button.
  final GroupbuttonTextBuilder<T>? buttonTextBuilder;

  @override
  Widget build(BuildContext context) {
    return GroupButtonBody<T>(
      controller: controller,
      buttons: buttons,
      onSelected: onSelected,
      onDisablePressed: onDisablePressed,
      isRadio: isRadio,
      buttonIndexedBuilder: buttonIndexedBuilder,
      buttonBuilder: buttonBuilder,
      buttonIndexedTextBuilder: buttonIndexedTextBuilder,
      buttonTextBuilder: buttonTextBuilder,
      enableDeselect: enableDeselect,
      maxSelected: maxSelected,

      /// Options
      direction: options.direction,
      spacing: options.spacing,
      runSpacing: options.runSpacing,
      selectedTextStyle: options.selectedTextStyle,
      unselectedTextStyle: options.unselectedTextStyle,
      selectedColor: options.selectedColor,
      unselectedColor: options.unselectedColor,
      selectedBorderColor: options.selectedBorderColor,
      unselectedBorderColor: options.unselectedBorderColor,
      borderRadius: options.borderRadius,
      borderWidth: options.borderWidth,
      selectedShadow: options.selectedShadow,
      unselectedShadow: options.unselectedShadow,
      disableTappingShadow: options.disableTappingShadow,
      buttonWidth: options.buttonWidth,
      buttonHeight: options.buttonHeight,
      mainGroupAlignment: options.mainGroupAlignment,
      crossGroupAlignment: options.crossGroupAlignment,
      groupRunAlignment: options.groupRunAlignment,
      groupingType: options.groupingType,
      textAlign: options.textAlign,
      textPadding: options.textPadding,
      alignment: options.alignment,
      elevation: options.elevation,
    );
  }
}
