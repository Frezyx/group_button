import 'package:flutter_test/flutter_test.dart';
import 'package:group_button/group_button.dart';

void main() {
  late GroupButtonController controller;

  const selectingList = [0, 1, 2, 3, 4, 5, 6];

  group('Test_GroupButtonController', () {
    setUp(() {
      controller = GroupButtonController();
    });

    group('SelectIndex', () {
      test('Radio', () async {
        controller.selectIndex(10);
        expect(controller.selectedIndex, 10);
      });

      test('Checkbox', () async {
        controller.selectIndex(10);
        expect(controller.selectedIndexes, contains(10));
      });
    });

    group('UnselectIndex', () {
      test('Radio', () async {
        controller.selectIndex(10);
        controller.unselectIndex(10);
        expect(controller.selectedIndex, isNull);
      });

      test('Checkbox', () async {
        controller.selectIndex(10);
        controller.unselectIndex(10);
        expect(controller.selectedIndexes, isEmpty);
      });
    });

    test('SelectIndexes', () async {
      controller.selectIndexes(selectingList);
      expect(controller.selectedIndexes, isNotEmpty);
      expect(controller.selectedIndexes, selectingList);
    });

    group('UnselectIndexes', () {
      test('All', () async {
        controller.selectIndexes(selectingList);
        controller.unselectIndexes(selectingList);
        expect(controller.selectedIndexes, isEmpty);
      });

      test('Part', () async {
        controller.selectIndexes(selectingList);
        controller.unselectIndexes(selectingList.getRange(0, 3).toList());
        final editableList = [...selectingList];
        expect(controller.selectedIndexes, editableList..removeRange(0, 3));
      });
    });

    test('UnselectAll', () async {
      controller.selectIndexes(selectingList);
      controller.unselectAll();
      expect(controller.selectedIndexes, isEmpty);
    });
  });
}
