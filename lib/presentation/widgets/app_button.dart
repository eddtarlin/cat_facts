import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Function() onPress;
  final String title;
  final double height;

  const AppButton({
    Key? key,
    required this.onPress,
    required this.title,
    this.height = 56,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MaterialButton(
      onPressed: onPress,
      minWidth: double.infinity,
      height: height,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: theme.primaryColor,
      child: Text(
        title,
        style: theme.textTheme.bodyText1!.copyWith(color: Colors.white),
      ),
    );
  }
}
