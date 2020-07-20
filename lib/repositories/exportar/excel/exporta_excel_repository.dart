
import 'package:agendamentos/models/exportar/excel/todos_dados_model.dart';
import 'package:agendamentos/shared/infra/data/repository/repository_dase.dart';
import 'package:agendamentos/shared/infra/data/repository/repository_read_dase.dart';

class ExportarExcelRepository extends RepositoryReadBase<TodosDadosModel>{
   @override
  TodosDadosModel map(Map<String, dynamic> json) =>
      TodosDadosModel.fromJson(json);

  Future<List<TodosDadosModel>> buscarTodos() async {  
    return getAll('''
      Select 
        agendamento.*,
        cliente.*
      from agendamento, cliente      
      where cliente.id = idCliente
    ''');
  }
}