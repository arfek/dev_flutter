import 'dart:convert';

import 'package:dev_flutter/infra/request_helper.dart';
import 'package:flutter/services.dart';

abstract class ILoginRepo{
  Future<bool> auth(String email, String password);
}

class LoginRepoAPI implements ILoginRepo{
  @override

  Future<bool> auth(String email, String password) async {
    var params = {'email': email, 'password': password};

    var response =
        await requestGET('ws/curso-flutter/autenticar', params: params);

    var jsonAuth = jsonDecode(response.body);

    return jsonAuth['Authorized'];
  }
}

class LoginRepoInMemory implements ILoginRepo{
  @override
  Future<bool> auth(String email, String password) async{
    String strAuth = await rootBundle.loadString('assets/in_memory/auth.json');

    Map<String, dynamic> jsonAuth = jsonDecode(strAuth);

    return jsonAuth['Authorized'];
  }
}










