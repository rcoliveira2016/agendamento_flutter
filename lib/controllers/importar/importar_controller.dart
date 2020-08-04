import 'package:agendamentos/shared/infra/data/dataBase/data_base_provider.dart';
import 'package:agendamentos/shared/infra/Inject/Injection.dart';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ImportarController {
  final DataBaseProvider _dataBaseProvider = Injection.injector.get();
  
  Future<String> importarDataBase() async {
    final path = await FilePicker.getFile(
      type: FileType.custom,
      allowedExtensions: ['db']
    );// await DocumentsPicker.pickDocuments;

     var permissao = await Permission.storage.request();
    if(permissao==PermissionStatus.granted){
      await _dataBaseProvider.reloadDb(path.path);
      return "";
    }
    return null;
  }

}