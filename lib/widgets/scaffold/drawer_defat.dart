import 'package:agendamentos/shared/constants/name_routes.dart';
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
            decoration:  BoxDecoration(
              color: new Color.fromRGBO(219, 75, 74, 1.0),
            ),
            child: Column(
              mainAxisAlignment:  MainAxisAlignment.start,
              crossAxisAlignment:  CrossAxisAlignment.start,
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
            onTap: (){
              Get.toNamed(NamesRoutes.cliente);
            },
          ),
          Divider(height: 3,color: Colors.black26,),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text('Agendamento'),
            onTap: (){
              Get.toNamed(NamesRoutes.agendamento);
            },
          ),
        ],
      ),
    );
  }
}