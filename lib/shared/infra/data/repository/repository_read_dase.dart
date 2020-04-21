import 'package:agendamentos/shared/Models/entidade.dart';
import 'package:agendamentos/shared/infra/Inject/Injection.dart';
import 'package:agendamentos/shared/infra/data/dataBase/data_base_provider.dart';

abstract class RepositoryReadBase<TEntidade extends Entidade>  {
  String nameTable;
  DataBaseProvider _dataBaseProvider = Injection.injector.get();
  
  RepositoryReadBase({this.nameTable});

  TEntidade map(Map<String, dynamic> json);
  
  Future<TEntidade> getId(int id) async {
    var results = await getAll("Select * from $nameTable where id = ?", [id]);
    return results.first;
  }

  Future<List<TEntidade>> all(TEntidade entidade) async {
    return getAll("Select * from $nameTable");
  }
  
  Future<List<TEntidade>> getAll(String sql, [List<dynamic> arguments]) async {
    List<Map> list = await _dataBaseProvider.db.rawQuery(sql, arguments);
    var result = List<TEntidade>();
    list.forEach((x)=> result.add(map(x)));
    return result.toList();
  }
}