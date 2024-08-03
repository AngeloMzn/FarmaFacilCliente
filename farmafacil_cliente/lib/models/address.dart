class Address {
  final String uf, cep, city, bairro, street, number, type, complement;

  Address({
    required this.uf,
    required this.cep,
    required this.city,
    required this.bairro,
    required this.street,
    required this.number,
    required this.type,
    required this.complement,
  });

  @override
  String toString() {
    return "UF: $uf, CEP: $cep, Cidade: $city, Bairro: $bairro, Rua: $street, Numero: $number, Tipo: $type, Complemento: $complement";
  }
}
