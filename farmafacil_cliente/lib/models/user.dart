class User {
  final String name, email, cpf, password, role, birthdate, image;
  final String? phoneNumber, rg;

  User({
    required this.name,
    required this.email,
    required this.cpf,
    required this.password,
    required this.role,
    required this.birthdate,
    required this.phoneNumber,
    required this.rg,
    required this.image,
  });
}
