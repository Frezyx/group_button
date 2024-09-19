import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:group_button/src/group_button_item.dart';
import 'package:group_button/src/utils/extensions/extensions.dart';

class GroupButtonBody<T> extends StatefulWidget {
  const GroupButtonBody({
    Key? key,
    required this.buttons,
    required this.textAlign,
    required this.textPadding,
    this.controller,
    this.onSelected,
    this.groupingType,
    this.onDisablePressed,
    this.selectedBorderColor,
    this.unselectedBorderColor,
    this.disabledButtons = const [],
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
    this.borderWidth,
    this.selectedShadow = const [],
    this.unselectedShadow = const [],
    this.tappingShadowColor,
    this.buttonWidth,
    this.buttonHeight,
    this.mainGroupAlignment = MainGroupAlignment.center,
    this.crossGroupAlignment = CrossGroupAlignment.center,
    this.groupRunAlignment = GroupRunAlignment.center,
    this.alignment,
    this.elevation,
    this.buttonIndexedBuilder,
    this.buttonBuilder,
    this.buttonIndexedTextBuilder,
    this.buttonTextBuilder,
  }) : super(key: key);

  final List<T> buttons;
  final List<int> disabledButtons;
  final void Function(T, int, bool)? onSelected;
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
  final double? borderWidth;
  final List<BoxShadow> selectedShadow;
  final List<BoxShadow> unselectedShadow;
  final Color? tappingShadowColor;
  final double? buttonWidth;
  final double? buttonHeight;
  final GroupingType? groupingType;
  final MainGroupAlignment mainGroupAlignment;
  final CrossGroupAlignment crossGroupAlignment;
  final GroupRunAlignment groupRunAlignment;
  final TextAlign textAlign;
  final EdgeInsets textPadding;
  final AlignmentGeometry? alignment;
  final double? elevation;
  final GroupButtonController? controller;
  final GroupButtonIndexedBuilder? buttonIndexedBuilder;
  final GroupButtonValueBuilder<T>? buttonBuilder;
  final GroupButtonIndexedTextBuilder? buttonIndexedTextBuilder;
  final GroupbuttonTextBuilder<T>? buttonTextBuilder;

  @override
  State<GroupButtonBody<T>> createState() => _GroupButtonBodyState<T>();
}

class _GroupButtonBodyState<T> extends State<GroupButtonBody<T>> {
  late GroupButtonController _controller;

  @override
  void didUpdateWidget(covariant GroupButtonBody<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      _controller = widget.controller ?? _buildController();
      _controller.onDisablePressed ??= widget.onDisablePressed;
    }
  }

  GroupButtonController _buildController() => GroupButtonController(
        disabledIndexes: widget.disabledButtons,
        onDisablePressed: widget.onDisablePressed,
      );

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? _buildController();
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

  List<Widget> _generateButtonsList() {
    final rebuildedButtons = <Widget>[];
    for (var i = 0; i < widget.buttons.length; i++) {
      late Widget button;
      final buttonBuilder = widget.buttonBuilder;
      final buttonIndexedBuilder = widget.buttonIndexedBuilder;

      if (buttonBuilder != null || buttonIndexedBuilder != null) {
        button = GestureDetector(
          onTap: _controller.disabledIndexes.contains(i)
              ? () => _controller.onDisablePressed?.call(i)
              : () {
                  _selectButton(i);
                  widget.onSelected?.call(widget.buttons[i], i, _isSelected(i));
                },
          child: buttonBuilder != null
              ? buttonBuilder(_isSelected(i), widget.buttons[i], context)
              : buttonIndexedBuilder!(_isSelected(i), i, context),
        );
      } else {
        button = GroupButtonItem(
          text: widget.buttonIndexedTextBuilder
                  ?.call(_isSelected(i), i, context) ??
              widget.buttonTextBuilder
                  ?.call(_isSelected(i), widget.buttons[i], context) ??
              widget.buttons[i].toString(),
          onPressed: _controller.disabledIndexes.contains(i)
              ? () => _controller.onDisablePressed?.call(i)
              : () {
                  _selectButton(i);
                  widget.onSelected?.call(widget.buttons[i], i, _isSelected(i));
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
          borderWidth: widget.borderWidth,
          selectedShadow: widget.selectedShadow,
          unselectedShadow: widget.unselectedShadow,
          tappingShadowColor: widget.tappingShadowColor,
          height: widget.buttonHeight,
          width: widget.buttonWidth,
          textAlign: widget.textAlign,
          textPadding: widget.textPadding,
          alignment: widget.alignment,
          elevation: widget.elevation,
        );
      }

      /// Padding adding
      /// when groupingType is row or column
      if (widget.spacing > 0.0 &&
          widget.buttonIndexedBuilder == null &&
          widget.buttonBuilder == null) {
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

  bool _isSelected(int i) {
    return widget.isRadio
        ? _controller.selectedIndex == i
        : _controller.selectedIndexes.contains(i);
  }
}
