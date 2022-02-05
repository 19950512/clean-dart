import 'package:clean_architeture/modules/search/domain/entities/result_search.dart';
import 'package:clean_architeture/modules/search/domain/repositories/search_repository.dart';
import 'package:clean_architeture/modules/search/domain/usecases/search_by_text.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class SearchRepositoryMock extends Mock implements SearchRepository {}

void main() {
  final repository = SearchRepositoryMock();

  final usecase = SearchByTextImpl(repository);

  test('Deve retornar uma lista de ResultSeach', () async {
    when(() => repository.search(''))
        .thenAnswer((_) async => const Right(<ResultSearch>[]));

    final result = await usecase("carlos");

    // Expera que o resultado seja o direito do Either
    // expect(result, isA<Right>());

    expect(result, isA<List<ResultSearch>>());
  });
}
