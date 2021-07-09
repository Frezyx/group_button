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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("group_button 2.4.0"),
          bottom: TabBar(
            tabs: [
              Tab(icon: _buildRadioTabIcon()),
              Tab(icon: _buildCheckTabIcon()),
              Tab(icon: _buildCustomTabIcon()),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: GroupButton(
                  spacing: 10,
                  direction: direction,
                  onSelected: (index, isSelected) =>
                      print('$index button is selected'),
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
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: GroupButton(
                  spacing: 15,
                  isRadio: false,
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
                  selectedButtons: [
                    2,
                    3,
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GroupButton(
                spacing: 5,
                isRadio: false,
                direction: direction,
                onSelected: (index, isSelected) => print(
                    '$index button is ${isSelected ? 'selected' : 'unselected'}'),
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
                selectedShadow: <BoxShadow>[
                  BoxShadow(color: Colors.transparent)
                ],
                unselectedShadow: <BoxShadow>[
                  BoxShadow(color: Colors.transparent)
                ],
                buttonHeight: 30,
                buttonWidth: 115,
                mainGroupAlignment: MainGroupAlignment.center,
                crossGroupAlignment: CrossGroupAlignment.center,
                groupRunAlignment: GroupRunAlignment.spaceEvenly,
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
