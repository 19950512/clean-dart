import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_module.dart';

class AppSplashPage extends StatefulWidget {
  const AppSplashPage({Key? key}) : super(key: key);

  @override
  State<AppSplashPage> createState() => _AppSplashPageState();
}

class _AppSplashPageState extends State<AppSplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((_) async {
      await Modular.isModuleReady<AppModule>();
      Modular.to.navigate('/home/');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
