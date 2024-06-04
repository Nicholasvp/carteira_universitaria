import 'package:carteira_universitaria/models/carteira_model.dart';

class CarteiraController {
  final CarteiraModel carteira = CarteiraModel(saldo: 0, extrato: []);

  void depositar(double valor) {
    carteira.saldo += valor;
    carteira.extrato.add(valor);
  }

  void gastar(double valor) {
    carteira.saldo -= valor;
    carteira.extrato.add(-valor);
  }
}
