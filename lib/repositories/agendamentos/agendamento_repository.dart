import 'package:agendamentos/models/agendamentos/agendamento_model.dart';
import 'package:agendamentos/shared/constants/constants.dart';
import 'package:agendamentos/shared/infra/data/repository/repository_dase.dart';

class AgendamentoRepository extends RepositoryBase<Agendamento>{

  AgendamentoRepository():super(nameTable:"agendamento");  

  @override
  Agendamento map(Map<String, dynamic> json) => Agendamento.fromJson(json);

}