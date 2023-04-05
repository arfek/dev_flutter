import '/../../domain/login/repo_login.dart';
import '/../../domain/login/uc_auth_login.dart';
import '/../../infra/dependency.dart';
import 'ctrl_login.dart';

extension OnClick on LoginController{
  Future onClickAuth() async{
    try{

      if(edtEmail.text.isEmpty){
        throw 'O campo email precisa ser preenchido';
      }

      if(edtPassword.text.isEmpty){
        throw 'O campo senha precisa ser preenchido';
      }

      bool authorized = await UcAuthLogin(Dependency.get<ILoginRepo>(), edtEmail.text , edtPassword.text).run();

      if(authorized){



      }else{
        throw "Esse email não está autorizado!";
      }

    }catch(e){
      print( e );
    }

  }
}