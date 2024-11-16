import 'package:flutter/material.dart';
import 'package:snapchat_clone/models/theme/app_theme.dart';
import 'package:snapchat_clone/routes.dart';

class SnapCloneApp extends StatelessWidget {
  const SnapCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.appTheme,
      routerConfig: router,
    );
  }
}
