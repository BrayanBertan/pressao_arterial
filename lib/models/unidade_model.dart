class Unidade {
  int id;
  String nome;

  Unidade(
      {this.id,
        this.nome,});

  factory Unidade.fromJson(Map obj) {
    return Unidade(
      id: obj['id'],
      nome: obj['nome'],);
  }

  @override
  String toString() {
    // TODO: implement toString
    return this.nome;
  }
}
