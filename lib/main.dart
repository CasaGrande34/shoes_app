import 'package:flutter/material.dart';

import 'package:shoes_app2/NikeShoes/screens/screens.dart';

import 'package:provider/provider.dart';
import 'NikeShoes/provider/navigation_bar_index.dart';

//file addresses

void main() {
  runApp(
    ChangeNotifierProvider<NavigationIndex>(
      create: (context) => NavigationIndex(), lazy: false,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shoes App',
      home: HomeScreen(),
    );
  }
}
