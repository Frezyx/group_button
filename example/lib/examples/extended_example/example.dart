import 'package:example/examples/extended_example/helper_widgets/helper_widgets.dart';
import 'package:example/examples/extended_example/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

part 'radio_example_part.dart';
part 'checkbox_example_part.dart';
part 'custom_example_part.dart';

class GroupButtonExtendedExample extends StatelessWidget {
  GroupButtonExtendedExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        buttonTheme: ButtonThemeData(
          colorScheme: Theme.of(context).buttonTheme.colorScheme.copyWith(
                primary: Colors.green,
                secondary: Colors.white,
              ),
        ),
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

  final _extendedExampleController = ExtendedExampleController();
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.grey[100].withOpacity(0.1),
        backgroundColor: Colors.white,
        title: Text(
          'GroupButton 4.1.0',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 10),
                GroupButton(
                  controller: GroupButtonController(),
                  options: GroupButtonOptions(
                    spacing: 7.5,
                    mainGroupAlignment: MainGroupAlignment.start,
                    groupingType: GroupingType.row,
                  ),
                  buttons: const ['Wrap', 'Column', 'Row'],
                  onSelected: (i, selected) {
                    _extendedExampleController.selectedGroupingType = i;
                  },
                  onDisablePressed: (i) =>
                      debugPrint('Disable Button #$i pressed'),
                ),
                GroupButton(
                  controller: GroupButtonController(),
                  options: GroupButtonOptions(
                    mainGroupAlignment: MainGroupAlignment.start,
                    groupingType: GroupingType.row,
                    spacing: 7.5,
                  ),
                  buttons: const ['Radio', 'CheckBox', 'Custom'],
                  onSelected: (i, selected) {
                    _pageController.animateToPage(
                      i,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeIn,
                    );
                  },
                  onDisablePressed: (i) =>
                      debugPrint('Disable Button #$i pressed'),
                ),
              ],
            ),
            AnimatedBuilder(
              animation: _extendedExampleController,
              builder: (context, child) {
                return Expanded(
                  child: PageView(
                    controller: _pageController,
                    children: _getSelectedPagesGroup(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: _extendedExampleController.selectedGroupingType == 0
          ? FloatingActionButton(
              onPressed: () => setState(() {
                direction = direction == Axis.horizontal
                    ? Axis.vertical
                    : Axis.horizontal;
              }),
              child: const Icon(Icons.refresh),
            )
          : null,
    );
  }

  List<Widget> _getSelectedPagesGroup() {
    switch (_extendedExampleController.selectedGroupingType) {
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
          _buildRadioExample(GroupingType.wrap, direction: direction),
          _buildCheckboxExample(GroupingType.wrap, direction: direction),
          _buildCustomExample(GroupingType.wrap, direction: direction),
        ];
    }
  }
}
