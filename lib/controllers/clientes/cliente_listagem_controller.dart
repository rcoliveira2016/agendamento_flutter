import 'package:agendamentos/models/clientes/cliente_model.dart';
import 'package:agendamentos/repositories/clientes/cliente_repository.dart';
import 'package:agendamentos/shared/infra/Inject/Injection.dart';

class ClienteListagemController {
  final ClienteRepository _clienteRepository = Injection.injector.get();

  Future<List<Cliente>> buscarTodos() {    
    return _clienteRepository.all();
  }
}