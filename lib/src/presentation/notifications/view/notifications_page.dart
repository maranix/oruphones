import 'package:flutter/material.dart';

import 'notifications_view.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  static route() => MaterialPageRoute<NotificationsView>(
        builder: (context) => const NotificationsPage(),
      );

  @override
  Widget build(BuildContext context) {
    return const NotificationsView();
  }
}
