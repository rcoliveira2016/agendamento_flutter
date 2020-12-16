import 'package:agendamentos/models/clientes/cliente_model.dart';
import 'package:agendamentos/shared/infra/data/repository/repository_dase.dart';

class ClienteRepository extends RepositoryBase<Cliente>{
  
  ClienteRepository():super(nameTable:"cliente");

  @override
  Cliente map(Map<String, dynamic> json) => Cliente.fromJson(json);    

  Future<List<Cliente>> buscarClientes(String nome, int numeroItens){
    nome = "%$nome%";
    return getAll('''
      select 
        *
      from
        $nameTable
      where ? is null or nome like ?
      order by nome
      LIMIT ?
    ''',[nome, nome, numeroItens]);
  }

}