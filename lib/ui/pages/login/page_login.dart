import 'package:dev_flutter/ui/pages/login/ctrl_login.dart';
import 'package:dev_flutter/ui/pages/login/exts_ctrl_on_click.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/botao.dart';
import '../widgets/campo_texto.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  late LoginController controller;

  @override
  void initState(){
      controller = LoginController();
      controller.init();

      super.initState();
  }


  Widget build(BuildContext context) {
      return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(40),
              child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                const Padding(
                    padding: EdgeInsets.all(20),
                    child: FlutterLogo(size: 150),
                ),

                Text('E-mail', style: TextStyle(color: Colors.black)),
                CampoTexto(controller: controller.edtEmail),
                const SizedBox(height: 40,),
                Text('Senha', style: TextStyle(color: Colors.black)),
                CampoTexto(controller: controller.edtPassword,),
                const SizedBox(height: 40,),
                Botao(titulo: 'Autenticar', onClick: () async{
                  await controller.onClickAuth();
                })
              ],
              ),
            ),
          ),
        ),
      );

  }
}
