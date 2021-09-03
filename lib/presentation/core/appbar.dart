import 'package:flutter/material.dart';

class AppBarSection extends StatelessWidget with PreferredSizeWidget {
  const AppBarSection(
      {Key? key,
      required this.title,
      required this.actions,
      this.elevation = 1})
      : super(key: key);
  final String title;
  final List<Widget> actions;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: this.elevation,
        iconTheme: IconThemeData(color: Colors.black),
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.black,
            ),
        title: Text(
          "$title",
          style: TextStyle(
            color: Colors.black87,
          ),
        ),
        actions: this.actions);
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 55);
}
