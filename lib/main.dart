import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/pages/splash_screen.dart';
// import 'package:shopping_app/cart_page.dart';
import 'package:shopping_app/providers/cart_provider.dart';
// import 'package:shopping_app/pages/home_page.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
// import 'package:shopping_app/utils/button.dart';
// import 'package:shopping_app/utils/button.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => CartProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ChangeNotifier>(
      create: (context) => ChangeNotifier(),
      child: MaterialApp(
        title: "Shopping App",
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: "Lato",
          // colorScheme: const ColorScheme.highContrastLight()
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(254, 206, 1, 1),
            primary: const Color.fromRGBO(254, 206, 1, 1),
            // surface: Colors.grey,
          ),
        ),
        home: const SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
