import 'package:agendamentos/controllers/exportar/exporta_excel_controller.dart';
import 'package:agendamentos/controllers/importar/importar_controller.dart';
import 'package:agendamentos/shared/constants/name_routes.dart';
import 'package:agendamentos/shared/helper/get_helper.dart';
import 'package:agendamentos/shared/infra/Inject/Injection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:agendamentos/shared/extension/date_time_extension.dart';
import 'package:intl/intl.dart';

class DrawerDefalt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: new Color.fromRGBO(219, 75, 74, 1.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Agendamentos',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Data: ${DateTime.now().formatar(DateFormat.YEAR_MONTH_DAY)}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.assignment_ind),
            title: Text('Clientes'),
            onTap: () {
              Get.toNamed(NamesRoutes.cliente);
            },
          ),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text('Agendamento'),
            onTap: () {
              Get.toNamed(NamesRoutes.agendamento);
            },
          ),
          ExpansionTile(
            title: new Text("Exportar"),
            leading: Icon(Icons.screen_share),
            children: <Widget>[
              ListTile(
                title: Text('Excel'),
                onTap: () async {
                  Get.snackbar("Exportando", "Arquivo está sendo exportado",backgroundColor: Colors.deepOrange,);
                  var exportar = Injection.injector.get<ExprotarExcelController>();
                  exportar.exportarTodosDadosExcel()
                    .then((x)=> GetHelper.snackbarRespostaAcao(x))
                    .catchError((x)=> GetHelper.snackbarErro(mesagem: x.toString()));
                },
              ),              
              ListTile(
                title: Text('Base de dados'),
                onTap: () async {
                  Get.snackbar("Exportando", "Arquivo está sendo exportado",backgroundColor: Colors.deepOrange,);
                  var exportar = Injection.injector.get<ExprotarExcelController>();
                  exportar.exportarBaseDados()
                    .then((x)=> GetHelper.snackbarRespostaAcao(x))
                    .catchError((x)=> GetHelper.snackbarErro(mesagem: x.toString()));
                },
              )
            ],
          ),
          ListTile(
            title: Text('Importa Base de dados'),
            leading: Icon(Icons.arrow_upward),
            onTap: () async {
              var importar = Injection.injector.get<ImportarController>();
              importar.importarDataBase()
                .then((x)=> GetHelper.snackbarRespostaAcao(x))
                .catchError((x)=> GetHelper.snackbarErro(mesagem: x.toString()));
            },
          ),
          ListTile(
            leading: Icon(Icons.assignment_turned_in),
            title: Text('Termos de Uso'),
            onTap: () {
              Get.toNamed(NamesRoutes.termoUso);
            },
          ),
        ],
      ),
    );
  }
}
