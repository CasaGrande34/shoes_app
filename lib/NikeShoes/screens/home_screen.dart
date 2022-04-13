import 'package:flutter/material.dart';

//Provider
import 'package:provider/provider.dart';

//dependencies
import 'package:community_material_icon/community_material_icon.dart';
import 'package:shoes_app2/NikeShoes/screens/components/components.dart';
import 'package:shoes_app2/NikeShoes/screens/screens.dart';

import 'components/custom_navigation_bar.dart';

//file addresses

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //ValueNotifier Navigation bar
  final ValueNotifier<bool> notifierBottomBarVisible = ValueNotifier(true);
  //Method Nike details screen
  void _onShoesPressed(NikeShoes shoes, BuildContext context) async {
    notifierBottomBarVisible.value = false;
    await Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          //opacity transition
          return FadeTransition(
            opacity: animation,
            child: NikeShoesDetails(
              nikeshoes: shoes,
            ),
          );
        },
      ),
    );
    notifierBottomBarVisible.value = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [
                //Logo Nike Arriba
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Image.asset(
                    'assets/logonike/LOGONIKE.png',
                    height: 28,
                  ),
                ),

                //List of Items
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.only(bottom: 40),
                    physics: const BouncingScrollPhysics(),
                    itemCount: shoes.length,
                    itemBuilder: (context, index) {
                      final shoesItem = shoes[index];
                      return NikeShoesItem(
                        shoesItem: shoesItem,
                        onTap: () {
                          _onShoesPressed(shoesItem, context);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          //*	--------------- *
          const NikeNavigationBar(),
        ],
      ),
    );
  }
}
