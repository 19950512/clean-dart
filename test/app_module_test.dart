import 'dart:convert';

import 'package:clean_architeture/app_module.dart';
import 'package:clean_architeture/modules/search/domain/entities/result_search.dart';
import 'package:clean_architeture/modules/search/domain/errors/errors.dart';
import 'package:clean_architeture/modules/search/domain/usecases/search_by_text.dart';
import 'package:dartz/dartz.dart' as dartz;
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:modular_test/modular_test.dart';

import 'modules/search/utils/github_response.dart';

class DioMock extends Mock implements Dio {}

void main() {
  final dio = DioMock();
  initModule(AppModule(), replaceBinds: [
    Bind<Dio>((i) => dio),
  ]);

  test('Deve recuperar o usecase sem erro', () {
    final usecase = Modular.get<SearchByText>();
    expect(usecase, isA<SearchByTextImpl>());
  });

  test('Deve trazer uma lista de ResultSearch', () async {
    when(() => dio.get('')).thenAnswer((_) async => Response(
        requestOptions: RequestOptions(path: ''),
        data: jsonDecode(githubResponse),
        statusCode: 200));

    final usecase = Modular.get<SearchByText>();

    final result = await usecase('Carlos');

    expect(result, isA<dartz.Right>());
    expect(result, isA<dartz.Right<FailureSearch, List<ResultSearch>>>());
  });
}
