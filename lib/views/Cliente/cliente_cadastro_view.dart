import 'dart:math';
import 'dart:ui';

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
import 'package:intl/intl.dart';
import 'package:agendamentos/shared/extension/date_time_extension.dart';
import 'package:screenshot/screenshot.dart';
import 'package:wc_flutter_share/wc_flutter_share.dart';

class ClienteCadastroView extends StatefulWidget {
  int id;
  ClienteCadastroView({this.id});
  @override
  _ClienteCadastroStateView createState() => _ClienteCadastroStateView();
}

class _ClienteCadastroStateView extends State<ClienteCadastroView> {
  final _formKey = GlobalKey<FormState>();
  final ClienteCadastroController _controller = Injection.injector.get();
  final screenshotController = ScreenshotController();
  @override
  void initState() {
    super.initState();
    _controller.buscarCliente(widget.id);
  }

  bool clienteExiste() {
    return _controller.clienteAtual != null && !_controller.clienteAtual.isNew;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefalt(
        title: "Cliente",
        actions: <Widget>[
          Observer(builder: (_) {
            return IconButton(
              icon: Icon(Icons.date_range),
              onPressed: () {
                print(clienteExiste());

                if (clienteExiste())
                  Get.toNamed(NamesRoutes.agendamentoCadastrarCliente,
                      arguments: _controller.clienteAtual.id);
              },
            );
          }),
          Observer(builder: (_) {
            if (!clienteExiste()) return SizedBox();
            return IconButton(
              icon: Icon(Icons.share),
              onPressed: () async {
                if (!clienteExiste()) return;

                var imagem = await screenshotController.captureAsUiImage();
                var bytes =
                    await imagem.toByteData(format: ImageByteFormat.png);
                await WcFlutterShare.share(
                    sharePopupTitle: 'Agendamento',
                    fileName: '${new Random().nextInt(15)}.png',
                    mimeType: 'image/png',
                    bytesOfFile: bytes.buffer.asUint8List());
              },
            );
          })
        ],
      ),
      body: SingleChildScrollView(
        child: Screenshot(
          controller: screenshotController,
          child: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            padding: const EdgeInsets.all(6.0),
            child: Column(
              children: <Widget>[
                Observer(builder: (_) {
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
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 6),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              TextoAgendamentoFormField(
                                labelText: "Nome",
                                hintText: "Digete um nome",
                                iconLabel: Icon(
                                  Icons.account_circle,
                                  size: 35,
                                ),
                                initialValue: _controller.clienteAtual.nome,
                                validator: _controller.validarTexto,
                                onSaved: (value) {
                                  _controller.clienteAtual.nome = value;
                                },
                              ),
                              NumeroAgendamentoFormField(
                                labelText: "Quantidade cavalo",
                                hintText: "Digete um nome",
                                iconLabel: Icon(
                                  Icons.pets,
                                  size: 35,
                                ),
                                initialValue:
                                    _controller.clienteAtual.quantidadeCavalos,
                                validator: _controller.validarNumero,
                                onSaved: (value) {
                                  _controller.clienteAtual.quantidadeCavalos =
                                      value;
                                },
                              ),
                              NumeroAgendamentoFormField(
                                labelText: "Frequência",
                                hintText: "Digete a frequência em dias",
                                iconLabel: Icon(
                                  Icons.replay,
                                  size: 35,
                                ),
                                initialValue:
                                    _controller.clienteAtual.frequencia,
                                validator: _controller.validarNumero,
                                onSaved: (value) {
                                  _controller.clienteAtual.frequencia = value;
                                },
                              ),
                              TextoAgendamentoFormField(
                                labelText: "Local Padrão",
                                hintText:
                                    "Digete um local padrão de atendimento",
                                iconLabel: Icon(
                                  Icons.pin_drop,
                                  size: 35,
                                ),
                                initialValue:
                                    _controller.clienteAtual.localPadrao,
                                validator: _controller.validarTexto,
                                onSaved: (value) {
                                  _controller.clienteAtual.localPadrao = value;
                                },
                              ),
                              DinheiroAgendamentoFormField(
                                labelText: "Valor",
                                hintText: "Digete o valor",
                                initialValue:
                                    _controller.clienteAtual.valorDivida,
                                onSaved: (value) {
                                  _controller.clienteAtual.valorDivida = value;
                                },
                              ),
                            ],
                          ),
                        ),
                      ));
                }),
                Observer(builder: (_) {
                  return clienteExiste()
                      ? Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Datas:",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: <Widget>[
                                    Text("Ultimo agendamento: ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Container(
                                      child: _controller.ultimoAgendamento ==
                                              null
                                          ? Center(
                                              child: Text("Não possui"),
                                            )
                                          : Text(
                                              "${_controller.ultimoAgendamento.formatar(DateFormat.YEAR_MONTH_DAY)}"),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text("Próxima data agendada: ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Container(
                                      child: _controller.proximoAgendamento ==
                                              null
                                          ? Center(
                                              child: Text("Não possui"),
                                            )
                                          : Text(
                                              "${_controller.proximoAgendamento.formatar(DateFormat.YEAR_MONTH_DAY)}"),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      : SizedBox();
                }),
                Observer(builder: (_) {
                  return clienteExiste()
                      ? Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  width: 230,
                                  child: _controller
                                              .itemsDeAgendamentos.length <
                                          1
                                      ? RaisedButton(
                                          color: Colors.red,
                                          textColor: Colors.white,
                                          onPressed: () {
                                            _controller.mostarAgendamentos();
                                          },
                                          child: Row(
                                            children: <Widget>[
                                              Icon(
                                                  Icons.supervised_user_circle),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text("mostar agendamentos"),
                                            ],
                                          ),
                                        )
                                      : SizedBox(),
                                ),
                                _controller.itemsDeAgendamentos.length > 0
                                    ? Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          SizedBox(height: 5),
                                          Row(
                                            children: <Widget>[
                                              Icon(
                                                Icons.supervised_user_circle,
                                                size: 30,
                                              ),
                                              SizedBox(width: 5),
                                              Text("Ultimos 10 agendamentos",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ],
                                          ),
                                          SizedBox(height: 10),
                                          Divider(
                                            color: Colors.black,
                                          ),
                                          Container(
                                            constraints: BoxConstraints(
                                              maxHeight: 355,
                                            ),
                                            child: ListView.builder(
                                                itemCount: _controller
                                                    .itemsDeAgendamentos.length,
                                                itemBuilder: (_, int index) {
                                                  var agendamento = _controller
                                                          .itemsDeAgendamentos[
                                                      index];
                                                  return Column(
                                                    children: <Widget>[
                                                      ListTile(
                                                        leading: Icon(
                                                          Icons.toc,
                                                          size: 50,
                                                          color: Colors.black,
                                                        ),
                                                        onTap: () {
                                                          Get.toNamed(
                                                              NamesRoutes
                                                                  .agendamentoAtualizar,
                                                              arguments:
                                                                  agendamento
                                                                      .id);
                                                        },
                                                        title: Row(
                                                          children: <Widget>[
                                                            Text("Data: ",
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                            Text(
                                                                "${agendamento.data.formatar(DateFormat.YEAR_MONTH_DAY)}"),
                                                          ],
                                                        ),
                                                        subtitle: Row(
                                                          children: <Widget>[
                                                            Text("Observação: ",
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                            Flexible(
                                                              child: Text(
                                                                  "${agendamento.observacao}"),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Divider(
                                                        color: Colors.grey,
                                                      )
                                                    ],
                                                  );
                                                }),
                                          ),
                                        ],
                                      )
                                    : SizedBox(
                                        height: 1,
                                      )
                              ],
                            ),
                          ),
                        )
                      : SizedBox(
                          height: 1,
                        );
                }),
                SizedBox(
                  height: 75,
                )
              ],
            ),
          ),
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
              Get.toNamed(NamesRoutes.cliente);
            }).catchError(() => Get.snackbar("Erro", "Erro"));
          }
        },
      ),
    );
  }
}
