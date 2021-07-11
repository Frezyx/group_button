import 'package:flutter/material.dart';

class GroupCustomButton extends StatelessWidget {
  const GroupCustomButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.isSelected,
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
  }) : super(key: key);

  final String text;
  final void Function() onPressed;
  final bool isSelected;
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

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(30),
        boxShadow: isSelected ? selectedShadow : unselectedShadow,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(0.0),
          backgroundColor: isSelected
              ? MaterialStateProperty.all<Color?>(selectedColor)
              : MaterialStateProperty.all<Color?>(unselectedColor),
          shape: _buildShape(),
        ),
        child: Text(
          text,
          style: isSelected ? selectedTextStyle : unselectedTextStyle,
        ),
      ),
    );
  }

  MaterialStateProperty<OutlinedBorder>? _buildShape() {
    final color = isSelected
        ? selectedBorderColor ?? unselectedBorderColor
        : unselectedBorderColor;
    if (borderRadius != null) {
      return MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: borderRadius!,
          side: buildBorderSide(color),
        ),
      );
    } else {
      return MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          side: buildBorderSide(color),
        ),
      );
    }
  }

  BorderSide buildBorderSide(Color? color) {
    if (color != null) {
      return BorderSide(
        color: color,
      );
    }
    return BorderSide.none;
  }
}
