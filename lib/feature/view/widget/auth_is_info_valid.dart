// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:infdic/product/utility/extension/padding_extension.dart';
import 'package:sizer/sizer.dart';

class AuthIsInfoValid extends StatefulWidget {
  const AuthIsInfoValid({
    required this.controller,
    super.key,
  });

  final TextEditingController controller;

  @override
  State<AuthIsInfoValid> createState() => _AuthIsInfoValidState();
}

class _AuthIsInfoValidState extends State<AuthIsInfoValid> {
  bool isSuccess = false;

  @override
  Widget build(BuildContext context) {
    return FlutterPwValidator(
      defaultColor: Theme.of(context).disabledColor,
      controller: widget.controller,
      successColor: Theme.of(context).primaryColor,
      minLength: 8,
      uppercaseCharCount: 2,
      numericCharCount: 3,
      specialCharCount: 1,
      normalCharCount: 3,
      width: 50.w,
      height: 10.h,
      onSuccess: () {
        setState(() {
          isSuccess = true;
        });
      },
      onFail: () {
        setState(() {
          isSuccess = false;
        });
      },
    ).onlyPadding(top: 1.h);
  }
}
