import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,

      title: Icon(Icons.arrow_back),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
