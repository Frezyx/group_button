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
  final Function onPressed;
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
        borderRadius: borderRadius ?? BorderRadius.circular(30.0),
        boxShadow: isSelected
            ? selectedShadow ?? unselectedShadow
            : unselectedShadow ?? selectedShadow,
      ),
      child: RaisedButton(
        elevation: 0,
        color: isSelected ? selectedColor : unselectedColor,
        child: Text(
          text,
          style: isSelected ? selectedTextStyle : unselectedTextStyle,
        ),
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          side: BorderSide(
              color: isSelected
                  ? selectedBorderColor ?? Colors.transparent
                  : unselectedBorderColor ?? Colors.transparent),
        ),
        focusColor: selectedColor,
        splashColor: selectedColor,
        highlightColor: selectedColor,
      ),
    );
  }
}
