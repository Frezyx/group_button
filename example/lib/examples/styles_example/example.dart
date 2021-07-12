import 'package:example/examples/extended_example/helper_widgets/helper_widgets.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

class StylesExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'group_button: 3.0.0',
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
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ScrollIjector(
                  child: GroupButton(
                    spacing: 10,
                    buttons: [
                      '12:00',
                      '13:00',
                      '14:00',
                      '15:00',
                      '16:00',
                      '17:00',
                      '18:00',
                    ],
                    selectedShadow: [],
                    unselectedShadow: [],
                    groupingType: GroupingType.wrapp,
                    unselectedColor: Colors.grey[300],
                    unselectedTextStyle: TextStyle(
                      color: Colors.grey[600],
                    ),
                    borderRadius: BorderRadius.circular(30),
                    onSelected: (i, selected) {},
                  ),
                  groupingType: GroupingType.wrapp,
                ),
                ScrollIjector(
                  child: GroupButton(
                    spacing: 10,
                    buttons: [
                      '12:00',
                      '13:00',
                      '14:00',
                      '15:00',
                      '16:00',
                      '17:00',
                      '18:00',
                    ],
                    selectedShadow: [],
                    unselectedShadow: [],
                    groupingType: GroupingType.wrapp,
                    isRadio: false,
                    selectedButtons: [1, 3, 4],
                    selectedColor: Colors.black,
                    selectedTextStyle: TextStyle(
                      fontWeight: FontWeight.w900,
                    ),
                    borderRadius: BorderRadius.circular(4),
                    onSelected: (i, selected) {},
                  ),
                  groupingType: GroupingType.wrapp,
                ),
                ScrollIjector(
                  child: GroupButton(
                    spacing: 5,
                    buttons: [
                      '12:00',
                      '13:00',
                      '14:00',
                      '15:00',
                      '16:00',
                      '17:00',
                      '18:00',
                    ],
                    isRadio: false,
                    selectedButtons: [0, 4, 6],
                    selectedShadow: [],
                    unselectedShadow: [],
                    groupingType: GroupingType.wrapp,
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
                  groupingType: GroupingType.wrapp,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ScrollIjector(
                    child: GroupButton(
                      spacing: 10,
                      buttons: [
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
                      groupingType: GroupingType.wrapp,
                      isRadio: false,
                      selectedButtons: [1, 3, 4],
                      unselectedBorderColor: Colors.grey[400],
                      selectedBorderColor: Colors.pink,
                      unselectedTextStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      selectedColor: Colors.pink,
                      onSelected: (i, selected) {},
                    ),
                    groupingType: GroupingType.wrapp,
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
