import 'package:agendamentos/controllers/agendamentos/agendamento_listagem_controller.dart';
import 'package:agendamentos/models/agendamentos/agendamento_model.dart';
import 'package:agendamentos/shared/constants/constants.dart';
import 'package:agendamentos/shared/constants/name_routes.dart';
import 'package:agendamentos/shared/infra/Inject/Injection.dart';
import 'package:agendamentos/widgets/scaffold/app_bar_defalt.dart';
import 'package:agendamentos/widgets/scaffold/drawer_defat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AgendamentoListagemView extends StatelessWidget {
  final AgendamentoListagemController _agendamentoListagemController = Injection.injector.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefalt(title: Constantes.titleApp),
      drawer: DrawerDefalt(),
      body: FutureBuilder(
          builder:
              (BuildContext context, AsyncSnapshot<List<Agendamento>> snapshot) {
            if (!snapshot.hasData) {
              return Container(
                child: CircularProgressIndicator(),
              );
            }
            print(snapshot.data);
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  Agendamento item = snapshot.data[index];
                  return Card(
                    child: ListTile(
                      title: Text("${item.data}"),
                      subtitle: Text("${item.quantidade}"),
                      onTap: (){
                        Get.toNamed(NamesRoutes.agendamentoAtualizar, arguments: item.id);
                      },
                      leading: Icon(Icons.perm_identity, size: 35),
                    ),
                  );
                },
              );
          },
          future: _agendamentoListagemController.buscarTodos(),
        ),
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(
          colorScheme:
              Theme.of(context).colorScheme,
        ),
        child: FloatingActionButton(
          onPressed: (){
            Get.toNamed(NamesRoutes.agendamentoCadastro);
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}