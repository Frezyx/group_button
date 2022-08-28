import 'package:example/drawer.dart';
import 'package:example/examples/extended_example/helper_widgets/helper_widgets.dart';
import 'package:example/examples/extended_example/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

part 'radio_example_part.dart';

part 'checkbox_example_part.dart';

class GroupButtonExtendedExample extends StatelessWidget {
  const GroupButtonExtendedExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primarySwatch: Colors.green,
        buttonTheme: ButtonThemeData(
          colorScheme: Theme.of(context).buttonTheme.colorScheme?.copyWith(
                primary: Colors.green,
                secondary: Colors.white,
              ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      child: _Example(),
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
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: Text(
          'GroupButton 5.0.0',
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
                  controller: GroupButtonController(
                    selectedIndex: 0,
                    onDisablePressed: (i) =>
                        debugPrint('Disable Button #$i pressed'),
                  ),
                  options: GroupButtonOptions(
                    spacing: 7.5,
                    mainGroupAlignment: MainGroupAlignment.start,
                    groupingType: GroupingType.row,
                  ),
                  buttons: const ['Wrap', 'Column', 'Row'],
                  onSelected: (val, i, selected) {
                    _extendedExampleController.selectedGroupingType = i;
                  },
                ),
                GroupButton(
                  controller: GroupButtonController(
                    selectedIndex: 0,
                    onDisablePressed: (i) =>
                        debugPrint('Disable Button #$i pressed'),
                  ),
                  options: GroupButtonOptions(
                    mainGroupAlignment: MainGroupAlignment.start,
                    groupingType: GroupingType.row,
                    spacing: 7.5,
                  ),
                  buttons: const ['Radio', 'CheckBox'],
                  onSelected: (_, i, selected) {
                    _pageController.animateToPage(
                      i,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeIn,
                    );
                  },
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
    );
  }

  List<Widget> _getSelectedPagesGroup() {
    switch (_extendedExampleController.selectedGroupingType) {
      case 1:
        return [
          _buildRadioExample(GroupingType.column),
          _buildCheckboxExample(GroupingType.column),
        ];
      case 2:
        return [
          _buildRadioExample(GroupingType.row),
          _buildCheckboxExample(GroupingType.row),
        ];
      case 0:
      default:
        return [
          _buildRadioExample(GroupingType.wrap, direction: direction),
          _buildCheckboxExample(GroupingType.wrap, direction: direction),
        ];
    }
  }
}
