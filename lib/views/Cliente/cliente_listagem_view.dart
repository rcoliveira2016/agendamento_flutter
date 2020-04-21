import 'package:agendamentos/controllers/clientes/cliente_listagem_controller.dart';
import 'package:agendamentos/models/clientes/cliente_model.dart';
import 'package:agendamentos/shared/constants/constants.dart';
import 'package:agendamentos/shared/constants/name_routes.dart';
import 'package:agendamentos/shared/infra/Inject/Injection.dart';
import 'package:agendamentos/widgets/scaffold/app_bar_defalt.dart';
import 'package:agendamentos/widgets/scaffold/drawer_defat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClienteListagemView extends StatelessWidget {
  final ClienteListagemController _clienteListagemController = Injection.injector.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefalt(title: Constantes.titleApp),
      drawer: DrawerDefalt(),
      body: FutureBuilder(
          builder:
              (BuildContext context, AsyncSnapshot<List<Cliente>> snapshot) {
            if (!snapshot.hasData) {
              return Container(
                child: CircularProgressIndicator(),
              );
            }
            print(snapshot.data);
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  Cliente item = snapshot.data[index];
                  return Card(
                    child: ListTile(
                      title: Text("${item.nome}"),
                      subtitle: Text("${item.localPadrao}"),
                      trailing: item.devendo?
                        Icon(Icons.money_off, color: Colors.red, size: 40,):
                        Icon(Icons.attach_money, color: Colors.green, size: 40,),
                      onTap: (){
                        Get.toNamed(NamesRoutes.clienteAtualizar, arguments: item.id);
                      },
                      leading: Icon(Icons.perm_identity, size: 35),
                    ),
                  );
                },
              );
          },
          future: _clienteListagemController.buscarTodos(),
        ),
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(
          colorScheme:
              Theme.of(context).colorScheme,
        ),
        child: FloatingActionButton(
          onPressed: (){
            Get.toNamed(NamesRoutes.clienteCadastro);
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}