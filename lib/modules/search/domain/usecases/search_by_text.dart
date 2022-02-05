//* Quinto princípio de SOLID, devemos sempre usar inversão de dependência,
//* Sempre depender de uma interface e não de uma implementação
import 'package:clean_architeture/modules/search/domain/entities/result_search.dart';
import 'package:clean_architeture/modules/search/domain/errors/errors.dart';
import 'package:clean_architeture/modules/search/domain/repositories/search_repository.dart';
import 'package:dartz/dartz.dart';

// Either, classe que força um tratamento de erros, ele obriga a retornar dois
// valores, o primeiro é retornar uma falha (Exception) e o segundo é o valor
// esperado.
//*Contrato
abstract class SearchByText {
  Future<Either<FailureSearch, List<ResultSearch>>> call(String? searchText);
}

class SearchByTextImpl implements SearchByText {
  final SearchRepository repository;

  SearchByTextImpl(this.repository);

  @override
  Future<Either<FailureSearch, List<ResultSearch>>> call(
    String? searchText,
  ) async {
    if (searchText == null) {
      return Left(InvalidTextError());
    }

    return repository.search(searchText);
  }
}
