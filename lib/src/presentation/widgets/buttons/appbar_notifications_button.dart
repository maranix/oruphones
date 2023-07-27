import "package:flutter/material.dart";
import "package:oruphones/src/presentation/notifications/notifications.dart";
import "package:oruphones/src/ui/colors.dart";

class AppBarNotificationsButton extends StatelessWidget {
  const AppBarNotificationsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.push(
          context,
          NotificationsPage.route(),
        );
      },
      icon: const Icon(
        Icons.notifications,
      ),
      color: OruColors.appBarIcon,
    );
  }
}
