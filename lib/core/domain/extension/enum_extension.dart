extension StringEnumExtension on String {
  T? toEnum<T extends Enum>(List<T> values) {
    try {
      return values.firstWhere((e) => e.name == this);
    } catch (e) {
      return null;
    }
  }

  T toEnumOrElse<T extends Enum>(List<T> values, T defaultValue) {
    return toEnum(values) ?? defaultValue;
  }
}
