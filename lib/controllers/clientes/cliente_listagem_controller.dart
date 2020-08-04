import 'package:agendamentos/models/clientes/cliente_model.dart';
import 'package:agendamentos/repositories/agendamentos/agendamento_repository.dart';
import 'package:agendamentos/repositories/clientes/cliente_repository.dart';
import 'package:agendamentos/shared/Models/notificacao_model.dart';
import 'package:agendamentos/shared/infra/Inject/Injection.dart';

class ClienteListagemController {
  final ClienteRepository _clienteRepository = Injection.injector.get();
  final AgendamentoRepository _agendamentoRepository = Injection.injector.get();

  String filtro="";

  Future<List<Cliente>> buscarTodos() {    
    return _clienteRepository.all();
  }

  Future<List<Cliente>> buscarTodosClientes() {    
    return _clienteRepository.buscarClientes(filtro);
  }

  Future<NotificacaoModel> deletar(int id) async {    
    await _clienteRepository.delete(id);
    await _agendamentoRepository.deletePorCliente(id);
  }

}