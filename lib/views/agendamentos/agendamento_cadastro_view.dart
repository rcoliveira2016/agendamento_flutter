import 'package:agendamentos/controllers/agendamentos/agendamento_cadastro_controller.dart';
import 'package:agendamentos/controllers/clientes/cliente_cadastro_controller.dart';
import 'package:agendamentos/shared/constants/name_routes.dart';
import 'package:agendamentos/shared/infra/Inject/Injection.dart';
import 'package:agendamentos/widgets/scaffold/app_bar_defalt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';

class AgendamentoCadastroView extends StatefulWidget {
  int id;
  AgendamentoCadastroView({this.id});
  @override
  _AgendamentoCadastroStateView createState() => _AgendamentoCadastroStateView();
}

class _AgendamentoCadastroStateView extends State<AgendamentoCadastroView> {
  final _formKey = GlobalKey<FormState>();
  final AgendamentoCadastroController _controller = Injection.injector.get();

  @override
  void initState() {
    super.initState();
    _controller.buscarAgendamento(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefalt(title: "Agendamento"),
      body: SingleChildScrollView(
        child:Padding(
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
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
                    child: Form(
                      key: _formKey,
                      child: Column(
                      children: <Widget>[
                        
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
                Get.toNamed(NamesRoutes.agendamento);
              })
              .catchError(()=> Get.snackbar("Erro", "Erro" ));
          }
        },
      ),
    );
  }
}
