import 'package:clean_architeture/modules/search/domain/entities/result_search.dart';
import 'package:clean_architeture/modules/search/domain/errors/errors.dart';
import 'package:clean_architeture/modules/search/infra/datasources/search_datasource.dart';
import 'package:clean_architeture/modules/search/infra/models/result_search_model.dart';
import 'package:clean_architeture/modules/search/infra/repositories/search_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class SearchDatasourceMock extends Mock implements SearchDatasource {}

void main() {
  final datasource = SearchDatasourceMock();
  final repository = SearchRepositoryImpl(datasource);
  group('Testes de requisição a API: ', () {
    //? Por quê na linha 19 o teste só dá certo se o parâmetro for o mesmo da
    //? linha 22?
    test('Deve retornar uma lista de ResultSearch', () async {
      when(() => datasource.getSearch('Carlos'))
          .thenAnswer((_) async => <ResultSearchModel>[]);

      final result = await repository.search("Carlos");

      expect(result, isA<Right<FailureSearch, List<ResultSearch>>>());
    });

    test('Deve retornar um DatasourceError se o datasource falhar', () async {
      // Por se tratar de conexão externa, todo tipo de erro pode ser retornado,
      // portanto, tratar como Exception e validar depois se é um DatasourceError
      when(() => datasource.getSearch('Carlos')).thenThrow(Exception());

      final result = await repository.search("Carlos");

      expect(result.fold(id, id), isA<DatasourceError>());
    });
  });
}
