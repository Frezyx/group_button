library group_button;

import 'package:flutter/material.dart';
import 'package:group_button/src/blocs/group_button_bloc.dart';
import 'package:group_button/src/group_button_body.dart';
import 'package:provider/provider.dart';

class GroupButton extends StatelessWidget {
  const GroupButton({
    Key key,
    this.direction,
  }) : super(key: key);

  final Axis direction;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GroupButtonBloc>(
      create: (_) => GroupButtonBloc(),
      child: GroupButtonBody(direction: direction),
    );
  }
}
