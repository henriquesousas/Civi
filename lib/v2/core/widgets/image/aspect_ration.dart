enum AspectRatioType {
  square,
  video,
  portrait,
  photo,
  ultraWide,
}

extension AspectRatioTypeExtension on AspectRatioType {
  double get value {
    switch (this) {
      case AspectRatioType.square:
        return 1.0;
      case AspectRatioType.video:
        return 16 / 9;
      case AspectRatioType.portrait:
        return 4 / 5;
      case AspectRatioType.photo:
        return 3 / 4;
      case AspectRatioType.ultraWide:
        return 21 / 9;
    }
  }
}
