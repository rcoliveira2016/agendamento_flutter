import 'package:agendamentos/models/clientes/cliente_model.dart';
import 'package:agendamentos/repositories/clientes/cliente_repository.dart';
import 'package:agendamentos/shared/infra/Inject/Injection.dart';
import 'package:mobx/mobx.dart';
part 'cliente_cadastro_controller.g.dart';

class ClienteCadastroController = _ClienteCadastroController with _$ClienteCadastroController;

abstract class _ClienteCadastroController with Store {
    final ClienteRepository _clienteRepository = Injection.injector.get();
    @observable
    Cliente clienteAtual;

    @action
    buscarCliente(int id) async {
      clienteAtual = (id!=null && id > 0)?        
        await _clienteRepository.getId(id):
        Cliente();
    }

    String validarTexto(String texto){
      if (texto == null || texto.isEmpty)
        return "Informe o valor";
      else
        return null;
    }

    String validarNumero(int valor){
      if (valor == null || valor < 0)
        return "Informe uma valor";
      else
        return null;
    }

    Future salvar() async {
      if(clienteAtual.isNew)
        await _clienteRepository.add(clienteAtual);
      else
        await _clienteRepository.updade(clienteAtual.id, clienteAtual);
    }
}