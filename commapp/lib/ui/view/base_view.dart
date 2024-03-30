import 'package:commapp/core/utils/lang/locale_keys.dart';
import 'package:commapp/ui/view/cart_view.dart';
import 'package:commapp/ui/view/home_view.dart';
import 'package:commapp/ui/view/shop_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:commapp/core/extensions/string_case_extension.dart';

import 'package:flutter/material.dart';

class BaseView extends StatefulWidget {
  const BaseView({Key? key}) : super(key: key);
  static const id = '/home';
  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView>
    with AutomaticKeepAliveClientMixin {
  final List<Widget> _navItems = <Widget>[
    const HomeView(),
    const ShopView(),
    const CartView(),
  ];

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<BottomNavigationBarItem> _navBars = [
    BottomNavigationBarItem(
      icon: const Icon(Icons.home),
      label: LocaleKeys.common_nav_home.tr().toTitleCase(),
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.shopping_bag),
      label: LocaleKeys.common_nav_shop.tr().toTitleCase(),
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.shopping_cart),
      label: LocaleKeys.common_nav_cart.tr().toTitleCase(),
    ),
    
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: _navItems,
        ),
        bottomNavigationBar: BottomNavigationBar(
            onTap: _onItemTapped,
            currentIndex: _selectedIndex,
            items: _navBars),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
