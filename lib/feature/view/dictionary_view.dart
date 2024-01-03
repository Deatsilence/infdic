import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:infdic/feature/mixin/dictionary_view_mixin.dart';
import 'package:infdic/feature/view_model/dictionary_view_model.dart';
import 'package:infdic/product/state/dictionary_view_state.dart';
import 'package:infdic/product/view_model/product_view_model.dart';

/// [DictionaryView] is the view of dictionary page
@RoutePage()
final class DictionaryView extends StatefulWidget {
  /// Constructor
  const DictionaryView({super.key});

  @override
  State<DictionaryView> createState() => _DictionaryViewState();
}

class _DictionaryViewState extends State<DictionaryView>
    with DictionaryViewMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => dictionaryViewModel,
      child: Scaffold(
        body: Center(
          child: _DictionaryBody(dictionaryViewModel: dictionaryViewModel),
        ),
      ),
    );
  }
}

final class _DictionaryBody extends StatelessWidget {
  const _DictionaryBody({required this.dictionaryViewModel});

  final DictionaryViewModel dictionaryViewModel;

  @override
  Widget build(BuildContext context) {
    dictionaryViewModel.getUser();
    return BlocSelector<DictionaryViewModel, DictionaryViewState, InfDicUser?>(
      selector: (state) {
        return state.infDicUser;
      },
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(state?.email ?? ''),
            // Text(state!.createdAt.toString()),
            Text(state?.uId ?? ''),
            Text(state?.phoneNumber ?? ''),
            InkWell(
              onTap: () async =>
                  context.read<ProductViewModel>().userSignOut().whenComplete(
                () {
                  context.router.popUntil((route) => route.isFirst);
                },
              ),
              child: const Icon(Icons.logout_outlined),
            ),
          ],
        );
      },
    );
  }
}
