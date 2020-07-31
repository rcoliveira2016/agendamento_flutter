import 'package:agendamentos/controllers/agendamentos/agendamento_listagem_controller.dart';
import 'package:agendamentos/models/agendamentos/agendamento_listagem_model.dart';
import 'package:agendamentos/repositories/aplicativo/termo_uso_repository.dart';
import 'package:agendamentos/shared/constants/constants.dart';
import 'package:agendamentos/shared/constants/name_routes.dart';
import 'package:agendamentos/shared/infra/Inject/Injection.dart';
import 'package:agendamentos/widgets/scaffold/app_bar_defalt.dart';
import 'package:agendamentos/widgets/scaffold/drawer_defat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:agendamentos/shared/extension/date_time_extension.dart';

class AgendamentoListagemView extends StatefulWidget {
  @override
  _AgendamentoListagemViewState createState() =>
      _AgendamentoListagemViewState();
}

class _AgendamentoListagemViewState extends State<AgendamentoListagemView> {
  final AgendamentoListagemController _controller = Injection.injector.get();
  static TermoUsoRepository _termoUsoRepository = Injection.injector.get();

  static final fontSizeTextStyleFiltroData = 15.0;
  static final textStyleFiltroData =
      TextStyle(fontSize: fontSizeTextStyleFiltroData);

  @override
  void initState() {
    super.initState();
    //_termoUsoRepository.resetar().then((_){});
    _termoUsoRepository.obterStatus().then((status){
      if(status!=StatusTermoUso.aceito)
        Get.offAllNamed(NamesRoutes.termoUso,arguments: status==StatusTermoUso.recusado);
    });
    _controller.init();    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefalt(title: Constantes.titleApp),
      drawer: DrawerDefalt(),
      body: _body(),
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: Theme.of(context).colorScheme,
        ),
        child: FloatingActionButton(
          onPressed: () {
            Get.toNamed(NamesRoutes.agendamentoCadastro);
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Widget _body() {
    return Observer(
      builder: (_) {
        return Column(
          children: <Widget>[
            _filtro(),
            _listagem(),
          ],
        );
      },
    );
  }

  Widget _filtro() {
    return Card(
      margin: EdgeInsets.fromLTRB(5, 15, 5, 5),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.black12, width: 1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Observer(builder: (_) {
        return _controller.dataInicioSemana == null
            ? SizedBox()
            : FlatButton(
                onPressed: () {
                  var picked = showDatePicker(
                      context: context,
                      initialDate: _controller.dataInicioSemana,
                      firstDate: DateTime(2017),
                      lastDate: DateTime(2100));
                  picked.then(_controller.filtroData);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "filtro: ",
                      style: TextStyle(
                          fontSize: fontSizeTextStyleFiltroData,
                          fontWeight: FontWeight.w900),
                    ),
                    Text(
                      _controller.dataInicioSemana.formatar("d MMMM"),
                      style: textStyleFiltroData,
                    ),
                    Text(
                      " entre ",
                      style: textStyleFiltroData,
                    ),
                    Text(
                      _controller.dataFinalSemana.formatar("d MMMM"),
                      style: textStyleFiltroData,
                    )
                  ],
                ),
              );
      }),
    );
  }

  Widget _listagem() {
    return Expanded(
      child: _controller.items.isEmpty
          ? Center(
              child: Text("Sem dados"),
            )
          : Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black12, width: 1),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: ListView.builder(
                    itemCount: _controller.items.length,
                    itemBuilder: (context, index) {
                      AgendamentoListagemModel item = _controller.items[index];
                      return Card(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white10, width: 1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: ListTile(
                          title: Text("${item.nomeCliente}"),
                          subtitle: Text(
                              "${item.data.formatar(DateFormat.YEAR_MONTH_DAY)}"),
                          onTap: () {
                            if (item.marcado)
                              Get.toNamed(NamesRoutes.agendamentoAtualizar,
                                  arguments: item.id);
                            else
                              Get.defaultDialog(
                                title: "Agendamento",
                                content: Container(
                                  child: Text("Deseja agendar data."),
                                ),
                                cancel: FlatButton(
                                  child: Text("Não"),
                                  onPressed: () => Get.back(),
                                ),
                                confirm: FlatButton(
                                  child: Text("Sim"),
                                  onPressed: () {
                                    _controller.cadastro(item);
                                    Get.back();
                                  },
                                ),
                              );
                          },
                          leading: Icon(
                            Icons.calendar_today,
                            size: 35,
                            color: item.marcado ? Colors.red : Colors.black87,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
    );
  }
}
