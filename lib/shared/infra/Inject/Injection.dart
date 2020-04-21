import 'dart:async';

import 'package:agendamentos/controllers/clientes/cliente_cadastro_controller.dart';
import 'package:agendamentos/controllers/clientes/cliente_listagem_controller.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:agendamentos/repositories/agendamentos/agendamento_repository.dart';
import 'package:agendamentos/repositories/clientes/cliente_repository.dart';
import 'package:agendamentos/shared/infra/data/dataBase/data_base_provider.dart';

class Injection {
  static DataBaseProvider _databaseprovider = DataBaseProvider();
  static Injector injector;

  static Future initInjection() async {
    await _databaseprovider.initDb();
    injector = Injector.getInjector();
    
    initDBProvaider();
    initRepositories();
    controllerRepositories();
  }

  static void initDBProvaider() {
    injector.map<DataBaseProvider>((i) => _databaseprovider, isSingleton: true);
  }
   
  static void initRepositories() {
    injector.map<ClienteRepository>((i) => new ClienteRepository(), isSingleton: false);
    injector.map<AgendamentoRepository>((i) => new AgendamentoRepository(), isSingleton: false);
  }  

  static void controllerRepositories() {
    injector.map<ClienteListagemController>((i) => new ClienteListagemController(), isSingleton: false);
    injector.map<ClienteCadastroController>((i) => new ClienteCadastroController(), isSingleton: false);
  }

}