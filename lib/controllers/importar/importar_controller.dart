import 'package:agendamentos/shared/Models/notificacao_model.dart';
import 'package:agendamentos/shared/helper/get_helper.dart';
import 'package:agendamentos/shared/infra/data/dataBase/data_base_provider.dart';
import 'package:agendamentos/shared/infra/Inject/Injection.dart';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ImportarController {
  final DataBaseProvider _dataBaseProvider = Injection.injector.get();
  
  Future<NotificacaoModel> importarDataBase() async {
    final path = await FilePicker.getFile(
      type: FileType.custom,
      allowedExtensions: ['db']
    );

     var permissao = await Permission.storage.request();
    if(permissao==PermissionStatus.granted){
      GetHelper.dialogoPadrao(mesagem: "Deseja continuar a importação", onConfirmacao: () async{
        await _dataBaseProvider.reloadDb(path.path);
        return NotificacaoModel.sucesso("Base importa com sucesso");
      });    
    }
    return NotificacaoModel.erro("Não foi concedido permissão");
  }

}