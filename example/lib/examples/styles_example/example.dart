import 'package:example/drawer.dart';
import 'package:example/examples/extended_example/helper_widgets/helper_widgets.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

class StylesExample extends StatelessWidget {
  StylesExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: Text(
          'GroupButton 5.0.0',
        ),
      ),
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ScrollInjector(
                groupingType: GroupingType.wrap,
                child: GroupButton(
                  buttons: const [
                    '12:00',
                    '13:00',
                    '14:00',
                    '15:00',
                    '16:00',
                    '17:00',
                    '18:00',
                  ],
                  controller: GroupButtonController(selectedIndex: 4),
                  options: GroupButtonOptions(
                    selectedShadow: const [],
                    unselectedShadow: const [],
                    unselectedColor: Colors.grey[300],
                    unselectedTextStyle: TextStyle(
                      color: Colors.grey[600],
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  onSelected: (val, i, selected) =>
                      debugPrint('Button: $val index: $i $selected'),
                ),
              ),
              ScrollInjector(
                groupingType: GroupingType.wrap,
                child: GroupButton(
                  buttons: const [
                    '12:00',
                    '13:00',
                    '14:00',
                    '15:00',
                    '16:00',
                    '17:00',
                    '18:00',
                  ],
                  options: GroupButtonOptions(
                    selectedShadow: const [],
                    unselectedShadow: const [],
                    selectedColor: Colors.black,
                    selectedTextStyle: const TextStyle(
                      fontWeight: FontWeight.w900,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  isRadio: false,
                  controller: GroupButtonController(
                    selectedIndexes: const [1, 3, 4],
                  ),
                  onSelected: (val, i, selected) =>
                      debugPrint('Button: $val index: $i $selected'),
                ),
              ),
              ScrollInjector(
                groupingType: GroupingType.wrap,
                child: GroupButton(
                  buttons: const [
                    '12:00',
                    '13:00',
                    '14:00',
                    '15:00',
                    '16:00',
                    '17:00',
                    '18:00',
                  ],
                  options: GroupButtonOptions(
                    selectedShadow: const [],
                    unselectedShadow: const [],
                    selectedTextStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.pink[900],
                    ),
                    selectedColor: Colors.pink[100],
                    unselectedColor: Colors.amber[100],
                    unselectedTextStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.amber[900],
                    ),
                    borderRadius: BorderRadius.circular(8),
                    spacing: 5,
                  ),
                  isRadio: false,
                  controller: GroupButtonController(
                    selectedIndexes: const [0, 4, 6],
                  ),
                  onSelected: (val, i, selected) =>
                      debugPrint('Button: $val index: $i $selected'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ScrollInjector(
                  groupingType: GroupingType.wrap,
                  child: GroupButton(
                    buttons: const [
                      '12:00',
                      '13:00',
                      '14:00',
                      '15:00',
                      '16:00',
                      '17:00',
                      '18:00',
                    ],
                    options: GroupButtonOptions(
                      unselectedBorderColor: Colors.grey[400],
                      selectedBorderColor: Colors.pink,
                      unselectedTextStyle: const TextStyle(
                        color: Colors.grey,
                      ),
                      selectedColor: Colors.pink,
                      selectedShadow: [
                        BoxShadow(
                          color: Colors.pink.withOpacity(0.2),
                          blurRadius: 20,
                        )
                      ],
                      unselectedShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 20,
                        )
                      ],
                    ),
                    isRadio: false,
                    controller: GroupButtonController(
                      selectedIndexes: const [1, 3, 4],
                    ),
                    onSelected: (val, i, selected) =>
                        debugPrint('Button: $val index: $i $selected'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
