// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:common/common.dart';
import 'package:flutter/material.dart';

class BaseAuthView extends StatefulWidget {
  const BaseAuthView({
    required this.sliver,
    super.key,
  });

  final Widget sliver;

  @override
  State<BaseAuthView> createState() => _BaseAuthViewState();
}

class _BaseAuthViewState extends State<BaseAuthView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding:
                  PaddingManager.paddingManagerNormalPaddingSymmetricHorizontal,
              sliver: widget.sliver,
            ),
          ],
        ),
      ),
    );
  }
}
