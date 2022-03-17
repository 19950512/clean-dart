import 'package:clean_architeture/modules/errors/404_page.dart';
import 'package:clean_architeture/modules/search/domain/usecases/search_by_text.dart';
import 'package:clean_architeture/modules/search/external/datasource/github_datasource.dart';
import 'package:clean_architeture/modules/search/infra/repositories/search_repository_impl.dart';
import 'package:clean_architeture/modules/search/presenter/search/search_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_splash_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((injector) => SearchByTextImpl(injector())),
        Bind((injector) => SearchRepositoryImpl(injector())),
        Bind((injector) => GithubDatasource(injector())),
        Bind((injector) => Dio()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const AppSplashPage()),
        ChildRoute('/home/', child: (context, args) => const SearchPage()),
        WildcardRoute(child: (_, __) => const Erro404Page())
      ];
}
