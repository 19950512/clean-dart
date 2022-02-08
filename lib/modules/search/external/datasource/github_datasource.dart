import 'package:clean_architeture/modules/search/infra/datasources/search_datasource.dart';
import 'package:clean_architeture/modules/search/infra/models/result_search_model.dart';

class GithubDatasource implements SearchDatasource {
  @override
  Future<List<ResultSearchModel>> getSearch(String searchText) {}
}
