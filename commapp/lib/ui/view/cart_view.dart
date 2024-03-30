import 'package:commapp/bloc/cart/cart_bloc.dart';
import 'package:commapp/core/extensions/context_extensions.dart';
import 'package:commapp/core/extensions/string_case_extension.dart';
import 'package:commapp/core/utils/lang/locale_keys.dart';
import 'package:commapp/ui/components/buttons/primary_elevated_button.dart';
import 'package:commapp/ui/components/cards/cart_product_card.dart';
import 'package:commapp/ui/components/header_text.dart';
import 'package:commapp/ui/view/success_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.secondary,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  if (state is CartInitial) {
                    return const CircularProgressIndicator();
                  } else if (state is CartLoad) {
                    return state.cart.products.isNotEmpty
                        ? Column(
                            children: [
                              Expanded(
                                child: ListView(
                                  padding: EdgeInsets.zero,
                                  children: [
                                    _buildTitle(context),
                                    ...state.cart.products
                                        .map((product) => Padding(
                                              padding: context.paddingLow,
                                              child: CartProductCard(
                                                  product: product),
                                            ))
                                        .toList(),
                                  ],
                                ),
                              ),
                              _buildPromoButton(context),
                              _buildTotal(context),
                              _buildCheckOutButton(context)
                            ],
                          )
                        : Column(
                            children: [
                              _buildTitle(context),
                              _buildEmptyCart(context),
                            ],
                          );
                  }
                  return const Text('Error!');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _buildTitle(BuildContext context) {
    return const SizedBox(
        height: kToolbarHeight * 1.5,
        child: HeaderText(translationKey: LocaleKeys.cart_title));
  }

  Padding _buildPromoButton(BuildContext context) {
    return Padding(
      padding: context.paddingLowHorizontal,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30),
              topLeft: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            )),
          ),
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          backgroundColor: MaterialStateProperty.all(context.colors.primary),
          foregroundColor:
              MaterialStateProperty.all(context.colors.onBackground),
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    LocaleKeys.cart_promo.tr().toCapitalized(),
                    style: context.textTheme.bodyLarge!
                        .copyWith(color: context.colors.onSecondary),
                  ),
                )),
            const Spacer(),
            const Expanded(
              child: Icon(
                Icons.arrow_circle_right,
                size: 60,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildTotal(BuildContext context) {
    return Container(
      height: 50,
      padding: context.paddingLow,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            LocaleKeys.cart_total.tr().toTitleCase(),
            style: context.textTheme.titleLarge!.copyWith(
              color: context.colors.onBackground,
              fontWeight: FontWeight.normal,
            ),
          ),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state is CartInitial) {
                return const CircularProgressIndicator();
              } else if (state is CartLoad) {
                return Text(
                  '${state.totalPrice.toStringAsFixed(2)}\$',
                  style: context.textTheme.titleLarge!.copyWith(
                    color: context.colors.onBackground,
                  ),
                );
              }
              return const Text('Error!');
            },
          )
        ],
      ),
    );
  }

  Padding _buildCheckOutButton(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: PrimaryElevatedButton(
          onPressed: () => Navigator.of(context).pushNamed(SuccessView.id),
          localizationKey: LocaleKeys.common_buttons_check_out),
    );
  }

  Widget _buildEmptyCart(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            size: 100,
            color: context.colors.onPrimary,
          ),
          const SizedBox(height: 10),
          Text(
            LocaleKeys.cart_empty.tr().toTitleCase(),
            style: context.textTheme.headlineMedium!
                .copyWith(color: context.colors.onSecondary),
          )
        ],
      ),
    );
  }
}