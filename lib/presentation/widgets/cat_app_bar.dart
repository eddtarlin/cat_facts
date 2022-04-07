import 'package:flutter/material.dart';

class CatAppBar extends AppBar {
  final String text;
  final BuildContext context;

  CatAppBar({
    Key? key,
    required this.text,
    required this.context,
  }) : super(
          key: key,
          title: Text(
            text,
            style: Theme.of(context).textTheme.headline6,
            overflow: TextOverflow.ellipsis,
          ),
          elevation: 0,
        );
}
