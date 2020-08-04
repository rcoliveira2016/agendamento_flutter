import 'package:agendamentos/models/agendamentos/agendamento_model.dart';
import 'package:agendamentos/shared/infra/data/repository/repository_dase.dart';

class AgendamentoRepository extends RepositoryBase<Agendamento>{

  AgendamentoRepository():super(nameTable:"agendamento");  

  @override
  Agendamento map(Map<String, dynamic> json) => Agendamento.fromJson(json);

  Future<List<Agendamento>> buscarPorIdCliente(int idCliente,{int inicio=0, int contidade = 10}){
    return getAll('''
      select 
        *
      from
        $nameTable
      where idCliente = ?
      order by dataNumero desc
      LIMIT ? OFFSET ?
    ''',[idCliente, contidade, inicio]);
  }

}