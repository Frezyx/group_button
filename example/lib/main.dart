import 'package:flutter/material.dart';
import 'package:example/examples/provider_example/ui/app.dart';
import 'package:group_button/group_button.dart';

/// You can use [GroupButtonProviderApp] example
/// using this package with state - managment package like provider

void main() {
  runApp(GroupButtonApp());
}

class GroupButtonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Axis direction = Axis.horizontal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("group_button 2.4.1"),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Tab(icon: _buildRadioTabIcon()),
              Tab(icon: _buildCheckTabIcon()),
              Tab(icon: _buildCustomTabIcon()),
            ],
          ),
          Expanded(
            child: PageView(
              children: [
                _buildRadioExample(GroupingType.column),
                _buildRadioExample(GroupingType.row),
                _buildRadioExample(GroupingType.wrapp),
                _buildCheckboxExample(GroupingType.column),
                _buildCheckboxExample(GroupingType.row),
                _buildCheckboxExample(GroupingType.wrapp),
                _buildCustomExample(GroupingType.column),
                _buildCustomExample(GroupingType.row),
                _buildCustomExample(GroupingType.wrapp),
              ],
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

  Padding _buildCustomExample(GroupingType groupingType) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GroupButton(
        spacing: 5,
        isRadio: false,
        groupingType: groupingType,
        direction: direction,
        onSelected: (index, isSelected) =>
            print('$index button is ${isSelected ? 'selected' : 'unselected'}'),
        buttons: [
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
        selectedTextStyle: TextStyle(
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
        selectedShadow: <BoxShadow>[BoxShadow(color: Colors.transparent)],
        unselectedShadow: <BoxShadow>[BoxShadow(color: Colors.transparent)],
        buttonHeight: 30,
        buttonWidth: 115,
        mainGroupAlignment: MainGroupAlignment.center,
        crossGroupAlignment: CrossGroupAlignment.center,
        groupRunAlignment: GroupRunAlignment.spaceEvenly,
      ),
    );
  }

  Padding _buildCheckboxExample(GroupingType groupingType) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: GroupButton(
          spacing: 15,
          isRadio: false,
          groupingType: groupingType,
          direction: direction,
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
    );
  }

  Padding _buildRadioExample(GroupingType groupingType) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: GroupButton(
          spacing: 10,
          direction: direction,
          groupingType: groupingType,
          onSelected: (index, isSelected) => print('$index button is selected'),
          buttons: [
            "12:00",
            "13:00",
            "14:30",
            "18:00",
            "19:00",
            "21:40",
          ],
          selectedButton: 5,
        ),
      ),
    );
  }

  Row _buildRadioTabIcon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Icon(Icons.radio_button_unchecked, size: 20),
        Text("Radio"),
      ],
    );
  }

  Row _buildCheckTabIcon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Icon(Icons.check_box, size: 20),
        Text("Check"),
      ],
    );
  }

  Row _buildCustomTabIcon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Icon(Icons.palette, size: 20),
        Text("Custom"),
      ],
    );
  }
}
