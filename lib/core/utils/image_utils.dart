class ImageUtils {
  static String? extractImagePath(String url) {
    try {
      final uri = Uri.parse(url);
      String path = uri.path;
      if (path.startsWith('/')) {
        return path.substring(1);
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
