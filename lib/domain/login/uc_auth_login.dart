import 'package:dev_flutter/domain/login/repo_login.dart';

class UcAuthLogin{
  final ILoginRepo _repo;
  final String _email;
  final String _password;

  UcAuthLogin(this._repo, this._email, this._password);

  Future<bool> run() async {
    return await _repo.auth(_email, _password);
  }
}