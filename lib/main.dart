import 'package:dev_flutter/domain/login/repo_login.dart';
import 'package:dev_flutter/domain/login/uc_auth_login.dart';
import 'package:dev_flutter/infra/theme.dart';
import 'package:dev_flutter/ui/pages/login/page_login.dart';
import 'package:flutter/material.dart';

import 'infra/dependency.dart';

void main() {

  runApp(MaterialApp(
    title: 'Demo',
    theme: ThemeLight().obter(),
    darkTheme: ThemeDark().obter(),
    themeMode: ThemeMode.light,
    home: const LoginPage(),
  ));
}