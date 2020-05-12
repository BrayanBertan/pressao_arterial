class Medicamento {
  String nome;
  double dose;
  int quantidade_diaria;
  int id_unidade;
  int id_tipo;
  String anotacao;

  Medicamento(
      {this.nome,
      this.dose,
      this.quantidade_diaria,
      this.id_unidade,
      this.id_tipo,
      this.anotacao});

  factory Medicamento.fromJson(Map obj) {
    return Medicamento(
        nome: obj['nome'],
        dose: obj['dose'],
        quantidade_diaria: obj['quantidade_diaria'],
        id_unidade: obj['id_unidade'],
        id_tipo: obj['id_tipo'],
        anotacao: obj['anotacao']);
  }

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'dose': dose,
      'quantidade_diaria': quantidade_diaria,
      'id_unidade': id_unidade,
      'id_tipo': id_tipo,
      'anotacao': anotacao
    };
  }
}
