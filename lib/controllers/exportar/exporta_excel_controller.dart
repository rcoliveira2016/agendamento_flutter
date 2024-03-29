import 'dart:io';

import 'package:agendamentos/models/exportar/excel/todos_dados_model.dart';
import 'package:agendamentos/shared/Models/notificacao_model.dart';
import 'package:agendamentos/shared/infra/data/dataBase/data_base_provider.dart';
import 'package:csv/csv.dart';
import 'package:agendamentos/repositories/exportar/excel/exporta_excel_repository.dart';
import 'package:agendamentos/shared/infra/Inject/Injection.dart';
import 'package:ext_storage/ext_storage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:agendamentos/shared/extension/date_time_extension.dart';

class ExprotarExcelController {
  final ExportarExcelRepository _exportarExcelRepository = Injection.injector.get();
  final DataBaseProvider _dataBaseProvider = Injection.injector.get();

  Future<NotificacaoModel> exportarTodosDadosExcel() async {
    var permissao = await Permission.storage.request();
    if(permissao==PermissionStatus.granted){

      var listaTodos = await _exportarExcelRepository.buscarTodos();
      var listaCSV = _obterListaCSV(listaTodos);

      var pastaDestino = await _getPathToDownload();

      var caminhoDoArquivo = "$pastaDestino/dados_agendamento-${DateTime.now().formatar("y-M-d-H-m-s")}.xslx";
      
      var rowsAsListOfValues = const ListToCsvConverter().convert(listaCSV);

      var criarArquivo = await new File(caminhoDoArquivo).create(recursive: true);
      var novoArquivo = await (criarArquivo.writeAsString(rowsAsListOfValues));
      if(await novoArquivo.exists())
        return NotificacaoModel.sucesso("Arquivo gerado com sucesso");
      

      return NotificacaoModel.erro("Falha na geração");
    }
    return NotificacaoModel.erro("Não foi concedido");
  }

  Future<NotificacaoModel> exportarBaseDados() async {
    var permissao = await Permission.storage.request();
    if(permissao==PermissionStatus.granted){

      var arquivoArquivoSQLite = await _dataBaseProvider.obterArquivoSQLite();

      var pastaDestino = await _getPathToDownload();

      var caminhoDoArquivo = "$pastaDestino/base_dados_agendamento-${DateTime.now().formatar("y-M-d-H-m-s")}.db";

      var novoArquivo = await new File(arquivoArquivoSQLite).copy(caminhoDoArquivo);

      if(await novoArquivo.exists())
        return NotificacaoModel.sucesso("Arquivo gerado com sucesso");
      

      return NotificacaoModel.erro("Falha na geração");
    }
    return NotificacaoModel.erro("Não foi concedido permissão");
  }
  
  Future<String> _getPathToDownload() async {
    var pasta = await ExtStorage.getExternalStoragePublicDirectory(
        ExtStorage.DIRECTORY_DOWNLOADS);
    return pasta;
  }

  List<List<dynamic>> _obterListaCSV(List<TodosDadosModel> listaTodos) {
    var retorno = new List<List<dynamic>>();
    var cabecalho = new List<dynamic>();

    cabecalho.add("Nome Cliente");
    cabecalho.add("Quantidade cavalo cliente");
    cabecalho.add("Frequência em dias");
    cabecalho.add("Local Padrão");
    cabecalho.add("Valor da dívida do cliente");

    cabecalho.add("Data do agendamento");
    cabecalho.add("Quantidade de cavados do agendamento");
    cabecalho.add("Valor cobrado");
    cabecalho.add("Observações do agendamento");
    retorno.add(cabecalho);

    for (var item in listaTodos) {
      var novoItem = new List<dynamic>();

      novoItem.add(item.nome);
      novoItem.add(item.quantidadeCavalos);
      novoItem.add(item.frequencia);
      novoItem.add(item.localPadrao);
      novoItem.add(item.valorDivida);

      novoItem.add(item.data);
      novoItem.add(item.quantidade);
      novoItem.add(item.valor);
      novoItem.add(item.observacao);

      retorno.add(novoItem);
    }
    return retorno;
  }
}