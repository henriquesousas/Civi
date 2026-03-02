class PublicContactModel {
  final String name;
  final String phone;

  PublicContactModel({required this.name, required this.phone});

  static List<PublicContactModel> defaultContact() {
    return [
      PublicContactModel(
        name: 'Bombeiros',
        phone: '192',
      ),
      PublicContactModel(
        name: 'Ecovias',
        phone: '0800197878',
      ),
      PublicContactModel(
        name: 'Polícia Rodoviária Federal',
        phone: '198',
      ),
      PublicContactModel(
        name: 'Polícia Rodoviária',
        phone: '191',
      ),
      PublicContactModel(
        name: 'Polícia Militar',
        phone: '190',
      ),
      PublicContactModel(
        name: 'SAMU',
        phone: '192',
      ),
    ];
  }
}
