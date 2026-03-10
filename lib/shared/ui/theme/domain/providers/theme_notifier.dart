import 'package:cep_app/shared/data/async/either.dart';
import 'package:cep_app/shared/extensions/snack_bar_extension.dart';
import 'package:cep_app/shared/ui/theme/domain/providers/theme_state.dart';
import 'package:cep_app/shared/ui/theme/domain/repositories/theme_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeNotifier extends StateNotifier<ThemeState> {
  final ThemeRepository _themeRepository;
  ThemeNotifier(this._themeRepository)
    : super(const ThemeState(themeStateEnum: ThemeStateEnum.light));

  Future<String?> initThemeState() async {
    final isLightThemeEither = await _themeRepository.getIsLightTheme();
    String? errorMessage;
    switch (isLightThemeEither) {
      case Left():
        {
          errorMessage = isLightThemeEither.value.message;
        }
      case Right():
        {
          state = ThemeState(
            themeStateEnum: isLightThemeEither.value
                ? ThemeStateEnum.light
                : ThemeStateEnum.dark,
          );
        }
    }
    return errorMessage;
  }

  void toggleTheme() async {
    state = ThemeState(
      themeStateEnum: state.themeStateEnum == ThemeStateEnum.light
          ? ThemeStateEnum.dark
          : ThemeStateEnum.light,
    );
  }

  void changeTheme(BuildContext context) async {
    toggleTheme();
    final setIsLightThemeEither = await _themeRepository.setIsLightTheme(
      state.themeStateEnum == ThemeStateEnum.light,
    );

    switch (setIsLightThemeEither) {
      case Left():
        if (context.mounted) {
          context.showSnackBar(
            SnackBarType.error,
            setIsLightThemeEither.value.message,
          );
        }
      case Right():
        {}
    }
  }
}
