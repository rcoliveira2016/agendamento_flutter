import 'package:agendamentos/controllers/agendamentos/agendamento_listagem_controller.dart';
import 'package:agendamentos/repositories/aplicativo/termo_uso_repository.dart';
import 'package:agendamentos/shared/constants/name_routes.dart';
import 'package:agendamentos/shared/infra/Inject/Injection.dart';
import 'package:agendamentos/views/Cliente/cliente_cadastro_view.dart';
import 'package:agendamentos/views/Cliente/cliente_listagem_view.dart';
import 'package:agendamentos/views/agendamentos/agendamento_cadastro_view.dart';
import 'package:agendamentos/views/agendamentos/agendamento_listagem_view.dart';
import 'package:agendamentos/views/sistema/termo_uso_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Router {



  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return GetRoute(
          page: AgendamentoListagemView(),
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

      case NamesRoutes.agendamento:
        return GetRoute(
          page: AgendamentoListagemView(),
          settings: settings,
        );
      case NamesRoutes.agendamentoCadastro:
        return GetRoute(
          page: AgendamentoCadastroView(),
          settings: settings,
        );
      case NamesRoutes.agendamentoAtualizar:
        return GetRoute(
          page: AgendamentoCadastroView(id:settings.arguments),
          settings: settings,
        );
      case NamesRoutes.agendamentoCadastrarCliente:
        return GetRoute(
          page: AgendamentoCadastroView(idCliente:settings.arguments),
          settings: settings,
        );
      case NamesRoutes.termoUso:
        return GetRoute(
          page: TermoUsoView(termoUsoNaoFoiAceito:settings.arguments??false),
          settings: settings,
          transition: null
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