import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:infdic/product/navigation/app_router.dart';

/// [RootView] is the view of root page
@RoutePage()
final class RootView extends StatelessWidget {
  /// Constructor
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('RootView build');
    return AutoTabsScaffold(
      routes: const [
        DictionaryRoute(),
        OwnDictionaryRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        // final tabsRouter = AutoTabsRouter.of(context);
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined),
              label: 'Dictionary',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_outlined),
              label: 'Own Dictionary',
            ),
          ],
        );
      },
    );
  }
}
