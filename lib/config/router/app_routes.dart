import 'package:citilink_app/screens/add_expenses.dart';
import 'package:citilink_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:citilink_app/config/router/routes.dart';

final navigationKey = GlobalKey<NavigatorState>();

final appRoutes =[
  GoRoute(
    path: RoutesLocation.home,
    parentNavigatorKey: navigationKey,
    builder: HomeScreen.builder,
  ),
  GoRoute(
    path: RoutesLocation.addExpenses,
    parentNavigatorKey: navigationKey,
    builder: AddExpenses.builder,
  ),
];