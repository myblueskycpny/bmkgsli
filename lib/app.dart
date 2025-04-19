import 'package:flutter/material.dart';
import 'routes/app_routes.dart';
import 'screens/menu_utama.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'FiraSans',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 0, 123, 255),
        ),
        useMaterial3: true,
      ),
      routes: AppRoutes.routes,
      onGenerateRoute: AppRoutes.generateRoute,
      home: MenuUtamaScreen(),
    );
  }
}
