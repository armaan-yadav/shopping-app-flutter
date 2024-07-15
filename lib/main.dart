import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_app/cart/cart_page.dart';
// import 'package:shoping_app/global_variables.dart';
import 'package:shoping_app/home/home_page.dart';
import 'package:shoping_app/provider/cart_provider.dart';
// import 'package:shoping_app/home_page.dart';
// import 'package:shoping_app/product_details_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.debugCheckInvalidValueType = null;
    return Provider(
      create: (context) {
        return CartProvider();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Shopping App",
        theme: ThemeData(
          fontFamily: "Lato",
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blueGrey,
          ),
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(
              fontSize: 16,
              color: Color.fromRGBO(119, 119, 119, 1),
              fontWeight: FontWeight.w600,
            ),
            prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
          ),
          textTheme: const TextTheme(
            titleMedium: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        home: const HomePage(),
      ),
    );
  }
}
