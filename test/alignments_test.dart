import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:group_button/group_button.dart';

void main() {
  group('Test_Algnments_Convert', () {
    group('Test_MainGroupAlignments', () {
      _testMainGroupAlignment(
        MainGroupAlignment.center,
        MainAxisAlignment.center,
        WrapAlignment.center,
      );
      _testMainGroupAlignment(
        MainGroupAlignment.start,
        MainAxisAlignment.start,
        WrapAlignment.start,
      );
      _testMainGroupAlignment(
        MainGroupAlignment.end,
        MainAxisAlignment.end,
        WrapAlignment.end,
      );
      _testMainGroupAlignment(
        MainGroupAlignment.spaceAround,
        MainAxisAlignment.spaceAround,
        WrapAlignment.spaceAround,
      );
      _testMainGroupAlignment(
        MainGroupAlignment.spaceBetween,
        MainAxisAlignment.spaceBetween,
        WrapAlignment.spaceBetween,
      );
      _testMainGroupAlignment(
        MainGroupAlignment.spaceEvenly,
        MainAxisAlignment.spaceEvenly,
        WrapAlignment.spaceEvenly,
      );
    });
  });
}

void _testMainGroupAlignment(
  MainGroupAlignment group,
  MainAxisAlignment axis,
  WrapAlignment wrap,
) {
  test(group.toString(), () async {
    final mainAxisAlignemnt = group.toAxis();
    final mainWrapAlignment = group.toWrap();
    expect(mainAxisAlignemnt, axis);
    expect(mainWrapAlignment, wrap);
  });
}
