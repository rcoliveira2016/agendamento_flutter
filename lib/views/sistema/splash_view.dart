import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:agendamentos/repositories/aplicativo/termo_uso_repository.dart';
import 'package:agendamentos/shared/constants/name_routes.dart';
import 'package:agendamentos/shared/infra/Inject/Injection.dart';
class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  static TermoUsoRepository _termoUsoRepository = Injection.injector.get();


  @override
  void initState() {
    super.initState();
    _termoUsoRepository.obterStatus().then((status){
      if(status!=StatusTermoUso.aceito)
        Get.offAllNamed(NamesRoutes.termoUso,arguments: status==StatusTermoUso.recusado);
      
      if(status == StatusTermoUso.aceito)
        Future.delayed(Duration(milliseconds: 300)).then((_){
          Get.offAllNamed(NamesRoutes.agendamento);
        });
    });    
  }

  @override
  Widget build(BuildContext context) {
    return Container(
            color: Colors.deepOrange,            
            child: Center(
              child: Container(
                width: 150,
                height: 150,
                child: Image.asset("icon.png"),
              ),
            )
        );
  }
}