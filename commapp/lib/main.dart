import 'package:commapp/bloc/cart/cart_bloc.dart';
import 'package:commapp/core/constants/app_constants.dart';
import 'package:commapp/core/constants/assets.dart';
import 'package:commapp/core/utils/theme/cubit/shop_cubit.dart';
import 'package:commapp/services/shop_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:commapp/core/utils/lang/language_manager.dart';
import 'package:commapp/core/utils/navigation/navigation_manager.dart';
import 'package:commapp/core/utils/theme/cubit/theme_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: LanguageManager.supportedLocales,
      path: Asset.translationsPath,
      fallbackLocale: LanguageManager.enLocale,
      child: BlocProvider(
        create: (context) => ThemeCubit(),
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => CartBloc()..add(CartInitialized()),
                ),
                BlocProvider(
                  create: (context) => ShopCubit(ShopService()),
                ),
              ],
              child: MyApp(
                state: state,
              ),
            );
          },
        ),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    this.state,
  }) : super(key: key);
  final ThemeState? state;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: ApplicationConstants.applicationName,
      theme: state!.currentTheme,
      routes: NavigationManager.routes,
    );
  }
}
