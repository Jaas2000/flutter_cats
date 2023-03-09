import 'package:flutter/material.dart';
import 'package:status_alert/status_alert.dart';

showError(BuildContext context, String title) {
  StatusAlert.show(
    context,
    duration: const Duration(seconds: 2),
    title: title,
    subtitle: '',
    configuration: const IconConfiguration(icon: Icons.error),
    maxWidth: 280,
  );
}
