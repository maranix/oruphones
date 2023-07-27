import 'package:flutter/material.dart';

class OruAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OruAppBar({
    super.key,
    this.appBarHeight = kToolbarHeight,
  });

  final double appBarHeight;

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.menu,
        ),
      ),
      actions: [
        AppbarNotificationsButton(),
      ],
      toolbarHeight: appBarHeight,
    );
  }
}
