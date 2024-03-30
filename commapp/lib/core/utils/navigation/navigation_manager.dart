import 'package:commapp/ui/view/base_view.dart';
import 'package:commapp/ui/view/home_view.dart';
import 'package:commapp/ui/view/login_view.dart';
import 'package:commapp/ui/view/splash_view.dart';
import 'package:commapp/ui/view/success_view.dart';
import 'package:flutter/cupertino.dart';

class NavigationManager {
  static final routes = <String, Widget Function(BuildContext)>{
    SplashView.id: (context) => const SplashView(),
    LoginView.id: (context) => const LoginView(),
    BaseView.id: (context) => const BaseView(),
    SuccessView.id: (context) => const SuccessView(),
  };
}
