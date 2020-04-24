import 'package:flutter/material.dart';

class AppBarDefalt extends StatelessWidget implements PreferredSizeWidget {
  String title;
  List<Widget> actions;
  @override
  final Size preferredSize;

  AppBarDefalt({@required this.title, this.actions}) : preferredSize = Size.fromHeight(58.0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        title: Text(this.title),
        actions: actions,
      ),
    );
  }
}
