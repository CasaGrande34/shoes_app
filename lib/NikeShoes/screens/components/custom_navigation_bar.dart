import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

import '../screens.dart';

class NikeNavigationBar extends StatelessWidget {
  const NikeNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      //ValueNotifier Navigation bar
    final ValueNotifier<bool> notifierBottomBarVisible = ValueNotifier(true);

    return ValueListenableBuilder<bool>(
      valueListenable: notifierBottomBarVisible,
      child: Container(
        color: Colors.white.withOpacity(0.7),
        child: Row(
          children: [
            Expanded(
              child: IconButton(
                icon: const Icon(
                  CommunityMaterialIcons.home_analytics,
                ),
                onPressed: () {
                  
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        //opacity transition
                        return FadeTransition(
                          opacity: animation,
                          child: HomeScreen(),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: IconButton(
                icon: const Icon(
                  CommunityMaterialIcons.select_search,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        //opacity transition
                        return FadeTransition(
                          opacity: animation,
                          child: SearchScreen(),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: IconButton(
                icon: const Icon(
                  Icons.favorite,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        //opacity transition
                        return FadeTransition(
                          opacity: animation,
                          child: FavoriteScreen(),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: IconButton(
                icon: const Icon(
                  CommunityMaterialIcons.shopping_outline,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        //opacity transition
                        return FadeTransition(
                          opacity: animation,
                          child: ShoppingCart(),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: Center(
                child: InkWell(

                  onTap: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) {
                          //opacity transition
                          return FadeTransition(
                            opacity: animation,
                            child: ProfileScreen(),
                          );
                        },
                      ),
                    );
                  },
                  child: const CircleAvatar(
                    radius: 12,
                    backgroundImage: AssetImage('assets/logonike/perfil.jpg'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      builder: (context, value, child) {
        return AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          left: 0,
          right: 0,
          bottom: value ? 0 : -kToolbarHeight,
          height: kToolbarHeight,
          child: child!,
        );
      },
    );
  }
}
