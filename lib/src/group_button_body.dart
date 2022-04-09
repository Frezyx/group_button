import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:group_button/src/group_button_item.dart';

class GroupButtonBody<T> extends StatefulWidget {
  const GroupButtonBody({
    Key? key,
    required this.buttons,
    required this.onSelected,
    required this.groupingType,
    required this.textAlign,
    required this.textPadding,
    this.controller,
    this.onDisablePressed,
    this.selectedBorderColor,
    this.unselectedBorderColor,
    this.disabledButtons = const [],
    this.selectedButtons,
    this.selectedButton,
    this.isRadio = false,
    this.enableDeselect = false,
    this.maxSelected,
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
    this.alignment,
    this.elevation,
    this.buttonBuilder,
  }) : super(key: key);

  final List<T> buttons;
  final List<int> disabledButtons;
  final List<int>? selectedButtons;
  final int? selectedButton;
  final Function(T, int, bool) onSelected;
  final Function(int)? onDisablePressed;
  final bool isRadio;
  final bool? enableDeselect;
  final int? maxSelected;
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
  final Widget Function(
    bool selected,
    int index,
    BuildContext context,
  )? buttonBuilder;

  @override
  _GroupButtonBodyState createState() => _GroupButtonBodyState();
}

class _GroupButtonBodyState extends State<GroupButtonBody> {
  late GroupButtonController _controller;

  @override
  void didUpdateWidget(covariant GroupButtonBody oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      _controller = widget.controller ?? _buidController();
      _controller.onDisablePressed ??= widget.onDisablePressed;
    }
  }

  GroupButtonController _buidController() => GroupButtonController(
        selectedIndex: widget.isRadio ? widget.selectedButton : null,
        selectedIndexes: widget.selectedButtons ?? [],
        disabledIndexes: widget.disabledButtons,
        onDisablePressed: widget.onDisablePressed,
      );

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? _buidController();
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
    final buttons = _generateButtonsList();
    switch (widget.groupingType) {
      case GroupingType.row:
        return Row(
          mainAxisAlignment: widget.mainGroupAlignment.toAxis(),
          crossAxisAlignment: widget.crossGroupAlignment.toAxis(),
          children: buttons,
        );
      case GroupingType.column:
        return Column(
          mainAxisAlignment: widget.mainGroupAlignment.toAxis(),
          crossAxisAlignment: widget.crossGroupAlignment.toAxis(),
          children: buttons,
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
          children: buttons,
        );
    }
  }

  bool _isSelected(int i) {
    return widget.isRadio
        ? _controller.selectedIndex == i
        : _controller.selectedIndexes.contains(i);
  }

  List<Widget> _generateButtonsList() {
    final rebuildedButtons = <Widget>[];
    for (var i = 0; i < widget.buttons.length; i++) {
      final builder = widget.buttonBuilder;
      late Widget button;
      if (builder != null) {
        button = GestureDetector(
          onTap: _controller.disabledIndexes.contains(i)
              ? () => _controller.onDisablePressed?.call(i)
              : () {
                  _selectButton(i);
                  widget.onSelected(widget.buttons[i], i, _isSelected(i));
                },
          child: builder(_isSelected(i), i, context),
        );
      } else {
        button = GroupButtonItem(
          text: widget.buttons[i].toString(),
          onPressed: _controller.disabledIndexes.contains(i)
              ? () => _controller.onDisablePressed?.call(i)
              : () {
                  _selectButton(i);
                  widget.onSelected(widget.buttons[i], i, _isSelected(i));
                },
          isSelected: _isSelected(i),
          isDisable: _controller.disabledIndexes.contains(i),
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
      }

      /// Padding adding
      /// when groupingType is row or column
      if (widget.spacing != 0.0 && widget.buttonBuilder == null) {
        if (widget.groupingType == GroupingType.row) {
          button = Padding(
            padding: EdgeInsets.symmetric(horizontal: widget.spacing),
            child: button,
          );
        } else if (widget.groupingType == GroupingType.column) {
          button = Padding(
            padding: EdgeInsets.symmetric(vertical: widget.spacing),
            child: button,
          );
        }
      }

      rebuildedButtons.add(button);
    }
    return rebuildedButtons;
  }

  void _selectButton(int i) {
    if (widget.isRadio) {
      if (widget.enableDeselect! && _controller.selectedIndex == i) {
        _controller.unselectIndex(i);
      } else {
        _controller.selectIndex(i);
      }
    } else {
      final maxSelected = widget.maxSelected;
      final selectedIndexesCount = _controller.selectedIndexes.length;
      if (maxSelected != null &&
          selectedIndexesCount >= maxSelected &&
          !_controller.selectedIndexes.contains(i)) {
        return;
      }
      _controller.toggleIndexes([i]);
    }
  }
}
