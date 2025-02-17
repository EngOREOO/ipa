import 'package:elmahdy/view/screen/offersproducts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elmahdy/view/screen/account.dart';
import 'package:elmahdy/view/screen/cart.dart';
import 'package:elmahdy/view/screen/home.dart';
import 'package:elmahdy/view/screen/products.dart';

class MainPageController extends GetxController {
  changePage(int i) {
    currentpage = i;
    update();
  }

  GlobalKey<ScaffoldState> scafoldkey = GlobalKey();

  int currentpage = 2;

  List<Widget> listPage = [
    const OffersProductsPage(),
    const ProductsPage(),
    const HomePage(),
    const CartPage(),
    const AccountPage(),
  ];
  List namescreen = [
    {"title": "Offers".tr, "icon": Icons.discount},
    {"title": "Products".tr, "icon": Icons.explore},
    {"title": "", "icon": Icons.home},
    {"title": "Cart".tr, "icon": Icons.shopping_cart},
    {"title": "Account".tr, "icon": Icons.person},
  ];
}
