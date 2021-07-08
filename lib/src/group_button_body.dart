import 'package:flutter/material.dart';
import 'package:group_button/src/utils/utils.dart';
import 'group_custom_button.dart';

class GroupButtonBody extends StatefulWidget {
  const GroupButtonBody({
    Key? key,
    required this.buttons,
    required this.onSelected,
    required this.selectedBorderColor,
    required this.unselectedBorderColor,
    this.selectedButtons,
    this.selectedButton,
    this.isRadio = false,
    this.direction,
    this.spacing = 0.0,
    this.selectedTextStyle,
    this.unselectedTextStyle,
    this.selectedColor,
    this.unselectedColor,
    this.borderRadius = BorderRadius.zero,
    this.selectedShadow = const [],
    this.unselectedShadow = const [],
    this.buttonWidth,
    this.buttonHeigth,
    this.mainGroupAlignment = MainGroupAlignment.center,
    this.crossGroupAlignment = CrossGroupAlignment.center,
    this.groupRunAlignment = GroupRunAlignment.center,
  }) : super(key: key);

  final List<String> buttons;
  final List<int>? selectedButtons;
  final int? selectedButton;
  final Function(int, bool) onSelected;
  final bool isRadio;
  final Axis? direction;
  final double spacing;
  final TextStyle? selectedTextStyle;
  final TextStyle? unselectedTextStyle;
  final Color? selectedColor;
  final Color? unselectedColor;
  final Color selectedBorderColor;
  final Color unselectedBorderColor;
  final BorderRadius? borderRadius;
  final List<BoxShadow> selectedShadow;
  final List<BoxShadow> unselectedShadow;
  final double? buttonWidth;
  final double? buttonHeigth;

  final MainGroupAlignment mainGroupAlignment;
  final CrossGroupAlignment crossGroupAlignment;
  final GroupRunAlignment groupRunAlignment;
  @override
  _GroupButtonBodyState createState() => _GroupButtonBodyState();
}

class _GroupButtonBodyState extends State<GroupButtonBody> {
  var _selectedIndex = 0;
  final Map<int, bool> _selectedIndexes = {};

  @override
  void initState() {
    if (widget.selectedButtons != null && widget.selectedButtons!.isNotEmpty) {
      // ignore: avoid_function_literals_in_foreach_calls
      widget.selectedButtons!.forEach((e) {
        _selectedIndexes[e] = true;
      });
      setState(() {});
    }
    if (widget.selectedButton != null) {
      setState(() => _selectedIndex = widget.selectedButton!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: widget.direction ?? Axis.horizontal,
      spacing: widget.spacing,
      runSpacing: widget.spacing,
      crossAxisAlignment: widget.crossGroupAlignment.toWrap(),
      runAlignment: widget.groupRunAlignment.toWrap(),
      alignment: widget.mainGroupAlignment.toWrap(),
      children: _buildButtonsList(widget.buttons),
    );
  }

  bool _getCond(int i) {
    return widget.isRadio
        ? i == _selectedIndex
        : _selectedIndexes.containsKey(i) && _selectedIndexes[i] == true;
  }

  List<GroupCustomButton> _buildButtonsList(
    List<String> buttons,
  ) {
    final rebuildedButtons = <GroupCustomButton>[];
    for (var i = 0; i < buttons.length; i++) {
      final rebuidedButton = GroupCustomButton(
        text: buttons[i],
        onPressed: () {
          _selectButton(i);
          widget.onSelected(
            i,
            _getCond(i),
          );
        },
        isSelected: _getCond(i),
        selectedTextStyle: widget.selectedTextStyle,
        unselectedTextStyle: widget.unselectedTextStyle,
        selectedColor: widget.selectedColor,
        unselectedColor: widget.unselectedColor,
        selectedBorderColor: widget.selectedBorderColor,
        unselectedBorderColor: widget.unselectedBorderColor,
        borderRadius: widget.borderRadius,
        selectedShadow: widget.selectedShadow,
        unselectedShadow: widget.unselectedShadow,
        height: widget.buttonHeigth,
        width: widget.buttonWidth,
      );
      rebuildedButtons.add(rebuidedButton);
    }
    return rebuildedButtons;
  }

  void _selectButton(int i) {
    if (widget.isRadio) {
      setState(() => _selectedIndex = i);
    } else {
      if (_selectedIndexes.containsKey(i)) {
        setState(() => _selectedIndexes[i] = !_selectedIndexes[i]!);
      } else {
        setState(() => _selectedIndexes[i] = true);
      }
    }
  }
}
