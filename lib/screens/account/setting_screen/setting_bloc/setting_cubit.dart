import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../../../localization/localization_constants.dart';
import '../../../../main.dart';
import '../../../../models/language.dart';
import '../../../../sharedPreferences.dart';
import '../../../home/my_home_screen.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(SettingInitial());
  static SettingCubit get(context)=>BlocProvider.of(context);

  void changeLanguage(Language language,context) async {
    Locale _locale = await setLocale(language.languageCode);
    MyApp.setLocale(context, _locale);
    MySharedPreferences.saveAppLang(_locale.toString());
    emit(ChangeLanguageAccountState());
    var email=await MySharedPreferences().getUserUserEmail();
    pushNewScreen(
      context,
      screen: MyHomeScreen(0),
      withNavBar: false, // OPTIONAL VALUE. True by default.
      pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );
  }
}
