// Copyright 2024 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

abstract final class Dimens {
  const Dimens();

  static const size10 = 10.0;
  static const size14 = 14.0;
  static const size15 = 15.0;
  static const size16 = 16.0;
  static const size20 = 20.0;
  static const size22 = 22.0;
  static const size24 = 24.0;
  static const size26 = 26.0;
  static const size40 = 40.0;
  static const size50 = 50.0;
  static const size64 = 64.0;
  static const size90 = 90.0;
  static const size125 = 125.0;
  static const size140 = 140.0;
  static const size180 = 180.0;
  static const size200 = 200.0;
  static const size210 = 210.0;
  static const paddingHorizontal = 20.0;
  static const paddingVertical = 24.0;
  static const defaultPadding = 12.0;
  static const defaultRadius = 12.0;
  static const defaultButtonRadius = 90.0;
  static const cardExtraRadius = 20.0;
  static const defaultListTilePadding = 40.0;
  static const defaultArrowForward = 12.0;
  static const profileImage = 90.0;
  static const profileImageRadius = 90.0;
  static const defaultScafoldPadding = 14.0;

  /// Horizontal padding for screen edges
  double get paddingScreenHorizontal;

  /// Vertical padding for screen edges
  double get paddingScreenVertical;

  double get profilePictureSize;

  /// Horizontal symmetric padding for screen edges
  EdgeInsets get edgeInsetsScreenHorizontal =>
      EdgeInsets.symmetric(horizontal: paddingScreenHorizontal);

  /// Symmetric padding for screen edges
  EdgeInsets get edgeInsetsScreenSymmetric => EdgeInsets.symmetric(
        horizontal: paddingScreenHorizontal,
        vertical: paddingScreenVertical,
      );

  static const Dimens desktop = _DimensDesktop();
  static const Dimens mobile = _DimensMobile();

  /// Get dimensions definition based on screen size
  factory Dimens.of(BuildContext context) =>
      switch (MediaQuery.sizeOf(context).width) {
        > 600 && < 840 => desktop,
        _ => mobile,
      };
}

/// Mobile dimensions
final class _DimensMobile extends Dimens {
  @override
  final double paddingScreenHorizontal = Dimens.paddingHorizontal;

  @override
  final double paddingScreenVertical = Dimens.paddingVertical;

  @override
  final double profilePictureSize = 64.0;

  const _DimensMobile();
}

/// Desktop/Web dimensions
final class _DimensDesktop extends Dimens {
  @override
  final double paddingScreenHorizontal = 100.0;

  @override
  final double paddingScreenVertical = 64.0;

  @override
  final double profilePictureSize = 128.0;

  const _DimensDesktop();
}
