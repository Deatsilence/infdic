import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infdic/product/view_model/product_view_model.dart';

/// [DictionaryView] is the view of dictionary page
@RoutePage()
final class DictionaryView extends StatefulWidget {
  /// Constructor
  const DictionaryView({super.key});

  @override
  State<DictionaryView> createState() => _DictionaryViewState();
}

class _DictionaryViewState extends State<DictionaryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Dictionary'),
            InkWell(
              onTap: () async => await context
                  .read<ProductViewModel>()
                  .userSignOut()
                  .whenComplete(
                () {
                  context.router.popUntil((route) => route.isFirst);
                },
              ),
              child: const Icon(Icons.logout_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
