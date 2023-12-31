import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

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
    return const Scaffold(
      backgroundColor: Colors.pink,
    );
  }
}
