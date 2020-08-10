import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'blocs/group_button_bloc.dart';

class GroupButtonBody extends StatelessWidget {
  const GroupButtonBody({
    Key key,
    this.direction,
  }) : super(key: key);

  final Axis direction;

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<GroupButtonBloc>(context);
    return Wrap(
      direction: direction ?? Axis.horizontal,
      children: <Widget>[
        Text(
          bloc.selectedIndex.toString(),
        ),
      ],
    );
  }
}
