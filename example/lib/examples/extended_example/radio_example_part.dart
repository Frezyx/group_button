part of 'example.dart';

Widget _buildRadioExample(GroupingType groupingType, {Axis? direction}) {
  return ScrollIjector(
    groupingType: groupingType,
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: GroupButton(
          controller: GroupButtonController(
            selectedIndex: 1,
            onDisablePressed: (i) => debugPrint('Disable Button #$i pressed'),
          ),
          options: GroupButtonOptions(
            direction: direction,
            groupingType: groupingType,
          ),
          onSelected: (index, isSelected) =>
              debugPrint('$index button is selected'),
          buttons: const ['12:00', '13:00', '14:30', '18:00', '19:00', '21:40'],
        ),
      ),
    ),
  );
}
