import 'package:agendamentos/models/agendamentos/agendamento_listagem_model.dart';
import 'package:agendamentos/shared/constants/constants.dart';
import 'package:agendamentos/shared/extension/date_time_extension.dart';
import 'package:agendamentos/shared/infra/data/repository/repository_read_dase.dart';

class AgendamentoListagemReadRepository
    extends RepositoryReadBase<AgendamentoListagemModel> {
  @override
  AgendamentoListagemModel map(Map<String, dynamic> json) =>
      AgendamentoListagemModel.fromJson(json);

  Future<DateTime> buscarProximoAgendamento(int idCliente) async {
      var result = await getAll('''
        select
          1 as marcado, 
          agendamento.id, 
          idCliente, 
          (max(dataNumero)+(cliente.frequencia*24*60*60*1000)) as dataNumero, 
          quantidade, 
          valor,
          '' as nomeCliente
        from 
          agendamento, cliente
        where 
          cliente.id = agendamento.idCliente
          and idCliente = ?
        order by dataNumero desc''',
        [idCliente]);
      return result.isNotEmpty? result.first.data: null;
    }

  Future<DateTime> buscarUltimoAgendamento(int idCliente) async {
      var result = await getAll('''
        select
          1 as marcado, 
          id, 
          idCliente, 
          dataNumero, 
          quantidade, 
          valor,
          '' as nomeCliente
        from 
          agendamento 
        where idCliente = ?
        order by dataNumero desc''',
        [idCliente]);
      return result.isNotEmpty? result.first.data: null;
    }

  Future<List<AgendamentoListagemModel>> buscarAgendamentoNaoAgendado(
      DateTime dataInicial, DateTime dataFinal) async {
    
    var dataInicioMilliSecondsS = dataInicial.startDay();
    var dataFimMilliSecondsS = dataFinal.endDay();
    
    var filtro = [
      dataInicioMilliSecondsS.millisecondsSinceEpoch,
      dataFimMilliSecondsS.millisecondsSinceEpoch,
      dataInicioMilliSecondsS.millisecondsSinceEpoch,
      dataFimMilliSecondsS.millisecondsSinceEpoch
    ];    
    return getAll('''
      Select 
        1 as marcado, 
        id, 
        idCliente, 
        dataNumero, 
        quantidade, 
        valor,
        COALESCE((Select cliente.nome from cliente where cliente.id = idCliente LIMIT 1), 'Usuario Excluido') as nomeCliente
      from agendamento
      where
        dataNumero BETWEEN ? and ?
      UNION
      Select
        0 as marcado,
        null as id,
        cliente.id as idCliente,
        (max(dataNumero)+(cliente.frequencia*24*60*60*1000)) as dataNumero,
        quantidadeCavalos as quantidade,
        quantidadeCavalos*${Constantes.valorCustoPadrao} as valor,
        cliente.nome as nomeCliente
      from 
        cliente, agendamento
      where 
        cliente.id = agendamento.idCliente
        and dataNumero = (select max(ag.dataNumero) from agendamento ag where ag.idCliente = cliente.id)
        and (dataNumero)+(cliente.frequencia*24*60*60*1000) BETWEEN ? and ?
      group by cliente.id, quantidadeCavalos, frequencia            
    ''', filtro);
  }
}
