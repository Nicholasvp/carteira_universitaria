import 'package:carteira_universitaria/controllers/carteira_controller.dart';
import 'package:carteira_universitaria/models/movimentacao_model.dart';
import 'package:carteira_universitaria/utils/colors.dart';
import 'package:flutter/material.dart';

class MovimentacaoPage extends StatefulWidget {
  const MovimentacaoPage({super.key, required this.controller});
  final CarteiraController controller;

  @override
  State<MovimentacaoPage> createState() => _MovimentacaoPageState();
}

class _MovimentacaoPageState extends State<MovimentacaoPage> {
  @override
  Widget build(BuildContext context) {
    String tipodeDespesa = '';
    final expenseNameController = TextEditingController();
    final expenseValueController = TextEditingController();
    return Scaffold(
      backgroundColor: darkBlue,
      appBar: AppBar(
        title: const Text('Registrar Movimentação'),
        backgroundColor: darkBlue,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: expenseNameController,
                style: TextStyle(color: white),
                decoration: InputDecoration(
                  labelText: 'Título da Despesa',
                  labelStyle: TextStyle(color: white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: expenseValueController,
                style: TextStyle(color: white),
                decoration: InputDecoration(
                  labelText: 'Valor da Despesa',
                  labelStyle: TextStyle(color: white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: white),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField(
                dropdownColor: darkBlue,
                decoration: InputDecoration(
                  labelText: 'Tipo de Movimentação',
                  labelStyle: TextStyle(color: white),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: white),
                  ),
                ),
                items: ['Depósito', 'Gasto'].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(color: white),
                    ),
                  );
                }).toList(),
                onChanged: (e) {
                  tipodeDespesa = e ?? '';
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  var movimentacaoModel = MovimentacaoModel(
                    descricao: expenseNameController.text,
                    valor: double.parse(expenseValueController.text),
                    data: DateTime.now().toString(),
                    tipo: tipodeDespesa,
                  );

                  setState(() {
                    if (tipodeDespesa == 'Depósito') {
                      widget.controller.depositar(movimentacaoModel);
                    } else {
                      widget.controller.gastar(movimentacaoModel);
                    }
                  });

                  Navigator.pop(context, true);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(white),
                ),
                child: Text(
                  'Registrar',
                  style: TextStyle(color: darkBlue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
