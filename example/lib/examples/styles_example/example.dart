import 'package:example/examples/extended_example/helper_widgets/helper_widgets.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

class StylesExample extends StatelessWidget {
  final GroupButtonController controller = GroupButtonController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'group_button: 3.2.0',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.grey[100],
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ScrollIjector(
                  groupingType: GroupingType.wrap,
                  child: GroupButton(
                    controller: controller,
                    spacing: 10,
                    buttons: const [
                      '12:00',
                      '13:00',
                      '14:00',
                      '15:00',
                      '16:00',
                      '17:00',
                      '18:00',
                      '12:00',
                      '13:00',
                      '14:00',
                      '15:00',
                      '16:00',
                      '17:00',
                      '18:00 18:00',
                    ],
                    selectedButton: 4,
                    isRadio: true,
                    selectedShadow: const [],
                    unselectedShadow: const [],
                    unselectedColor: Colors.grey[300],
                    unselectedTextStyle: TextStyle(
                      color: Colors.grey[600],
                    ),
                    borderRadius: BorderRadius.circular(30),
                    onSelected: (i, selected) {},
                  ),
                ),
                TextButton(
                    onPressed: () {
                      controller.setSelectedIndex(6);
                    },
                    child: const Text('Button')),
                ScrollIjector(
                  groupingType: GroupingType.wrap,
                  child: GroupButton(
                    spacing: 10,
                    buttons: const [
                      '12:00',
                      '13:00',
                      '14:00',
                      '15:00',
                      '16:00',
                      '17:00',
                      '18:00',
                    ],
                    selectedShadow: const [],
                    unselectedShadow: const [],
                    isRadio: false,
                    selectedButtons: const [1, 3, 4],
                    selectedColor: Colors.black,
                    selectedTextStyle: const TextStyle(
                      fontWeight: FontWeight.w900,
                    ),
                    borderRadius: BorderRadius.circular(4),
                    onSelected: (i, selected) {},
                  ),
                ),
                ScrollIjector(
                  groupingType: GroupingType.wrap,
                  child: GroupButton(
                    spacing: 5,
                    buttons: const [
                      '12:00',
                      '13:00',
                      '14:00',
                      '15:00',
                      '16:00',
                      '17:00',
                      '18:00',
                    ],
                    isRadio: false,
                    selectedButtons: const [0, 4, 6],
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
                    onSelected: (i, selected) {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ScrollIjector(
                    groupingType: GroupingType.wrap,
                    child: GroupButton(
                      spacing: 10,
                      buttons: const [
                        '12:00',
                        '13:00',
                        '14:00',
                        '15:00',
                        '16:00',
                        '17:00',
                        '18:00',
                      ],
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
                      isRadio: false,
                      selectedButtons: const [1, 3, 4],
                      unselectedBorderColor: Colors.grey[400],
                      selectedBorderColor: Colors.pink,
                      unselectedTextStyle: const TextStyle(
                        color: Colors.grey,
                      ),
                      selectedColor: Colors.pink,
                      onSelected: (i, selected) {},
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
