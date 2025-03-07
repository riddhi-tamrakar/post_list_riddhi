import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'utils/route.dart';
import 'utils/theme.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
       debugShowCheckedModeBanner: false,
      title: 'Post App',
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: '/', // Define the initial route
      getPages: AppRoutes.pages, // Use the pages defined in AppRoutes
    );
  }
}
