import 'package:car_marketplace/utils/app_bottom_modal_sheet.dart';
import 'package:flutter/material.dart';

class AppSheet {
  static void show({
    required BuildContext context,
    required String title,
    required String? message,
    required String? primaryText,
    required String? secondaryText,
    required VoidCallback onPrimaryPressed,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => AppBottomModalSheetWidget(
        title: title,
        message: message,
        primaryText: primaryText,
        secondaryText: secondaryText,
        onPrimaryPressed: onPrimaryPressed,
      ),
    );
  }
}