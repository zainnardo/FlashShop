import 'package:commapp/core/constants/assets.dart';
import 'package:commapp/core/extensions/context_extensions.dart';
import 'package:commapp/core/extensions/string_case_extension.dart';
import 'package:commapp/core/utils/lang/locale_keys.dart';
import 'package:commapp/ui/components/buttons/primary_elevated_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SuccessView extends StatelessWidget {
  const SuccessView({Key? key}) : super(key: key);
  static const id = '/success';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          Asset.successImage,
          fit: BoxFit.fill,
        ),
        Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            SizedBox(
                height: 50,
                child: FittedBox(
                    child: Text(
                  LocaleKeys.success_title.tr().toTitleCase(),
                  style: context.textTheme.titleLarge!.copyWith(),
                ))),
            SizedBox(
              height: 50,
              width: context.width * (3 / 4),
              child: FittedBox(
                  child: Text(
                LocaleKeys.success_thanks,
                style: context.textTheme.bodyLarge!.copyWith(),
              ).tr()),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: context.paddingHighHorizontal,
              child: PrimaryElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                localizationKey: LocaleKeys.common_buttons_continue_shopping,
              ),
            )
          ],
        )
      ],
    ));
  }
}