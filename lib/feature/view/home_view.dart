import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infdic/feature/view/auth/signup_view.dart';
import 'package:infdic/feature/view/dictionary_view.dart';
import 'package:infdic/feature/view/root_view.dart';
import 'package:infdic/product/state/product_state.dart';
import 'package:infdic/product/view_model/product_view_model.dart';

/// [HomeView] is the view of home page
@RoutePage()
final class HomeView extends StatelessWidget {
  /// Constructor
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('HomeView build');
    context.read<ProductViewModel>().checkSignIn();
    return BlocSelector<ProductViewModel, ProductState, bool>(
      selector: (state) {
        return state.isSignedIn;
      },
      builder: (context, state) {
        return state ? const RootView() : const SignUpView();
      },
    );
  }
}
