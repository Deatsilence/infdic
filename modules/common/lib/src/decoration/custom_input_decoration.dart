import 'package:common/src/constants/border_radius/border_radius_manager.dart';
import 'package:common/src/constants/padding/padding_manager.dart';
import 'package:flutter/material.dart';

/// This is general input decoration for the project
final class CustomInputDecoration extends InputDecoration {
  /// The [CustomInputDecoration] class is extending the [InputDecoration]
  /// class from the
  /// `flutter/material.dart` package. The [CustomInputDecoration] class
  /// has a constructor that takes a
  /// named parameter `labelText` and passes it to the `super` constructor of
  /// the [InputDecoration]
  /// class.
  CustomInputDecoration({super.labelText, super.prefixIcon, super.suffixIcon})
      : super(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          constraints: const BoxConstraints(
            maxHeight: _maxHeightOfBoxConstraints,
            minHeight: _maxHeightOfBoxConstraints,
          ),
          contentPadding:
              PaddingManager.paddingManagerMorePaddingSymmetricHorizontal,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadiusManager.moreBorderRadius,
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadiusManager.moreBorderRadius,
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadiusManager.moreBorderRadius,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadiusManager.moreBorderRadius,
            borderSide: const BorderSide(
              color: Colors.red,
              width: _borderSideWidth,
            ),
          ),
        );

  static const double _maxHeightOfBoxConstraints = 70;
  static const double _borderSideWidth = 2;
}
