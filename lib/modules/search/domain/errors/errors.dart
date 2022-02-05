// Para vários domínios não podemos depender de muitas coisas externas, então
// implementamos erros baseados no próprio domínio
abstract class FailureSearch implements Exception {}

class InvalidTextError implements FailureSearch {}

class DatasourceError implements FailureSearch {
  final String? message;

  DatasourceError({this.message});
}
