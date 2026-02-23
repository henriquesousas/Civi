//TODO: Colocar esse codigo de formatacao da placa no ValueObejct Placa
class PlateUtils {
  static String format(String plate) {
    String cleanedPlate =
        plate.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '').toUpperCase();
    if (cleanedPlate.length >= 7) {
      return '${cleanedPlate.substring(0, 3)}-${cleanedPlate.substring(3, 4)}${cleanedPlate.substring(4, 5)}${cleanedPlate.substring(5, 7)}';
    }
    return cleanedPlate;
  }
}
