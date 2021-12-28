import 'package:flutter_test/flutter_test.dart';
import 'package:group_button/group_button.dart';

void main() {
  late GroupButtonController _controller;

  const selectingList = [0, 1, 2, 3, 4, 5, 6];

  group('Test_GroupButtonController', () {
    setUp(() {
      _controller = GroupButtonController();
    });

    group('SelectIndex', () {
      test('Radio', () async {
        _controller.selectIndex(10);
        expect(_controller.selectedIndex, 10);
      });

      test('Checkbox', () async {
        _controller.selectIndex(10);
        expect(_controller.selectedIndexes, contains(10));
      });
    });

    group('UnselectIndex', () {
      test('Radio', () async {
        _controller.selectIndex(10);
        _controller.unselectIndex(10);
        expect(_controller.selectedIndex, isNull);
      });

      test('Checkbox', () async {
        _controller.selectIndex(10);
        _controller.unselectIndex(10);
        expect(_controller.selectedIndexes, isEmpty);
      });
    });

    test('SelectIndexes', () async {
      _controller.selectIndexes(selectingList);
      expect(_controller.selectedIndexes, isNotEmpty);
      expect(_controller.selectedIndexes, selectingList);
    });

    group('UnselectIndexes', () {
      test('All', () async {
        _controller.selectIndexes(selectingList);
        _controller.unselectIndexes(selectingList);
        expect(_controller.selectedIndexes, isEmpty);
      });

      test('Part', () async {
        _controller.selectIndexes(selectingList);
        _controller.unselectIndexes(selectingList.getRange(0, 3).toList());
        final editableList = [...selectingList];
        expect(_controller.selectedIndexes, editableList..removeRange(0, 3));
      });
    });

    test('UnselectAll', () async {
      _controller.selectIndexes(selectingList);
      _controller.unselectAll();
      expect(_controller.selectedIndexes, isEmpty);
    });
  });
}
