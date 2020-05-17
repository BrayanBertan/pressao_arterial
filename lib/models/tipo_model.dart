class Tipo {
  int id;
  String nome;

  Tipo(
      {this.id,
        this.nome,});

  factory Tipo.fromJson(Map obj) {
    return Tipo(
      id: obj['id'],
      nome: obj['nome'],);
  }

  @override
  String toString() {
    // TODO: implement toString
    return this.nome;
  }
}
