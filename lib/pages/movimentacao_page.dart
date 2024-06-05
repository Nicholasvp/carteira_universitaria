import 'package:carteira_universitaria/utils/colors.dart';
import 'package:flutter/material.dart';

class MovimentacaoPage extends StatelessWidget {
  MovimentacaoPage({super.key});

  final expenseNameController = TextEditingController();
  final expenseValueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar Despesa'),
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
                decoration: InputDecoration(
                  labelText: 'Tipo de Despesa',
                  labelStyle: TextStyle(color: white),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: white),
                  ),
                ),
                items: ['Debito', 'Credito']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(color: white),
                    ),
                  );
                }).toList(),
                onChanged: (e) {
                  
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  // controller.addExpense();
                  // Get.back();
                  // controller.update();
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
        ))
    );
  }
}
