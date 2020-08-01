
import 'dart:io';

import 'package:agendamentos/shared/infra/data/dataBase/scritps.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseProvider {
  static final DataBaseProvider _instance = new DataBaseProvider.internal();

  factory DataBaseProvider() => _instance;
  static Database _db;

  DataBaseProvider.internal();

  initDb() async {
    var path = await obterArquivoSQLite();
    _db = await openDatabase(
      path,
      version: Scripts.migrationScripts.length+1,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future reloadDb(pathArquivoImportado) async {
    var arquivoArquivoSQLite = await obterArquivoSQLite();
    var fileArquivoSQLite = new File(arquivoArquivoSQLite);
    await fileArquivoSQLite.writeAsBytes([]);
    await fileArquivoSQLite.writeAsBytes(await new File(pathArquivoImportado).readAsBytes());

    var path = await obterArquivoSQLite();
    _db = await openDatabase(
      path,
      readOnly: true,
      version: Scripts.migrationScripts.length+1,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Database get db {
    return _db;
  }

  void _onCreate(Database db, int version) async {
    Scripts.initializationScript
        .forEach((script) async => await db.execute(script));
    Scripts.migrationScripts
        .forEach((script) async => await db.execute(script));
  }

  Future<String> obterArquivoSQLite() async {
    var documentsDirectory = await getApplicationDocumentsDirectory();
    return join(documentsDirectory.path, "1-agendamento.db");
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    for (var i = oldVersion - 1; i <= newVersion - 1; i++) {
      if(i<Scripts.migrationScripts.length)
        await db.execute(Scripts.migrationScripts[i]);
    }
  }
}
