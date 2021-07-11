part of 'example.dart';

Widget _buildCheckboxExample(GroupingType groupingType, {Axis direction}) {
  return ScrollIjector(
    groupingType: groupingType,
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: GroupButton(
          spacing: 10,
          isRadio: false,
          groupingType: groupingType,
          direction: direction,
          selectedShadow: [],
          unselectedShadow: [],
          unselectedBorderColor: Colors.green,
          unselectedTextStyle: TextStyle(
            color: Colors.green,
          ),
          borderRadius: BorderRadius.circular(30),
          onSelected: (index, isSelected) => print(
              '$index button is ${isSelected ? 'selected' : 'unselected'}'),
          buttons: [
            "Burger",
            "Sandwiches",
            "Salad",
            "Carbonara",
            "Meat",
            "French fries",
            "Carbonated beverage"
          ],
          selectedButtons: [2, 3],
        ),
      ),
    ),
  );
}
