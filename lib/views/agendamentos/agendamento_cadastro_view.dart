import 'package:agendamentos/controllers/agendamentos/agendamento_cadastro_controller.dart';
import 'package:agendamentos/shared/constants/name_routes.dart';
import 'package:agendamentos/shared/infra/Inject/Injection.dart';
import 'package:agendamentos/widgets/date_picker/date_picker_buttom.dart';
import 'package:agendamentos/widgets/forms/agendamento_form_field/dinheiro_agendamento_form_field.dart';
import 'package:agendamentos/widgets/forms/agendamento_form_field/numero_agendamento_form_field.dart';
import 'package:agendamentos/widgets/scaffold/app_bar_defalt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';

class AgendamentoCadastroView extends StatefulWidget {
  int id;
  AgendamentoCadastroView({this.id});
  @override
  _AgendamentoCadastroStateView createState() =>
      _AgendamentoCadastroStateView();
}

class _AgendamentoCadastroStateView extends State<AgendamentoCadastroView> {
  final _formKey = GlobalKey<FormState>();
  final AgendamentoCadastroController _controller = Injection.injector.get();

  @override
  void initState() {
    super.initState();
    _controller.init(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefalt(title: "Agendamento", actions:_boataoDeletar()),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Observer(builder: (_) {
            if (_controller.agendamentoAtual == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Observer(builder: (_) {
                          return _controller.itemsClientes.isEmpty
                              ? CircularProgressIndicator()
                              : DropdownButtonFormField<int>(
                                  items: _controller.itemsClientes
                                      .map((label) => DropdownMenuItem<int>(
                                            child: Row(
                                              children: <Widget>[
                                                label.devendo
                                                    ? Icon(
                                                        Icons.money_off,
                                                        color: Colors.red,
                                                        size: 25,
                                                      )
                                                    : Icon(
                                                        Icons.attach_money,
                                                        color: Colors.green,
                                                        size: 25,
                                                      ),
                                                Text(label.nome)
                                              ],
                                            ),
                                            value: label.id,
                                          ))
                                      .toList(),
                                  onChanged: _controller.setarCliente,
                                  value: _controller.agendamentoAtual.idCliente,
                                );
                        }),
                        Observer(builder: (_) {
                          return NumeroAgendamentoFormField(
                            labelText: "Quantidade cavalo",
                            hintText: "Digete um nome",
                            iconLabel: Icon(
                              Icons.pets,
                              size: 35,
                            ),
                            initialValue: _controller.quantidadeCavalos,
                            onSaved: _controller.agendamentoAtual.setQuantidade,
                          );
                        }),
                        Observer(builder: (_) {
                          return DinheiroAgendamentoFormField(
                            labelText: "Valor da divida",
                            hintText: "Digete o valor da divida do cliente",
                            initialValue: _controller.valorCalculado,
                            onSaved: _controller.agendamentoAtual.setValor,
                          );
                        }),
                        Observer(builder: (_) {
                          return DatePickerButtom(
                            initialDate: _controller.agendamentoAtual.data,
                            onChage: _controller.agendamentoAtual.setData,
                          );
                        }),
                        Row(
                          children: <Widget>[
                            Icon(Icons.pin_drop),
                            SizedBox(
                              width: 27,
                            ),
                            Text(
                              "Local: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17.5),
                            ),
                            Observer(builder: (_) {
                              return Text(
                                _controller.localPadrao,
                                style: TextStyle(fontSize: 17.5),
                              );
                            }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ));
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          if (_formKey.currentState.validate()) {
            _formKey.currentState.save();
            _controller.salvar().then((_) {
              Get.snackbar(
                "Sucesso",
                "Sucesso",
                margin: EdgeInsets.all(5),
                backgroundColor: Colors.green,
              );
              Get.toNamed(NamesRoutes.agendamento);
            }).catchError(() => Get.snackbar("Erro", "Erro"));
          }
        },
      ),
    );
  }

  _boataoDeletar() {
    return <Widget>[
        Observer(builder: (_)
        {
          return _controller?.agendamentoAtual?.id==null?SizedBox(): IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            Get.defaultDialog(
              title: "Agendamento",
              content: Container(
                child: Text("Deseja excluir o agendamento."),
              ),
              cancel: FlatButton(
                child: Text("Não"),
                onPressed: () => Get.back(),
              ),
              confirm: FlatButton(
                child: Text("Sim"),
                onPressed: () {
                  _controller.deletar(_controller.agendamentoAtual.id);
                  Get.offNamed(NamesRoutes.agendamento);
                },
              ),
            );
          },
        );
        })
      ];
  }
}
