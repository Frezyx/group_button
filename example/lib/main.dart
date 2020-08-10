import 'package:flutter/material.dart';
import 'package:group_button/group_buttons.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Group Button',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("group_button 0.1.0"),
      ),
      body: Center(
        child: GroupButton(
          spacing: 10,
          buttons: [
            GroupCustomButton(
              onPressed: () => print("sss"),
              isSelected: true,
              text: "12:00",
            ),
            GroupCustomButton(
              onPressed: () => print("sss"),
              isSelected: true,
              text: "12:00",
            ),
            GroupCustomButton(
              onPressed: () => print("sss"),
              isSelected: true,
              text: "12:00",
            ),
            GroupCustomButton(
              onPressed: () => print("sss"),
              isSelected: true,
              text: "12:00",
            ),
            GroupCustomButton(
              onPressed: () => print("sss"),
              isSelected: true,
              text: "12:00",
            ),
            GroupCustomButton(
              onPressed: () => print("sss"),
              isSelected: true,
              text: "12:00",
            ),
            GroupCustomButton(
              onPressed: () => print("sss"),
              isSelected: true,
              text: "12:00",
            ),
            GroupCustomButton(
              onPressed: () => print("sss"),
              isSelected: true,
              text: "12:00",
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print("Change visability"),
        child: Icon(Icons.refresh),
      ),
    );
  }
}
