import 'package:agendamentos/controllers/exportar/exporta_excel_controller.dart';
import 'package:agendamentos/shared/constants/name_routes.dart';
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
          Divider(
            height: 3,
            color: Colors.black26,
          ),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text('Agendamento'),
            onTap: () {
              Get.toNamed(NamesRoutes.agendamento);
            },
          ),
          Divider(
            height: 3,
            color: Colors.black26,
          ),
          ListTile(
            leading: Icon(Icons.screen_share),
            title: Text('Exportar para Excel'),
            onTap: () async {
              Get.snackbar("Exportando", "Arquivo está sendo exportado",backgroundColor: Colors.deepOrange,);
              var exportar = Injection.injector.get<ExprotarExcelController>();
              await exportar.exportarTodosDadosExcel();              
              Get.snackbar("Sucesso", "Arquivo gerado com sucesso",backgroundColor: Colors.green,);
            },
          ),
        ],
      ),
    );
  }
}
