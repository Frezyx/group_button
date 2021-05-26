import 'package:flutter/material.dart';

class GroupCustomButton extends StatelessWidget {
  const GroupCustomButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.image,
    required this.isSelected,
    this.selectedTextStyle,
    this.unselectedTextStyle,
    this.selectedColor,
    this.unselectedColor,
    required this.selectedBorderColor,
    required this.unselectedBorderColor,
    this.borderRadius,
    this.selectedShadow,
    this.unselectedShadow,
    this.height,
    this.width,
  }) : super(key: key);

  final String text;
  final String image;
  final void Function() onPressed;
  final bool isSelected;
  final TextStyle? selectedTextStyle;
  final TextStyle? unselectedTextStyle;
  final Color? selectedColor;
  final Color? unselectedColor;
  final Color selectedBorderColor;
  final Color unselectedBorderColor;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? selectedShadow;
  final List<BoxShadow>? unselectedShadow;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    print(image.toString());
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(30),
        boxShadow: isSelected ? selectedShadow : unselectedShadow,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          side: BorderSide(
            color: isSelected ? selectedBorderColor : unselectedBorderColor,
          ),
          elevation: 0.0,
          primary: isSelected ? selectedColor : unselectedColor,
          minimumSize: Size.zero, // <-- Add this
          padding: EdgeInsets.zero, // <-- and this
        ),
        // child: Text(
        //   text,
        //   style: isSelected ? selectedTextStyle : unselectedTextStyle,
        // ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              new Text(
                '    $text',
                style: isSelected ? selectedTextStyle : unselectedTextStyle,
              ),
              new Image.asset(
                image,
                width: 145,
                height: 49,
              ),
            ]),
      ),
    );
  }
}
