import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_acedamy/core/theme/theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit()
    : super(ThemeInitial(isDarkMode: false, locale: const Locale('en')));
  loadTheme() {}
}
