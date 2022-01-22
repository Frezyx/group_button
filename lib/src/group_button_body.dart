import 'package:flutter/material.dart';
import 'package:group_button/src/group_custom_button.dart';
import 'package:group_button/src/utils/utils.dart';

class GroupButtonBody extends StatefulWidget {
  const GroupButtonBody({
    Key? key,
    required this.buttons,
    required this.onSelected,
    this.controller,
    required this.groupingType,
    this.onDisablePressed,
    this.selectedBorderColor,
    this.unselectedBorderColor,
    this.disabledButtons = const [],
    this.selectedButtons,
    this.selectedButton,
    this.isRadio = false,
    this.direction,
    this.spacing = 0.0,
    this.runSpacing = 0.0,
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
    required this.textAlign,
    required this.textPadding,
    this.alignment,
    this.elevation,
  }) : super(key: key);

  final List<String> buttons;
  final List<int> disabledButtons;
  final List<int>? selectedButtons;
  final int? selectedButton;
  final Function(int, bool) onSelected;
  final Function(int)? onDisablePressed;
  final bool isRadio;
  final Axis? direction;
  final double spacing;
  final double runSpacing;
  final TextStyle? selectedTextStyle;
  final TextStyle? unselectedTextStyle;
  final Color? selectedColor;
  final Color? unselectedColor;
  final Color? selectedBorderColor;
  final Color? unselectedBorderColor;
  final BorderRadius? borderRadius;
  final List<BoxShadow> selectedShadow;
  final List<BoxShadow> unselectedShadow;
  final double? buttonWidth;
  final double? buttonHeigth;
  final GroupingType groupingType;
  final MainGroupAlignment mainGroupAlignment;
  final CrossGroupAlignment crossGroupAlignment;
  final GroupRunAlignment groupRunAlignment;
  final TextAlign textAlign;
  final EdgeInsets textPadding;
  final AlignmentGeometry? alignment;
  final double? elevation;
  final GroupButtonController? controller;

  @override
  _GroupButtonBodyState createState() => _GroupButtonBodyState();
}

class _GroupButtonBodyState extends State<GroupButtonBody> {
  late GroupButtonController _controller;

  @override
  void didUpdateWidget(covariant GroupButtonBody oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      _controller = widget.controller ?? GroupButtonController();
    }
  }

  @override
  void initState() {
    super.initState();

    _controller = widget.controller ?? GroupButtonController();

    if (!widget.isRadio) {
      _controller.toggleIndexes(widget.selectedButtons ?? []);
    }

    if (widget.isRadio) {
      if (widget.selectedButton != null) {
        _controller.selectIndex(widget.selectedButton!);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return _buildBodyByGroupingType();
      },
    );
  }

  Widget _buildBodyByGroupingType() {
    switch (widget.groupingType) {
      case GroupingType.row:
        return Row(
          mainAxisAlignment: widget.mainGroupAlignment.toAxis(),
          crossAxisAlignment: widget.crossGroupAlignment.toAxis(),
          children: _buildButtonsList(widget.buttons),
        );
      case GroupingType.column:
        return Column(
          mainAxisAlignment: widget.mainGroupAlignment.toAxis(),
          crossAxisAlignment: widget.crossGroupAlignment.toAxis(),
          children: _buildButtonsList(widget.buttons),
        );

      case GroupingType.wrap:
      default:
        return Wrap(
          direction: widget.direction ?? Axis.horizontal,
          spacing: widget.spacing,
          runSpacing: widget.runSpacing,
          crossAxisAlignment: widget.crossGroupAlignment.toWrap(),
          runAlignment: widget.groupRunAlignment.toWrap(),
          alignment: widget.mainGroupAlignment.toWrap(),
          children: _buildButtonsList(widget.buttons),
        );
    }
  }

  bool _getCond(int i) {
    return widget.isRadio
        ? _controller.selectedIndex == i
        : _controller.selectedIndexes.contains(i);
  }

  List<Widget> _buildButtonsList(
    List<String> buttons,
  ) {
    final rebuildedButtons = <Widget>[];
    for (var i = 0; i < buttons.length; i++) {
      Widget rebuidedButton = GroupCustomButton(
        text: buttons[i],
        onPressed: widget.disabledButtons.contains(i)
            ? () => widget.onDisablePressed?.call(i)
            : () {
                _selectButton(i);
                widget.onSelected(i, _getCond(i));
              },
        isSelected: _getCond(i),
        isDisable: widget.disabledButtons.contains(i),
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
        textAlign: widget.textAlign,
        textPadding: widget.textPadding,
        alignment: widget.alignment,
        elevation: widget.elevation,
      );

      /// Padding adding
      /// when groupingType is row or column
      if (widget.spacing != 0.0) {
        if (widget.groupingType == GroupingType.row) {
          rebuidedButton = Padding(
            padding: EdgeInsets.symmetric(horizontal: widget.spacing),
            child: rebuidedButton,
          );
        } else if (widget.groupingType == GroupingType.column) {
          rebuidedButton = Padding(
            padding: EdgeInsets.symmetric(vertical: widget.spacing),
            child: rebuidedButton,
          );
        }
      }

      rebuildedButtons.add(rebuidedButton);
    }
    return rebuildedButtons;
  }

  void _selectButton(int i) {
    if (widget.isRadio) {
      _controller.selectIndex(i);
    } else {
      _controller.toggleIndexes([i]);
    }
  }
}
