import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infdic/product/navigation/app_router.dart';
import 'package:infdic/product/utility/extension/padding_extension.dart';
import 'package:infdic/product/view_model/product_view_model.dart';
import 'package:sizer/sizer.dart';

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
      appBarBuilder: (_, tabsRouter) {
        // final tabsRouter = AutoTabsRouter.of(context);
        return AppBar(
          actions: [
            InkWell(
              onTap: () {
                context
                    .read<ProductViewModel>()
                    .userSignOut()
                    .whenComplete(() => context.router.popUntilRoot());
              },
              child: const Icon(
                Icons.logout_outlined,
              ),
            ).onlyPadding(right: 5.w),
          ],
        );
      },
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
