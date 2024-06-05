import 'package:carteira_universitaria/controllers/carteira_controller.dart';
import 'package:carteira_universitaria/pages/movimentacao_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = CarteiraController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carteira Universtitária'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Saldo:',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            Text(
              '${controller.carteira.saldo}',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                bool edit = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovimentacaoPage(
                      controller: controller,
                    ),
                  ),
                );
                if (edit) {
                  setState(() {});
                }
              },
              child: const Icon(Icons.add),
            ),
            const SizedBox(height: 80),
            Expanded(
              child: ListView.builder(
                itemCount: controller.carteira.extrato.length,
                itemBuilder: (context, index) {
                  final movimentacao = controller.carteira.extrato[index];
                  return ListTile(
                    title: Text(movimentacao.descricao),
                    subtitle: Text(movimentacao.valor.toString()),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
