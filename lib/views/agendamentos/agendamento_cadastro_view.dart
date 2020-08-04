import 'dart:math';
import 'dart:ui';

import 'package:agendamentos/controllers/agendamentos/agendamento_cadastro_controller.dart';
import 'package:agendamentos/shared/constants/name_routes.dart';
import 'package:agendamentos/shared/infra/Inject/Injection.dart';
import 'package:agendamentos/widgets/date_picker/date_picker_buttom.dart';
import 'package:agendamentos/widgets/forms/agendamento_form_field/dinheiro_agendamento_form_field.dart';
import 'package:agendamentos/widgets/forms/agendamento_form_field/numero_agendamento_form_field.dart';
import 'package:agendamentos/widgets/forms/agendamento_form_field/texto_agendamento_form_field.dart';
import 'package:agendamentos/widgets/scaffold/app_bar_defalt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:wc_flutter_share/wc_flutter_share.dart';

class AgendamentoCadastroView extends StatefulWidget {
  final int id;
  final int idCliente;
  AgendamentoCadastroView({this.id, this.idCliente});
  @override
  _AgendamentoCadastroStateView createState() =>
      _AgendamentoCadastroStateView();
}

class _AgendamentoCadastroStateView extends State<AgendamentoCadastroView> {
  final _formKey = GlobalKey<FormState>();
  final AgendamentoCadastroController _controller = Injection.injector.get();
  final screenshotController = ScreenshotController();

  @override
  void initState() {
    super.initState();
    _controller.init(widget.id, widget.idCliente);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefalt(title: "Agendamento", actions: _boataoDeletar()),
      body: Screenshot(
        controller: screenshotController,
        child: SingleChildScrollView(
          child: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
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
                          Container(
                            child: Observer(builder: (_) {
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
                                      value:
                                          _controller.agendamentoAtual.idCliente,
                                    );
                            }),
                          ),
                          Observer(builder: (_) {
                            return NumeroAgendamentoFormField(
                              labelText: "Quantidade cavalo",
                              hintText: "Digete um nome",
                              iconLabel: Icon(
                                Icons.pets,
                                size: 35,
                              ),
                              initialValue: _controller.quantidadeCavalos,
                              onSaved:
                                  _controller.agendamentoAtual.setQuantidade,
                            );
                          }),
                          Observer(builder: (_) {
                            return TextoAgendamentoFormField(
                              labelText: "Observações",
                              hintText: "Digete suas observações",
                              iconLabel: Icon(
                                Icons.add_comment,
                                size: 35,
                              ),
                              initialValue:
                                  _controller.agendamentoAtual.observacao,
                              onSaved:
                                  _controller.agendamentoAtual.setObservacao,
                              minLines: 1,
                            );
                          }),
                          Observer(builder: (_) {
                            return DatePickerButtom(
                              initialDate: _controller.agendamentoAtual.data,
                              onChage: _controller.agendamentoAtual.setData,
                            );
                          }),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Icon(Icons.pin_drop,color: Theme.of(context).hintColor,),
                              SizedBox(
                                width: 27,
                              ),
                              Text(
                                "Local: ",
                                style: TextStyle(
                                    color: Theme.of(context).hintColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.5),
                              ),
                              Observer(builder: (_) {
                                return Flexible(
                                  child: Text(
                                    "${_controller.localPadrao}",
                                    style: TextStyle(fontSize: 17.5, color: Theme.of(context).hintColor),
                                  ),
                                );
                              }),
                            ],
                          ),
                          Observer(builder: (_) {
                            return DinheiroAgendamentoFormField(
                              labelText: "Preço cobrado",
                              hintText: "Digete o valor da ferração",
                              initialValue: _controller.valorCalculado,
                              onSaved: _controller.agendamentoAtual.setValor,
                            );
                          }),
                          SizedBox(height: 15),
                          Observer(builder: (_) {
                            return 
                              Container(
                                width: double.infinity,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Status da ferradura",
                                      style: TextStyle(
                                          color: Theme.of(context).hintColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17.5),
                                    ),
                                    SizedBox(height: 5),
                                    ToggleSwitch(
                                      minWidth: 100.0,
                                      minHeight: 40.0,
                                      fontSize: 16.0,
                                      initialLabelIndex: _controller.indexFerramentaNova,
                                      activeBgColor: Colors.redAccent,
                                      activeFgColor: Colors.white,
                                      inactiveBgColor: Colors.blueGrey[50],
                                      inactiveFgColor: Theme.of(context).hintColor,
                                      labels: ['Nova', 'Repregado'],
                                      onToggle: (index) {
                                        _controller.agendamentoAtual.setFerramentaNova(index==0);
                                      },
                                    ),
                                  ],
                                ),
                              );
                          }),
                        ],
                      ),
                    ),
                  ));
            }),
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
                "Agendado com sucesso",
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
      Observer(builder: (_) {
        return _controller?.agendamentoAtual?.id == null
            ? SizedBox()
            : IconButton(
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
      }),
      Observer(builder: (_) {
        if (_controller?.agendamentoAtual?.id == null) return SizedBox();
        return IconButton(
          icon: Icon(Icons.share),
          onPressed: () async {
            var imagem = await screenshotController.captureAsUiImage();
            var bytes = await imagem.toByteData(format: ImageByteFormat.png);
            await WcFlutterShare.share(
                sharePopupTitle: 'Agendamento',
                fileName: '${new Random().nextInt(15)}.png',
                mimeType: 'image/png',
                bytesOfFile: bytes.buffer.asUint8List());
          },
        );
      })
    ];
  }
}
