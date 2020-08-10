library group_button;

import 'package:flutter/material.dart';
import 'src/blocs/group_button_bloc.dart';
import 'src/group_button_body.dart';
import 'package:provider/provider.dart';

export 'src/group_custom_button.dart';

class GroupButton extends StatelessWidget {
  const GroupButton({
    Key key,
    @required this.buttons,
    @required this.onSelected,
    this.isRadio = true,
    this.direction,
    this.spacing,
    this.selectedTextStyle = _defaultSelectedTextStyle,
    this.unselectedTextStyle = _defaultUnselectedTextStyle,
    this.selectedColor = _defaultSelectedColor,
    this.unselectedColor = _defaultUnselectedColor,
    this.selectedBorderColor = Colors.transparent,
    this.unselectedBorderColor = Colors.transparent,
    this.borderRadius,
    this.selectedShadow = _defaultShadow,
    this.unselectedShadow = _defaultShadow,
  }) : super(key: key);

  final List<String> buttons;
  final Function(int, bool) onSelected;
  final bool isRadio;
  final Axis direction;
  final double spacing;
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
    return ChangeNotifierProvider<GroupButtonBloc>(
      create: (_) => GroupButtonBloc(),
      child: GroupButtonBody(
        buttons: buttons,
        onSelected: onSelected,
        isRadio: isRadio,
        direction: direction,
        spacing: spacing,
        selectedTextStyle: selectedTextStyle,
        unselectedTextStyle: unselectedTextStyle,
        selectedColor: selectedColor,
        unselectedColor: unselectedColor,
        selectedBorderColor: selectedBorderColor,
        unselectedBorderColor: unselectedBorderColor,
        borderRadius: borderRadius,
        selectedShadow: selectedShadow,
        unselectedShadow: unselectedShadow,
      ),
    );
  }

  static const _defaultShadow = const <BoxShadow>[
    BoxShadow(
      color: Color.fromARGB(18, 18, 18, 20),
      blurRadius: 25.0,
      spreadRadius: 1.0,
      offset: Offset(
        0.0,
        2.0,
      ),
    )
  ];

  static const _defaultSelectedTextStyle =
      TextStyle(fontSize: 14, color: Colors.white);
  static const _defaultUnselectedTextStyle =
      TextStyle(fontSize: 14, color: Colors.black);

  static const Color _defaultSelectedColor = Colors.green;
  static const Color _defaultUnselectedColor = Colors.white;
}
