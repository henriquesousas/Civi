class EnumUtils {
  static T fromString<T extends Enum>(
    List<T> values,
    String? value, {
    T? defaultValue,
    bool ignoreCase = true,
  }) {
    if (value == null) {
      if (defaultValue != null) return defaultValue;
      throw ArgumentError('Value cannot be null');
    }

    return values.firstWhere(
      (e) => ignoreCase
          ? e.name.toLowerCase() == value.toLowerCase()
          : e.name == value,
      orElse: () {
        if (defaultValue != null) return defaultValue;
        throw ArgumentError('Invalid enum value: $value');
      },
    );
  }
}
