import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unyta/provider/AppProviders/app_provider.dart';
import 'package:unyta/routes/app_routes.dart';
import 'package:unyta/routes/route_generator.dart';
import 'core/themes/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProviders.providers(context),
      child: MaterialApp(
        title: 'Unyta',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        initialRoute: AppRoutes.splashScreen,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
