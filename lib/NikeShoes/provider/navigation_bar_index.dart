import 'package:flutter/cupertino.dart';
import 'package:shoes_app2/NikeShoes/screens/screens.dart';

class NavigationIndex with ChangeNotifier {
  int _index = 0;

  final List _screens = [
    HomeScreen(),
    SearchScreen(),
    FavoriteScreen(),
    ShoppingCart(),
    ProfileScreen(),
  ];

  set index(int i) {
    _index = i;
    notifyListeners();
  }
  
  int get index => _index;

  Widget? get currentScreen => _screens[_index];

  
}
