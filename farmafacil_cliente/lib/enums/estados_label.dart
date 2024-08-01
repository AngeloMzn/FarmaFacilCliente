enum EstadosLabel {
  ac("AC", "Acre"),
  al("AL", "Alagoas"),
  ap("AP", "Amapá"),
  am("AM", "Amazonas"),
  ba("BA", "Bahia"),
  ce("CE", "Ceará"),
  df("DF", "Distrito Federal"),
  es("ES", "Espírito Santo"),
  go("GO", "Goías"),
  ma("MA", "Maranhão"),
  mt("MT", "Mato Grosso"),
  ms("MS", "Mato Grosso do Sul"),
  mg("MG", "Minas Gerais"),
  pa("PA", "Pará"),
  pb("PB", "Paraíba"),
  pr("PR", "Paraná"),
  pe("PE", "Pernambuco"),
  pi("PI", "Piauí"),
  rj("RJ", "Rio de Janeiro"),
  rn("RN", "Rio Grande do Norte"),
  rs("RS", "Rio Grande do Sul"),
  ro("RO", "Rondônia"),
  rr("RR", "Roraíma"),
  sc("SC", "Santa Catarina"),
  sp("SP", "São Paulo"),
  se("SE", "Sergipe"),
  to("TO", "Tocantins");

  const EstadosLabel(this.codigo, this.nome);
  final String codigo;
  final String nome;
}
