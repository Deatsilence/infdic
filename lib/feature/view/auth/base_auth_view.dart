// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:infdic/product/navigation/app_router.dart';

final class BaseAuthView<T> extends StatefulWidget {
  final Widget Function(BuildContext context, T value) onPageBuilder;
  final T? viewModel;
  final Function(T model)? onModelReady;
  final VoidCallback? onDispose;

  const BaseAuthView({
    required this.onPageBuilder,
    this.onDispose,
    this.viewModel,
    this.onModelReady,
    super.key,
  });

  @override
  State<BaseAuthView> createState() => _BaseAuthViewState();
}

class _BaseAuthViewState extends State<BaseAuthView> {
  @override
  void initState() {
    super.initState();
    if (widget.onModelReady != null && widget.viewModel != null) {
      widget.onModelReady!(widget.viewModel);
    }
  }

  @override
  void dispose() {
    if (widget.onModelReady != null) {
      widget.onDispose!();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            if (context.routeData.name == SignUpRoute.name)
              const SliverAppBar(),
            SliverPadding(
              padding:
                  PaddingManager.paddingManagerNormalPaddingSymmetricHorizontal,
              sliver: widget.onPageBuilder(context, widget.viewModel),
            ),
          ],
        ),
      ),
    );
  }
}
