import 'package:commapp/core/constants/assets.dart';
import 'package:commapp/ui/components/buttons/primary_elevated_button.dart';
import 'package:commapp/ui/view/base_view.dart';
import 'package:commapp/ui/view/home_view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});
  static const id = '/login';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _passwordVisible = true;

  final TextEditingController _usernameCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();

  final FocusNode _usernameFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final formKey = GlobalKey<FormState>();
  String _username = "";
  String _password = "";
  final bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const Image(
                    image: AssetImage(Asset.logoApp),
                    height: 100,
                  ),
                  TextFormField(
                    focusNode: _usernameFocus,
                    controller: _usernameCtrl,
                    onSaved: (val) => _username = val ?? '',
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        labelText: 'Username', hintText: 'Username'),
                  ),
                  TextFormField(
                    focusNode: _passwordFocus,
                    controller: _passwordCtrl,
                    onSaved: (val) => _password = val ?? '',
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: const InputDecoration(
                        labelText: 'Password', hintText: 'Password'),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: _isLoading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : ElevatedButton(
                              onPressed: () => Navigator.of(context)
                                  .pushReplacementNamed(BaseView.id),
                              child: const Text('LOGIN'))),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
