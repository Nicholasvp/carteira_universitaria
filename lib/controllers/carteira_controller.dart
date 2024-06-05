import 'package:carteira_universitaria/models/carteira_model.dart';
import 'package:carteira_universitaria/models/movimentacao_model.dart';

class CarteiraController {
  final CarteiraModel carteira = CarteiraModel(saldo: 0, extrato: []);

  void depositar(MovimentacaoModel movimentacaoModel) {
    carteira.saldo += movimentacaoModel.valor;
    carteira.extrato.add(movimentacaoModel);
  }

  void gastar(MovimentacaoModel movimentacaoModel) {
    carteira.saldo -= movimentacaoModel.valor;
    carteira.extrato.add(movimentacaoModel);
  }
}
