import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infdic/feature/mixin/home_view_mixin.dart';
import 'package:infdic/feature/view/auth/signup_view.dart';
import 'package:infdic/feature/view/dictionary_view.dart';
import 'package:infdic/product/state/product_state.dart';
import 'package:infdic/product/view_model/product_view_model.dart';

/// [HomeView] is the view of home page
@RoutePage()
final class HomeView extends StatefulWidget {
  /// Constructor
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with HomeViewMixin {
  @override
  Widget build(BuildContext context) {
    context.read<ProductViewModel>().checkSignIn();
    return BlocSelector<ProductViewModel, ProductState, bool>(
      selector: (state) {
        return state.isSignedIn;
      },
      builder: (context, state) {
        return state ? const DictionaryView() : const SignUpView();
      },
    );
  }
}
