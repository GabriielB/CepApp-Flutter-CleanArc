import 'package:cep_app/shared/data/async/either.dart';
import 'package:cep_app/shared/data/local/local_service/local_service.dart';

import 'package:cep_app/shared/ui/theme/erros/theme_local_exception.dart';

abstract interface class GetThemeLocalDatasource {
  Future<Either<ThemeLocalException, bool>> getIsLightTheme();
}

const GET_IS_LIGHT_THEME_KEY = 'GET_IS_LIGHT_THEME_KEY';

final class GetThemeLocalDatasourceImpl implements GetThemeLocalDatasource {
  final LocalService _localService;

  GetThemeLocalDatasourceImpl(this._localService);

  @override
  Future<Either<ThemeLocalException, bool>> getIsLightTheme() async {
    final isLightTheme = await _localService.get<bool>(GET_IS_LIGHT_THEME_KEY);
    switch (isLightTheme) {
      case Left():
        return Left(ThemeLocalException(message: 'Erro ao trocar tema'));
      case Right(value: final r):
        return Right(r ?? true);
    }
  }
}
