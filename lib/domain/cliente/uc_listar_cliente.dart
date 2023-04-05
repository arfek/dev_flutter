import 'package:dev_flutter/domain/cliente/cliente.dart';
import 'package:dev_flutter/domain/cliente/repo_cliente.dart';

class UcListarClientes{

  final IClienteRepo _repo;
  final String _filtroPesquisa;

  UcListarClientes(this._repo, this._filtroPesquisa);

  Future<List<Cliente>> run() async{
    return await _repo.list(_filtroPesquisa);
  }

}