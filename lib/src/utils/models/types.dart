import 'package:flutter/material.dart';

/// Custom builder method to create custom buttons
typedef GroupButtonBuilder = Widget Function(
  bool selected,
  int index,
  BuildContext context,
);
