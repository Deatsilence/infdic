import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infdic/product/view_model/product_view_model.dart';

/// [StateInitialize] is the state of initialize
final class StateInitialize extends StatelessWidget {
  /// Constructor
  const StateInitialize({required this.child, super.key});

  /// [child] is the child of state initialize
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductViewModel>(
          create: (context) => ProductViewModel(),
        ),
      ],
      child: child,
    );
  }
}
