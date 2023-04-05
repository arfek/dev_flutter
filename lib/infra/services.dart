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
}

void registerDependencyInMemory(){
  Dependency.addOrReplace<ILoginRepo>(LoginRepoInMemory());
}