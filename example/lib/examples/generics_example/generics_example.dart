import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

class GenericsExample extends StatelessWidget {
  GenericsExample({Key? key}) : super(key: key);

  final controller = GroupButtonController(
    selectedIndex: 20,
    selectedIndexes: [0, 1, 2, 3, 4],
    disabledIndexes: [10, 12, 13, 14, 15, 23],
    onDisablePressed: (i) => print('Button #$i is disabled'),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: GroupButton<DateTime>(
            controller: controller,
            buttons: [DateTime(2022, 4, 9), DateTime(2022, 4, 10)],
            onSelected: (date, i, selected) =>
                debugPrint('Button: $date index: $i selected: $selected'),
            buttonBuilder: (selected, date, context) {
              return Text('${date.year}-${date.month}-${date.day}');
            },
          ),
        ),
      ),
    );
  }
}
