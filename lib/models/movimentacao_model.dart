// ignore_for_file: public_member_api_docs, sort_constructors_first

class MovimentacaoModel {
  int id;
  String descricao;
  double valor;
  String data;
  String tipo;
  MovimentacaoModel({
    required this.id,
    required this.descricao,
    required this.valor,
    required this.data,
    required this.tipo,
  });
}
