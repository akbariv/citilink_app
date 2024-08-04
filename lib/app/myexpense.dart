// import 'package:citilink_app/config/theme/app_theme.dart';
import 'package:citilink_app/config/router/routes_provider.dart';
import 'package:flutter/material.dart';
import 'package:citilink_app/config/config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyExpense extends ConsumerWidget {
  const MyExpense({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final routeConfig = ref.watch(routesProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      routerConfig: routeConfig,
    );
  }
}
