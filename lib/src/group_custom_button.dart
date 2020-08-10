import 'package:flutter/material.dart';

class GroupCustomButton extends StatelessWidget {
  const GroupCustomButton({
    Key key,
    @required this.onPressed,
    @required this.text,
    @required this.isSelected,
    this.selectedTextStyle = _defaultSelectedTextStyle,
    this.unselectedTextStyle = _defaultUnselectedTextStyle,
    this.size,
    this.selectedColor = Colors.green,
    this.unselectedColor = Colors.white,
    this.selectedBorderColor = Colors.green,
    this.unselectedBorderColor = Colors.transparent,
    this.borderRadius,
    this.selectedShadow = _defaultShadow,
    this.unselectedShadow = _defaultShadow,
  }) : super(key: key);

  final String text;
  final Function onPressed;
  final bool isSelected;
  final TextStyle selectedTextStyle;
  final TextStyle unselectedTextStyle;
  final double size;
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
      height: size == null ? MediaQuery.of(context).size.height * 0.045 : size,
      width:
          size == null ? MediaQuery.of(context).size.height * 0.11 : size * 3.5,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(30.0),
        boxShadow: isSelected
            ? selectedShadow ?? unselectedShadow ?? _defaultShadow
            : unselectedShadow ?? selectedShadow ?? _defaultShadow,
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
              color: isSelected ? selectedBorderColor : unselectedBorderColor),
        ),
        focusColor: selectedColor,
        splashColor: selectedColor,
        highlightColor: selectedColor,
      ),
    );
  }

  static const _defaultShadow = const <BoxShadow>[
    BoxShadow(
      color: Colors.black12,
      blurRadius: 20.0,
      spreadRadius: 2.0,
      offset: Offset(
        0.0,
        3.0,
      ),
    )
  ];

  static const _defaultSelectedTextStyle =
      TextStyle(fontSize: 14, color: Colors.white);
  static const _defaultUnselectedTextStyle =
      TextStyle(fontSize: 14, color: Colors.black);
}
