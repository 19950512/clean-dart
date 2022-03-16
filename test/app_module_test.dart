import 'package:clean_architeture/app_module.dart';
import 'package:clean_architeture/modules/search/domain/usecases/search_by_text.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:modular_test/modular_test.dart';

class ModularNavigateMock extends Mock implements IModularNavigator {}

void main() {
  initModule(AppModule());

  test('Deve recuperar o usecase sem erro', () {
    final usecase = Modular.get<SearchByText>();
    expect(usecase, isA<SearchByTextImpl>());
  });
}
