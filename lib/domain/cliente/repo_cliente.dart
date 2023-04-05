import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'cliente.dart';

abstract class IClienteRepo {

  Future<List<Cliente>> list(String _filtroPesquisa);

}

class ClienteRepoAPI implements IClienteRepo{
  @override

  Future<List<Cliente>> list( String filtroPesquisa){
    throw UnimplementedError();
  }
}


class ClienteRepoInMemory implements IClienteRepo{
  @override

  Future<List<Cliente>> list( String filtroPesquisa) async{
      String strClientes = await rootBundle.loadString('assets/in_memory/client.json');

      var list =  Cliente.fromJson(strClientes);

      return list.where((element) => element.nomeRazao.isCaseInsensitiveContains(filtroPesquisa)).toList();
  }
}








