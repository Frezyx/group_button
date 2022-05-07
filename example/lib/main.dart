import 'package:example/examples/common_example/example.dart';
import 'package:example/examples/customizable_example/customizable_example.dart';
import 'package:example/examples/extended_example/example.dart';
import 'package:example/examples/full_options_example/full_options_example.dart';
import 'package:example/examples/generics_example/generics_example.dart';
import 'package:example/examples/styles_example/example.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

import 'examples/button_builder_example/example.dart';

class Routes {
  /// Use [GroupButtonExtendedExample]
  /// to check all package [GroupingType]'s in one place
  static const GroupButtonExtendedExample = '/GroupButtonExtendedExample';

  /// Use [StylesExample]
  /// to check all package style's configuration
  static const StylesExample = '/StylesExample';

  /// Use [CustomizableExample]
  /// to check package power
  static const CustomizableExample = '/CustomizableExample';

  /// Use [ButtonBuilderExample]
  /// to check how button builder works
  ///
  /// In this example GroupButton work as
  /// common flutter [Checkbox] and [Radio] buttons
  static const ButtonBuilderExample = '/ButtonBuilderExample';

  /// Use [FullOptionsSelectedExample]
  /// to check all [GroupButtonOptions]
  static const FullOptionsSelectedExample = '/FullOptionsSelectedExample';

  /// Use [GenericsExample]
  /// to check how works generic button values
  static const GenericsExample = '/GenericsExample';

  static const CommonExample = '/CommonExample';
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: <String, WidgetBuilder>{
        Routes.GroupButtonExtendedExample: (_) => GroupButtonExtendedExample(),
        Routes.StylesExample: (_) => StylesExample(),
        Routes.CustomizableExample: (_) => CustomizableExample(),
        Routes.ButtonBuilderExample: (_) => ButtonBuilderExample(),
        Routes.FullOptionsSelectedExample: (_) =>
            const FullOptionsSelectedExample(),
        Routes.GenericsExample: (_) => GenericsExample(),
        Routes.CommonExample: (_) => CommonExample(),
      },
      home: CommonExample(),
    );
  }
}
