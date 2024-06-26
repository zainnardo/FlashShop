import 'package:commapp/ui/view/base_view.dart';
import 'package:commapp/ui/view/login_view.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  void navigateToLogin(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 5)).then(
        (value) => Navigator.of(context).pushReplacementNamed(LoginView.id));
  }
}