import 'package:dev_flutter/domain/cliente/repo_cliente.dart';
import 'package:dev_flutter/domain/login/repo_login.dart';
import 'package:dev_flutter/infra/dependency.dart';

enum RepType{
  inMemory,
  API;
}

Future initRepository() async {
  RepType repo = RepType.inMemory;

  switch(repo) {
    case RepType.inMemory:
      registerDependencyInMemory();
      break;
    case RepType.API:
      registerDependencyApi();
      break;
  }
}

void registerDependencyApi(){
  Dependency.addOrReplace<ILoginRepo>(LoginRepoAPI());
  Dependency.addOrReplace<IClienteRepo>(ClienteRepoAPI());
}

void registerDependencyInMemory(){
  Dependency.addOrReplace<ILoginRepo>(LoginRepoInMemory());
  Dependency.addOrReplace<IClienteRepo>(ClienteRepoInMemory());
}