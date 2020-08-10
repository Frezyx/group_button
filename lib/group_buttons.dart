library group_button;

import 'package:flutter/material.dart';
import 'src/blocs/group_button_bloc.dart';
import 'src/group_button_body.dart';
import 'package:provider/provider.dart';

export 'src/group_custom_button.dart';

class GroupButton extends StatelessWidget {
  const GroupButton({
    Key key,
    this.direction,
    @required this.buttons,
    this.spacing,
  }) : super(key: key);

  final Axis direction;
  final List<Widget> buttons;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GroupButtonBloc>(
      create: (_) => GroupButtonBloc(),
      child: GroupButtonBody(
        spacing: spacing,
        direction: direction,
        buttons: buttons,
      ),
    );
  }
}
