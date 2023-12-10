import 'package:flutter/material.dart';

/// This is padding manager
@immutable
final class PaddingManager {
  // TODO: All Paddings

  /// [paddingManagerNormalPaddingAll] is padding for normal
  static const EdgeInsets paddingManagerNormalPaddingAll = EdgeInsets.all(10);

  /// [paddingManagerMorePaddingAll] is padding for more
  static const EdgeInsets paddingManagerMorePaddingAll = EdgeInsets.all(20);

  // TODO: Symmetrical Paddings

  /// [paddingManagerNormalPaddingSymmetricHorizontal] is padding for normal
  static const EdgeInsets paddingManagerNormalPaddingSymmetricHorizontal =
      EdgeInsets.symmetric(horizontal: 10);

  /// [paddingManagerMorePaddingSymmetricHorizontal] is padding for more
  static const EdgeInsets paddingManagerMorePaddingSymmetricHorizontal =
      EdgeInsets.symmetric(horizontal: 20);
}
