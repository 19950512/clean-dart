import 'package:clean_architeture/modules/search/domain/entities/result_search.dart';
import 'package:clean_architeture/modules/search/domain/errors/errors.dart';
import 'package:dartz/dartz.dart';

// Na entidade deve ter somente entities e usecases, onde não poderá ser
// implementado nada além deles, porém podemos ter o contrato, que permitirá
// o acesso a camadas externas
abstract class SearchRepository {
  Future<Either<FailureSearch, List<ResultSearch>>> search(String? searchText);
}
