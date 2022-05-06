import 'package:flutter/material.dart';

import 'main.dart';

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
                Routes.GroupButtonExtendedExample,
              ),
            ),
            ListTile(
              title: const Text('StylesExample'),
              onTap: () => Navigator.of(context).pushReplacementNamed(
                Routes.StylesExample,
              ),
            ),
            ListTile(
              title: const Text('CustomizableExample'),
              onTap: () => Navigator.of(context).pushReplacementNamed(
                Routes.CustomizableExample,
              ),
            ),
            ListTile(
              title: const Text('ButtonBuilderExample'),
              onTap: () => Navigator.of(context).pushReplacementNamed(
                Routes.ButtonBuilderExample,
              ),
            ),
            ListTile(
              title: const Text('FullOptionsSelectedExample'),
              onTap: () => Navigator.of(context).pushReplacementNamed(
                Routes.FullOptionsSelectedExample,
              ),
            ),
            ListTile(
              title: const Text('GenericsExample'),
              onTap: () => Navigator.of(context).pushReplacementNamed(
                Routes.GenericsExample,
              ),
            ),
            ListTile(
              title: const Text('CommonExample'),
              onTap: () => Navigator.of(context).pushReplacementNamed(
                Routes.CommonExample,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
