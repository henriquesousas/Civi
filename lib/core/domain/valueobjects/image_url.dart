import 'package:yousafe/core/domain/valueobjects/value_object.dart';

class ImageUrl extends ValueObject<String> {
  static final RegExp _urlRegex = RegExp(
    r'https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)',
    caseSensitive: false,
  );

  static const List<String> _allowedExtensions = ['png', 'jpg', 'jpeg'];

  ImageUrl._({required String value}) : super(value);

  factory ImageUrl.create({required String value}) {
    return ImageUrl._(value: value);
  }

  @override
  void validate(value) {
    if (value.isEmpty) {
      super.notification.add("imageUrl", "URL da imagem não pode ser vazia.");
      return;
    }

    if (!_urlRegex.hasMatch(value)) {
      super.notification.add("imageUrl", "O formato da URL não válida.");
    }

    if (!_hasAllowedExtension(value)) {
      super.notification.add("imageUrl",
          "A URL deve terminar com uma extensão permitida: ${_allowedExtensions.join(', ')}.");
    }
  }

  bool _hasAllowedExtension(String url) {
    final lowerCaseUrl = url.toLowerCase();

    for (final ext in _allowedExtensions) {
      if (lowerCaseUrl.contains('.$ext')) {
        return true;
      }
    }
    return false;
  }
}
