class User {
  final String nome, email, cpf, senha, role;
  final String? telefone, rg;
  final DateTime dataNascimento;

  const User(
    this.nome,
    this.telefone,
    this.email,
    this.cpf,
    this.rg,
    this.senha,
    this.dataNascimento,
    this.role,
  );
}
