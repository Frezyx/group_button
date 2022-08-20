import 'package:example/examples/common_example/example.dart';
import 'package:example/examples/customizable_example/customizable_example.dart';
import 'package:example/examples/extended_example/example.dart';
import 'package:example/examples/full_options_example/full_options_example.dart';
import 'package:example/examples/generics_example/generics_example.dart';
import 'package:example/examples/styles_example/example.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

import 'examples/button_builder_example/example.dart';
import 'routes.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GroupButton Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: <String, WidgetBuilder>{
        Routes.groupButtonExtendedExample: (_) => GroupButtonExtendedExample(),
        Routes.stylesExample: (_) => StylesExample(),
        Routes.customizableExample: (_) => CustomizableExample(),
        Routes.buttonBuilderExample: (_) => ButtonBuilderExample(),
        Routes.fullOptionsSelectedExample: (_) =>
            const FullOptionsSelectedExample(),
        Routes.genericsExample: (_) => GenericsExample(),
        Routes.commonExample: (_) => CommonExample(),
      },
      home: CommonExample(),
    );
  }
}
