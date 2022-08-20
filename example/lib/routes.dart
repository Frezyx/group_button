import 'package:flutter/material.dart';

import 'examples/button_builder_example/example.dart';
import 'examples/common_example/example.dart';
import 'examples/customizable_example/customizable_example.dart';
import 'examples/extended_example/example.dart';
import 'examples/full_options_example/full_options_example.dart';
import 'examples/generics_example/generics_example.dart';
import 'examples/styles_example/example.dart';

class Routes {
  /// Use [GroupButtonExtendedExample]
  /// to check all package [GroupingType]'s in one place
  static const groupButtonExtendedExample = '/GroupButtonExtendedExample';

  /// Use [StylesExample]
  /// to check all package style's configuration
  static const stylesExample = '/StylesExample';

  /// Use [CustomizableExample]
  /// to check package power
  static const customizableExample = '/CustomizableExample';

  /// Use [ButtonBuilderExample]
  /// to check how button builder works
  ///
  /// In this example GroupButton work as
  /// common flutter [Checkbox] and [Radio] buttons
  static const buttonBuilderExample = '/ButtonBuilderExample';

  /// Use [FullOptionsSelectedExample]
  /// to check all [GroupButtonOptions]
  static const fullOptionsSelectedExample = '/FullOptionsSelectedExample';

  /// Use [GenericsExample]
  /// to check how works generic button values
  static const genericsExample = '/GenericsExample';

  /// Use [CommonExample]
  /// to check the common example
  static const commonExample = '/CommonExample';

  ///
  ///
  static final appRoutes = <String, WidgetBuilder>{
    Routes.groupButtonExtendedExample: (_) => GroupButtonExtendedExample(),
    Routes.stylesExample: (_) => StylesExample(),
    Routes.customizableExample: (_) => CustomizableExample(),
    Routes.buttonBuilderExample: (_) => ButtonBuilderExample(),
    Routes.fullOptionsSelectedExample: (_) =>
        const FullOptionsSelectedExample(),
    Routes.genericsExample: (_) => GenericsExample(),
    Routes.commonExample: (_) => CommonExample(),
  };
}
