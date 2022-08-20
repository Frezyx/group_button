import 'package:flutter/material.dart';

/// Custom builder method to create custom buttons by index
typedef GroupButtonIndexedBuilder = Widget Function(
  bool selected,
  int index,
  BuildContext context,
);

/// Custom builder method to create custom buttons by value
typedef GroupButtonValueBuilder<T> = Widget Function(
  bool selected,
  T value,
  BuildContext context,
);
