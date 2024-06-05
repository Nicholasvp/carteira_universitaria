import 'package:carteira_universitaria/models/movimentacao_model.dart';

class CarteiraModel {
  double saldo;
  List<MovimentacaoModel> extrato;

  CarteiraModel({required this.saldo, required this.extrato});
}
