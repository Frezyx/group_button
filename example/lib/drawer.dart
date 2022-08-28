import 'package:flutter/material.dart';

import 'routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          children: [
            ListTile(
              title: const Text('GroupButtonExtendedExample'),
              onTap: () => Navigator.of(context).pushReplacementNamed(
                Routes.groupButtonExtendedExample,
              ),
            ),
            ListTile(
              title: const Text('StylesExample'),
              onTap: () => Navigator.of(context).pushReplacementNamed(
                Routes.stylesExample,
              ),
            ),
            ListTile(
              title: const Text('CustomizableExample'),
              onTap: () => Navigator.of(context).pushReplacementNamed(
                Routes.customizableExample,
              ),
            ),
            ListTile(
              title: const Text('ButtonBuilderExample'),
              onTap: () => Navigator.of(context).pushReplacementNamed(
                Routes.buttonBuilderExample,
              ),
            ),
            ListTile(
              title: const Text('FullOptionsSelectedExample'),
              onTap: () => Navigator.of(context).pushReplacementNamed(
                Routes.fullOptionsSelectedExample,
              ),
            ),
            ListTile(
              title: const Text('GenericsExample'),
              onTap: () => Navigator.of(context).pushReplacementNamed(
                Routes.genericsExample,
              ),
            ),
            ListTile(
              title: const Text('CommonExample'),
              onTap: () => Navigator.of(context).pushReplacementNamed(
                Routes.commonExample,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
