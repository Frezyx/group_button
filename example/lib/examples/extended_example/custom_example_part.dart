part of 'example.dart';

Widget _buildCustomExample(GroupingType groupingType, {Axis direction}) {
  return ScrollIjector(
    groupingType: groupingType,
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: GroupButton(
        controller: GroupButtonController(selectedIndexes: const [1, 2, 3]),
        spacing: 5,
        isRadio: false,
        groupingType: groupingType,
        direction: direction,
        onSelected: (index, isSelected) => debugPrint(
          '$index button is ${isSelected ? 'selected' : 'unselected'}',
        ),
        onDisablePressed: (i) => debugPrint('Disable Button #$i pressed'),
        buttons: const [
          "Dart",
          "Kotlin",
          "Java",
          "Swift",
          "Objective-C",
          "Python",
          "JS",
          "C#",
          "C",
          "C++"
        ],
        selectedTextStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: Colors.red,
        ),
        unselectedTextStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14,
          color: Colors.grey[600],
        ),
        selectedColor: Colors.white,
        unselectedColor: Colors.grey[300],
        selectedBorderColor: Colors.red,
        unselectedBorderColor: Colors.grey[500],
        borderRadius: BorderRadius.circular(5.0),
        selectedShadow: const <BoxShadow>[BoxShadow(color: Colors.transparent)],
        unselectedShadow: const <BoxShadow>[
          BoxShadow(color: Colors.transparent)
        ],
        buttonHeight: 30,
        buttonWidth: 115,
      ),
    ),
  );
}
