import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:group_button/group_button.dart';
import 'package:group_button/src/utils/extensions/extensions.dart';

void main() {
  group('Test_Alignments_Convert', () {
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

    group('Test_CrossGroupAlignments', () {
      _testCrossGroupAlignment(
        CrossGroupAlignment.center,
        CrossAxisAlignment.center,
        WrapCrossAlignment.center,
      );
      _testCrossGroupAlignment(
        CrossGroupAlignment.start,
        CrossAxisAlignment.start,
        WrapCrossAlignment.start,
      );
      _testCrossGroupAlignment(
        CrossGroupAlignment.end,
        CrossAxisAlignment.end,
        WrapCrossAlignment.end,
      );
    });
  });
}

void _testCrossGroupAlignment(
  CrossGroupAlignment group,
  CrossAxisAlignment axis,
  WrapCrossAlignment wrap,
) {
  test(group.toString(), () async {
    final mainAxisAlignment = group.toAxis();
    final mainWrapAlignment = group.toWrap();
    expect(mainAxisAlignment, axis);
    expect(mainWrapAlignment, wrap);
  });
}

void _testMainGroupAlignment(
  MainGroupAlignment group,
  MainAxisAlignment axis,
  WrapAlignment wrap,
) {
  test(group.toString(), () async {
    final mainAxisAlignment = group.toAxis();
    final mainWrapAlignment = group.toWrap();
    expect(mainAxisAlignment, axis);
    expect(mainWrapAlignment, wrap);
  });
}
