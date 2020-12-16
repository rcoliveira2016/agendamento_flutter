import 'package:agendamentos/controllers/clientes/cliente_listagem_controller.dart';
import 'package:agendamentos/models/clientes/cliente_model.dart';
import 'package:agendamentos/shared/constants/name_routes.dart';
import 'package:agendamentos/shared/helper/get_helper.dart';
import 'package:agendamentos/shared/infra/Inject/Injection.dart';
import 'package:agendamentos/widgets/scaffold/app_bar_defalt.dart';
import 'package:agendamentos/widgets/scaffold/drawer_defat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClienteListagemView extends StatefulWidget {
  @override
  _ClienteListagemViewState createState() => _ClienteListagemViewState();
}

class _ClienteListagemViewState extends State<ClienteListagemView> {
  final ClienteListagemController _clienteListagemController =
      Injection.injector.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefalt(title: "Cliente"),
      drawer: DrawerDefalt(),
      body: Column(
        children: <Widget>[
          Card(
            child: TextFormField(
              onChanged: (text) {
                setState(() {
                  _clienteListagemController.filtro = text;
                });
              },
            ),
          ),
          Expanded(
            child: Card(
              child: FutureBuilder(
                builder: (BuildContext context,
                    AsyncSnapshot<List<Cliente>> snapshot) {
                  if (!snapshot.hasData) {
                    return Container(
                      child: CircularProgressIndicator(),
                    );
                  }
                  print(snapshot.data);
                  return NotificationListener<ScrollNotification>(
                    onNotification: (ScrollNotification scrollInfo){
                        if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {                        
                        setState(() {
                          _clienteListagemController.buscarMais();
                        });
                      }
                      return true;
                    },
                    child: ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        Cliente item = snapshot.data[index];
                        //return Text(item.nome);
                        return ListTile(
                          title: Text("${item.nome}"),
                          subtitle: Text("${item.localPadrao}"),
                          trailing: item.devendo
                              ? Icon(
                                  Icons.money_off,
                                  color: Colors.red,
                                  size: 40,
                                )
                              : Icon(
                                  Icons.attach_money,
                                  color: Colors.green,
                                  size: 40,
                                ),
                          onTap: () {
                            Get.toNamed(NamesRoutes.clienteAtualizar,
                                arguments: item.id);
                          },
                          onLongPress: () {
                            GetHelper.excluirDialogo(
                              titulo: "Excluir cliente",
                              mesagem:
                                  "Deseja excluir o cliente ${item.nome} (Também será excluido os agendamentos do mesmo).",
                              onConfirmacao: () {
                                _clienteListagemController.deletar(item.id).then(
                                    (_) {
                                  GetHelper.snackbarSucesso(
                                      mesagem:
                                          "Cliente ${item.nome} excluído com sucesso");
                                  setState(() {});
                                  Get.back();
                                }).catchError(() => GetHelper.snackbarErro(
                                    mesagem:
                                        "Cliente ${item.nome} excluido ocorreu"));
                              },
                            );
                          },
                          leading: Icon(Icons.perm_identity, size: 35),
                        );
                      },
                    ),
                  );
                },
                future: _clienteListagemController.buscarTodosClientes(),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: Theme.of(context).colorScheme,
        ),
        child: FloatingActionButton(
          onPressed: () {
            Get.toNamed(NamesRoutes.clienteCadastro);
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
