import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {

  final String title;
  final List<Widget>? action;

  const CustomAppBar({
    super.key,
    required this.title,
    this.action = const [],
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title,style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      actions: action,
      elevation: 4,
      backgroundColor: Colors.blue,
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
