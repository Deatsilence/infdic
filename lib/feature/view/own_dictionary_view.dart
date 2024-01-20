import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

/// [OwnDictionaryView] is the view of own dictionary page
@RoutePage()
class OwnDictionaryView extends StatefulWidget {
  /// Constructor
  const OwnDictionaryView({super.key});

  @override
  State<OwnDictionaryView> createState() => _OwnDictionaryViewState();
}

class _OwnDictionaryViewState extends State<OwnDictionaryView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
    );
  }
}
