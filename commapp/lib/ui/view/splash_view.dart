import 'package:commapp/core/constants/assets.dart';
import 'package:commapp/core/utils/theme/cubit/splash_cubit.dart';
import 'package:commapp/ui/view/base_view.dart';
import 'package:commapp/ui/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);
  static const id = '/';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..navigateToLogin(context),
      child: BlocBuilder<SplashCubit, SplashState>(
        builder: (context, state) {
          return Scaffold(
            body: GestureDetector(
              onTap: () =>
                  Navigator.of(context).pushReplacementNamed(LoginView.id),
              child: Center(
                child: Lottie.asset(Asset.animSplash),
              ),
            ),
          );
        },
      ),
    );
  }
}