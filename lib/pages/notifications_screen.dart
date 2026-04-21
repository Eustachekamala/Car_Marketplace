import 'package:car_marketplace/widgets/circle_icon_button_widget.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        centerTitle: true,
        toolbarHeight: 80,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: CircleIconButtonWidget(
            icon: Icons.arrow_back_ios_new,
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      body: const Center(child: Text("No notifications yet")),
    );
  }
}
