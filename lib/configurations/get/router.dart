import 'package:agendamentos/shared/constants/name_routes.dart';
import 'package:agendamentos/views/Cliente/cliente_cadastro_view.dart';
import 'package:agendamentos/views/Cliente/cliente_listagem_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Router {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return GetRoute(
          page: ClienteListagemView(),
          settings: settings,
        );
      case NamesRoutes.cliente:
        return GetRoute(
          page: ClienteListagemView(),
          settings: settings,
        );
      case NamesRoutes.clienteCadastro:
        return GetRoute(
          page: ClienteCadastroView(),
          settings: settings,
        );
      case NamesRoutes.clienteAtualizar:
        return GetRoute(
          page: ClienteCadastroView(id:settings.arguments),
          settings: settings,
        );
      default:
        return GetRoute(
            settings: settings,
            transition: Transition.fade,
            page: Scaffold(
              body:
                  Center(child: Text('No route defined for ${settings.name}')),
            ));
    }
  }
}

class RouterMap {
  String name;
  Action action;

  RouterMap({this.name, this.action});
}