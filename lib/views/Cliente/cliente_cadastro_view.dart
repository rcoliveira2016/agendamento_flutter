import 'package:agendamentos/controllers/clientes/cliente_cadastro_controller.dart';
import 'package:agendamentos/shared/constants/name_routes.dart';
import 'package:agendamentos/shared/infra/Inject/Injection.dart';
import 'package:agendamentos/widgets/forms/agendamento_form_field/dinheiro_agendamento_form_field.dart';
import 'package:agendamentos/widgets/forms/agendamento_form_field/numero_agendamento_form_field.dart';
import 'package:agendamentos/widgets/forms/agendamento_form_field/texto_agendamento_form_field.dart';
import 'package:agendamentos/widgets/scaffold/app_bar_defalt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';

class ClienteCadastroView extends StatefulWidget {
  int id;
  ClienteCadastroView({this.id});
  @override
  _ClienteCadastroStateView createState() => _ClienteCadastroStateView();
}

class _ClienteCadastroStateView extends State<ClienteCadastroView> {
  final _formKey = GlobalKey<FormState>();
  final ClienteCadastroController _controller = Injection.injector.get();

  @override
  void initState() {
    super.initState();
    _controller.buscarCliente(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefalt(title: "Cliente"),
      body: SingleChildScrollView(
        child:Padding(
            padding: const EdgeInsets.all(6.0),
            child: Observer(builder: (_) {
              if (_controller.clienteAtual == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
                    child: Form(
                      key: _formKey,
                      child: Column(
                      children: <Widget>[
                        TextoAgendamentoFormField(
                          labelText: "Nome",
                          hintText: "Digete um nome",
                          iconLabel: Icon(Icons.account_circle, size: 35,),
                          initialValue: _controller.clienteAtual.nome,
                          validator: _controller.validarTexto,
                          onSaved: (value) {
                            _controller.clienteAtual.nome = value;
                          },
                        ),
                        NumeroAgendamentoFormField(
                          labelText: "Quantidade cavalo",
                          hintText: "Digete um nome",
                          iconLabel: Icon(Icons.pets, size: 35,),
                          initialValue: _controller.clienteAtual.quantidadeCavalos,
                          validator: _controller.validarNumero,
                          onSaved: (value) {
                            _controller.clienteAtual.quantidadeCavalos = value;
                          },
                        ),
                        NumeroAgendamentoFormField(
                          labelText: "Frequência",
                          hintText: "Digete a frequência em dias",
                          iconLabel: Icon(Icons.replay, size: 35,),
                          initialValue: _controller.clienteAtual.frequencia,
                          validator: _controller.validarNumero,
                          onSaved: (value) {
                            _controller.clienteAtual.frequencia = value;
                          },
                        ),
                        TextoAgendamentoFormField(
                          labelText: "Local Padrão",
                          hintText: "Digete um local padrão de atendimento",
                          iconLabel: Icon(Icons.pin_drop, size: 35,),
                          initialValue: _controller.clienteAtual.localPadrao,
                          validator: _controller.validarTexto,
                          onSaved: (value) {
                            _controller.clienteAtual.localPadrao = value;
                          },
                        ),
                        DinheiroAgendamentoFormField(
                          labelText: "Valor da divida",
                          hintText: "Digete o valor da divida do cliente",
                          initialValue: _controller.clienteAtual.valorDivida,
                          onSaved: (value) {
                            _controller.clienteAtual.valorDivida = value;
                          },
                        ),
                      ],
                    ),                
                  ),
                )
              );
            }),
          ),
        ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          if (_formKey.currentState.validate()) {
            _formKey.currentState.save();
            _controller.salvar()
              .then((_) {
                Get.snackbar(
                  "Sucesso", 
                  "Sucesso", 
                  margin: EdgeInsets.all(5), 
                  backgroundColor: Colors.green,
                );
                Get.toNamed(NamesRoutes.cliente);
              })
              .catchError(()=> Get.snackbar("Erro", "Erro" ));
          }
        },
      ),
    );
  }
}
