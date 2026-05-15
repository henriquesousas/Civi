import 'package:deehelp/business/_shared/value_objects/value_object.dart';

class ImageUrl extends ValueObject<String> {
  final _validExtensions = [
    ".jpg",
    ".jpeg",
    ".png",
  ];
  ImageUrl._(super.value);

  factory ImageUrl.create(String value) {
    return ImageUrl._(value.trim());
  }

  @override
  void validate(String value) {
    if (value.isEmpty) {
      addError("image", "A imagem é obrigatória");
      return;
    }

    final uri = Uri.tryParse(value);

    if (uri == null || !uri.hasAbsolutePath) {
      addError("image", "URL da imagem inválida");
      return;
    }

    final hasValidExtension = _validExtensions.any(
      (ext) => value.toLowerCase().endsWith(ext),
    );

    if (!hasValidExtension) {
      addError(
        "image",
        "Formato de imagem inválido",
      );
    }
  }
}
