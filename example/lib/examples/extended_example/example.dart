import 'package:example/examples/extended_example/helper_widgets/helper_widgets.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

part 'radio_example_part.dart';
part 'checkbox_example_part.dart';
part 'custom_example_part.dart';

class GroupButtonExtendedExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: _Example(),
    );
  }
}

class _Example extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<_Example> {
  Axis direction = Axis.horizontal;

  var _selectedGroupingType = 0;
  var _selectedButtonType = 0;

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("group_button 2.4.1"),
      ),
      body: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              GroupButton(
                spacing: 7.5,
                mainGroupAlignment: MainGroupAlignment.start,
                groupingType: GroupingType.row,
                buttons: [
                  "Wrap",
                  "Column",
                  "Row",
                ],
                onSelected: (i, selected) {
                  setState(() => _selectedGroupingType = i);
                },
              ),
              GroupButton(
                spacing: 7.5,
                mainGroupAlignment: MainGroupAlignment.start,
                groupingType: GroupingType.row,
                buttons: [
                  "Radio",
                  "CheckBox",
                  "Custom",
                ],
                onSelected: (i, selected) {
                  _pageController.animateToPage(
                    i,
                    duration: Duration(milliseconds: 200),
                    curve: Curves.easeIn,
                  );
                },
              ),
            ],
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              children: _getSelectedPagesGroup(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          direction =
              direction == Axis.horizontal ? Axis.vertical : Axis.horizontal;
        }),
        child: Icon(Icons.refresh),
      ),
    );
  }

  List<Widget> _getSelectedPagesGroup() {
    switch (_selectedGroupingType) {
      case 1:
        return [
          _buildRadioExample(GroupingType.column),
          _buildCheckboxExample(GroupingType.column),
          _buildCustomExample(GroupingType.column),
        ];
      case 2:
        return [
          _buildRadioExample(GroupingType.row),
          _buildCheckboxExample(GroupingType.row),
          _buildCustomExample(GroupingType.row),
        ];
      case 0:
      default:
        return [
          _buildRadioExample(GroupingType.wrapp),
          _buildCheckboxExample(GroupingType.wrapp),
          _buildCustomExample(GroupingType.wrapp),
        ];
    }
  }

  // List<String> _getSizedButtonsByGroupingType(
  //     List<String> buttons, GroupingType groupingType) {
  //   if (groupingType == GroupingType.row) {
  //     buttons = buttons.getRange(0, 2).toList();
  //   }

  //   return buttons;
  // }
}
