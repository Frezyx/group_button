import 'package:flutter/material.dart';

class GroupCustomButton extends StatelessWidget {
  const GroupCustomButton({
    Key key,
    @required this.onPressed,
    @required this.text,
    @required this.isSelected,
    this.textStyle = const TextStyle(fontSize: 14),
    this.size,
    this.selectedColor = Colors.green,
    this.unselectedColor = Colors.white,
    this.borderRadius,
    this.selectedShadow = _defaultShadow,
    this.unselectedShadow = _defaultShadow,
  }) : super(key: key);

  final String text;
  final Function onPressed;
  final bool isSelected;
  final TextStyle textStyle;
  final double size;
  final Color selectedColor;
  final Color unselectedColor;
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
          style: textStyle,
        ),
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          side: BorderSide(
              color: isSelected ? Colors.transparent : selectedColor),
        ),
        focusColor: selectedColor,
        splashColor: selectedColor,
        highlightColor: selectedColor,
      ),
    );
  }
}

const _defaultShadow = const <BoxShadow>[
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
