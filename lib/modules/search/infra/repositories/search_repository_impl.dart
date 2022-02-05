import 'package:clean_architeture/modules/search/domain/errors/errors.dart';
import 'package:clean_architeture/modules/search/domain/entities/result_search.dart';
import 'package:clean_architeture/modules/search/domain/repositories/search_repository.dart';
import 'package:clean_architeture/modules/search/infra/datasources/search_datasource.dart';
import 'package:dartz/dartz.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchDatasource datasource;

  SearchRepositoryImpl(this.datasource);

  @override
  Future<Either<FailureSearch, List<ResultSearch>>> search(
      String? searchText) async {
    // Por se tratar de uma requisição externa a aplicação, qualquer erro pode
    // acontecer, logo, encapsular a requisição em um try-catch
    try {
      final result = await datasource.getSearch(searchText!);

      return Right(result);

      // Caso seja um erro customizado onde sabemos que é um Datasource de fato
    } on DatasourceError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(DatasourceError());
    }
  }
}
