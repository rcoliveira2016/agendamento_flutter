import 'package:agendamentos/shared/Models/entidade.dart';
import 'package:agendamentos/shared/infra/Inject/Injection.dart';
import 'package:agendamentos/shared/infra/data/dataBase/data_base_provider.dart';

abstract class RepositoryBase<TEntidade extends Entidade>  {
  String nameTable;
  DataBaseProvider _dataBaseProvider = Injection.injector.get();
  
  RepositoryBase({this.nameTable});

  TEntidade map(Map<String, dynamic> json);
  
  Future delete(int id) async{
    await _dataBaseProvider.db.delete(nameTable, where: "id = ?", whereArgs: [id]);
  }

  Future updade(int id, Entidade entidade) async{
    await _dataBaseProvider.db.update(nameTable, entidade.toJson(), where: "id = ?", whereArgs: [id]);
  }

  Future<TEntidade> getId(int id) async {
    var results = await getAll("Select * from $nameTable where id = ?", [id]);
    return results.first;
  }

  Future<int> add(TEntidade entidade) async {
    int id = await _dataBaseProvider.db.insert(nameTable, entidade.toMapWithoutId());    
    return id;
  }  

  Future<List<TEntidade>> all() async {
    return getAll("Select * from $nameTable");
  }
  
  Future<List<TEntidade>> getAll(String sql, [List<dynamic> arguments]) async {
    List<Map> list = await _dataBaseProvider.db.rawQuery(sql, arguments);
    var result = List<TEntidade>();
    list.forEach((x)=> result.add(map(x)));
    return result.toList();
  }
  
  
}