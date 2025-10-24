class CreateUseDto {
  final String name;
  final String surname;
  final String email;
  final String phone;
  final String password;
  final String gender;

  CreateUseDto(
      {required this.name,
      required this.surname,
      required this.email,
      required this.phone,
      required this.password,
      required this.gender});
}
