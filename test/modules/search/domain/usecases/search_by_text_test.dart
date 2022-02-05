import 'package:clean_architeture/modules/search/domain/entities/result_search.dart';
import 'package:clean_architeture/modules/search/domain/errors/errors.dart';
import 'package:clean_architeture/modules/search/domain/repositories/search_repository.dart';
import 'package:clean_architeture/modules/search/domain/usecases/search_by_text.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class SearchRepositoryMock extends Mock implements SearchRepository {}

void main() {
  final repository = SearchRepositoryMock();

  final usecase = SearchByTextImpl(repository);

  group('Testes de requisição a API de busca por texto: ', () {
    test('Deve retornar uma lista de ResultSeach', () async {
      //? Por quê na linha 20 o teste só dá certo se o parâmetro for o mesmo da
      //? linha 23?
      when(() => repository.search('Carlos')).thenAnswer((_) async =>
          const Right<FailureSearch, List<ResultSearch>>(<ResultSearch>[]));

      final result = await usecase('Carlos');

      // Expera que o resultado seja o direito do Either
      expect(result, isA<Right>());

      expect(result, isA<Right<FailureSearch, List<ResultSearch>>>());
    });

    test('Deve retornar uma exception caso o texto seja invalido', () async {
      when(() => repository.search('')).thenAnswer((_) async =>
          const Right<FailureSearch, List<ResultSearch>>(<ResultSearch>[]));

      final result = await usecase(null);

      // Expera que o resultado seja o direito do Either
      // expect(result, isA<Right>());
      expect(result.isLeft(), true);

      // .fold significa, se left e se Right, retornando o esperado
      // expect(result.fold((left) => left, (right) => right), isA<InvalidTextError>());
      expect(result.fold(id, id), isA<InvalidTextError>());
    });

    test('Deve retornar uma exception caso o texto seja uma string vazia',
        () async {
      when(() => repository.search('')).thenAnswer((_) async =>
          const Right<FailureSearch, List<ResultSearch>>(<ResultSearch>[]));

      final result = await usecase('');

      // Expera que o resultado seja o direito do Either
      // expect(result, isA<Right>());
      expect(result.isLeft(), true);

      // .fold significa, se left e se Right, retornando o esperado
      // expect(result.fold((left) => left, (right) => right), isA<InvalidTextError>());
      expect(result.fold(id, id), isA<InvalidTextError>());
    });
  });
}
