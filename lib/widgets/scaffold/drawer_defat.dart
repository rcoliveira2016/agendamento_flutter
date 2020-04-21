import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerDefalt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration:  BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.assignment_ind),
            title: Text('Clientes'),
            onTap: (){
              Get.toNamed('/cliente');
            },
          ),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text('Agendamento'),
            onTap: (){
              Get.toNamed('/agendamento');
            },
          ),
        ],
      ),
    );
  }
}