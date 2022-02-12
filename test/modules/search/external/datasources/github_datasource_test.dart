import 'dart:convert';

import 'package:clean_architeture/modules/search/domain/errors/errors.dart';
import 'package:clean_architeture/modules/search/external/datasource/github_datasource.dart';
import 'package:clean_architeture/modules/search/infra/models/result_search_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/github_response.dart';

class DioMock extends Mock implements Dio {}

void main() {
  final dio = DioMock();
  final datasource = GithubDatasource(dio);

  test("deve retornar uma lista de ResultSearchModel", () async {
    //? Por quê o teste só dá certo se o parâmetro da linha 20 for o mesmo da
    //? linha 25?
    when(() => dio.get('')).thenAnswer((_) async => Response(
        requestOptions: RequestOptions(path: 'teste'),
        data: jsonDecode(githubResponse),
        statusCode: 200));

    final result = await datasource.getSearch('');
    expect(result, isA<List<ResultSearchModel>>());
  });

  test("deve retornar uma excessão se o código for diferente de 200", () async {
    when(() => dio.get('https://api.github.com/search/users?q=')).thenAnswer((_) async => Response(
        requestOptions: RequestOptions(path: ''), data: null, statusCode: 401));

    expect(() async => await datasource.getSearch(''), throwsA(isA<DatasourceError>()));
  });

  test("deve retornar uma excessão se houver um erro no dio", () async {
    when(() => dio.get('https://api.github.com/search/users?q=')).thenThrow(Exception());

    expect(() async => await datasource.getSearch(''), throwsA(isA<Exception>()));
  });
}
