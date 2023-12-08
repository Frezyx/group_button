import 'package:flutter/material.dart';

class GroupButtonItem extends StatelessWidget {
  const GroupButtonItem({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.isSelected,
    required this.isDisable,
    this.selectedBorderColor,
    this.unselectedBorderColor,
    this.selectedTextStyle,
    this.unselectedTextStyle,
    this.selectedColor,
    this.unselectedColor,
    this.borderRadius,
    this.selectedShadow,
    this.unselectedShadow,
    this.height,
    this.width,
    this.textAlign,
    this.textPadding,
    this.alignment,
    this.elevation,
  }) : super(key: key);

  final String text;
  final void Function()? onPressed;
  final bool isSelected;
  final bool isDisable;
  final TextStyle? selectedTextStyle;
  final TextStyle? unselectedTextStyle;
  final Color? selectedColor;
  final Color? unselectedColor;
  final Color? selectedBorderColor;
  final Color? unselectedBorderColor;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? selectedShadow;
  final List<BoxShadow>? unselectedShadow;
  final double? height;
  final double? width;
  final TextAlign? textAlign;
  final EdgeInsets? textPadding;
  final AlignmentGeometry? alignment;
  final double? elevation;

  bool get isEnabled => !isDisable;

  List<BoxShadow>? get _boxShadow => isSelected
      ? selectedShadow
      : isEnabled
          ? unselectedShadow
          : null;

  TextStyle? get _textStyle => isSelected
      ? selectedTextStyle
      : isEnabled
          ? unselectedTextStyle
          : null;

  Color? get _borderColor => isSelected
      ? selectedBorderColor ?? unselectedBorderColor
      : isEnabled
          ? unselectedBorderColor
          : null;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        boxShadow: _boxShadow,
      ),
      child: !isDisable
          ? _customButton(context, onPressed)
          : GestureDetector(
              onTap: onPressed,
              child: _customButton(context, null),
            ),
    );
  }

  Widget _customButton(BuildContext context, void Function()? onPressed) {
    final theme = Theme.of(context);
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: elevation ?? 0.0,
        backgroundColor: _getBackgroundColor(theme),
        shape: _buildShape(),
        padding: (width != null || height != null) ? EdgeInsets.zero : null,
        alignment: (width != null || height != null) ? alignment : null,
      ),
      child: Padding(
        padding: textPadding ?? EdgeInsets.zero,
        child: Text(
          text,
          textAlign: textAlign,
          style: _textStyle,
        ),
      ),
    );
  }

  Color? _getBackgroundColor(ThemeData theme) {
    final themePrimaryColor = theme.buttonTheme.colorScheme?.primary;
    final themeSecondaryColor = theme.canvasColor;

    var selectedColorBuffer = selectedColor;
    var unselectedColorBuffer = unselectedColor;

    selectedColorBuffer ??= themePrimaryColor;
    unselectedColorBuffer ??= themeSecondaryColor;

    final color = isSelected
        ? selectedColorBuffer
        : isEnabled
            ? unselectedColorBuffer
            : null;
    return color;
  }

  OutlinedBorder? _buildShape() {
    final color = _borderColor;
    if (borderRadius != null) {
      return RoundedRectangleBorder(
        borderRadius: borderRadius!,
        side: buildBorderSide(color),
      );
    } else {
      return RoundedRectangleBorder(side: buildBorderSide(color));
    }
  }

  BorderSide buildBorderSide(Color? color) {
    if (color != null) {
      return BorderSide(color: color);
    }
    return BorderSide.none;
  }
}
