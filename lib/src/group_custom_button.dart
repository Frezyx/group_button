import 'package:flutter/material.dart';

class GroupCustomButton extends StatelessWidget {
  const GroupCustomButton({
    Key key,
    @required this.onPressed,
    @required this.text,
    @required this.isSelected,
    this.selectedTextStyle,
    this.unselectedTextStyle,
    this.selectedColor,
    this.unselectedColor,
    this.selectedBorderColor,
    this.unselectedBorderColor,
    this.borderRadius,
    this.selectedShadow,
    this.unselectedShadow,
  }) : super(key: key);

  final String text;
  final void Function() onPressed;
  final bool isSelected;
  final TextStyle selectedTextStyle;
  final TextStyle unselectedTextStyle;
  final Color selectedColor;
  final Color unselectedColor;
  final Color selectedBorderColor;
  final Color unselectedBorderColor;
  final BorderRadius borderRadius;
  final List<BoxShadow> selectedShadow;
  final List<BoxShadow> unselectedShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(30),
        boxShadow: isSelected ? selectedShadow : unselectedShadow,
      ),
      child: RaisedButton(
        elevation: 0,
        color: isSelected ? selectedColor : unselectedColor,
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(30),
          side: BorderSide(
            color: isSelected ? selectedBorderColor : unselectedBorderColor,
          ),
        ),
        focusColor: selectedColor,
        splashColor: selectedColor,
        highlightColor: selectedColor,
        child: Text(
          text,
          style: isSelected ? selectedTextStyle : unselectedTextStyle,
        ),
      ),
    );
  }
}
