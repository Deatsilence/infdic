// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:infdic/product/navigation/app_router.dart';

final class BaseView<T> extends StatefulWidget {
  const BaseView({
    required this.onPageBuilder,
    this.onDispose,
    this.viewModel,
    this.onModelReady,
    super.key,
    this.bottomNavigationBar,
  });

  final Widget Function(BuildContext context, T value) onPageBuilder;
  final T? viewModel;
  final Function(T model)? onModelReady;
  final VoidCallback? onDispose;
  final Widget? bottomNavigationBar;

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
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
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: SafeArea(
          child: CustomScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            slivers: [
              if (context.routeData.name == SignUpRoute.name ||
                  context.routeData.name == PhoneNumberVerificationRoute.name ||
                  context.routeData.name == OTPRoute.name)
                const SliverAppBar(),
              SliverPadding(
                padding: PaddingManager
                    .paddingManagerNormalPaddingSymmetricHorizontal,
                sliver: widget.onPageBuilder(context, widget.viewModel),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: widget.bottomNavigationBar,
    );
  }
}
