import 'package:agendamentos/shared/infra/Inject/Injection.dart';
import 'package:agendamentos/shared/infra/data/dataBase/data_base_provider.dart';

abstract class RepositoryReadBase<TEntidade>  {
  String nameTable;
  DataBaseProvider _dataBaseProvider = Injection.injector.get();
  
  RepositoryReadBase({this.nameTable});

  TEntidade map(Map<String, dynamic> json);

  Future<List<TEntidade>> all(TEntidade entidade) async {
    return getAll("Select * from $nameTable");
  }
  
  Future<List<TEntidade>> getAll(String sql, [List<dynamic> arguments]) async {
    List<Map> list = await _dataBaseProvider.db.rawQuery(sql, arguments);
    var result = List<TEntidade>();
    list.forEach((x)=> result.add(map(x)));
    return result.toList();
  }

  Future<List<Map>> getRaw(String sql, [List<dynamic> arguments]) async {
    return await _dataBaseProvider.db.rawQuery(sql, arguments);
  }
}