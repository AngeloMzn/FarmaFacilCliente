class User {
  final String nome, email, cpf, senha;
  final String? telefone, rg;

  const User(
    this.nome,
    this.telefone,
    this.email,
    this.cpf,
    this.rg,
    this.senha,
  );
}
