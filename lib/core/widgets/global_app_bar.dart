import 'package:flutter/material.dart';

class GlobalAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(60);

  const GlobalAppBar({Key? key, this.title = ''}) : super(key: key);

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      brightness: Brightness.dark,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        color: Colors.black,
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
