import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:infdic/feature/view/auth/signup_view.dart';

/// [HomeView] is the view of home page
@RoutePage()
final class HomeView extends StatefulWidget {
  /// Constructor
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return const SignUpView();
  }
}
