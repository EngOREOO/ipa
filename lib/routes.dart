import 'package:elmahdy/controller/contacts_controller.dart';
import 'package:elmahdy/view/screen/aboutus.dart';
import 'package:elmahdy/view/screen/achivements.dart';
import 'package:elmahdy/view/screen/brandproducts.dart';
import 'package:elmahdy/view/screen/changelang.dart';
import 'package:elmahdy/view/screen/childrenbrandproducts.dart';
import 'package:elmahdy/view/screen/concetus.dart';
import 'package:elmahdy/view/screen/editpassword.dart';
import 'package:elmahdy/view/screen/editprofile.dart';
import 'package:elmahdy/view/screen/educational.dart';
import 'package:elmahdy/view/screen/educational.dart';
import 'package:elmahdy/view/screen/favourite.dart';
import 'package:elmahdy/view/screen/latestproducts.dart';
import 'package:elmahdy/view/screen/offersproducts.dart';
import 'package:elmahdy/view/screen/orders.dart';
import 'package:elmahdy/view/screen/points.dart';
import 'package:elmahdy/view/screen/privacypolicy.dart';
import 'package:elmahdy/view/screen/quotations.dart';
import 'package:elmahdy/view/screen/refund.dart';
import 'package:elmahdy/view/screen/search.dart';
import 'package:elmahdy/view/screen/subcategories.dart';
import 'package:elmahdy/view/screen/testui.dart';
import 'package:get/get.dart';
import 'package:elmahdy/core/constant/middleware/mymiddleware.dart';
import 'package:elmahdy/core/constant/routes.dart';
import 'package:elmahdy/view/screen/auth/login.dart';
import 'package:elmahdy/view/screen/auth/signup.dart';
import 'package:elmahdy/view/screen/brands.dart';
import 'package:elmahdy/view/screen/cart.dart';
import 'package:elmahdy/view/screen/categories.dart';
import 'package:elmahdy/view/screen/home.dart';
import 'package:elmahdy/view/screen/language.dart';
import 'package:elmahdy/view/screen/mainpage.dart';
import 'package:elmahdy/view/screen/onbording.dart';
import 'package:elmahdy/view/screen/productdetails.dart';
import 'package:elmahdy/view/screen/products.dart';
import 'package:elmahdy/view/widget/imagesproductdetailswidget.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/",
      page: () => const LanguagePage(),
      middlewares: [MyMiddleware()]),
  // GetPage(name: "/", page: () => ListOnBordingWidgets()),
  GetPage(name: AppRoutes.mainpage, page: () => MainPage()),
  GetPage(name: AppRoutes.onbording, page: () => const OnBording()),
  GetPage(
      name: AppRoutes.BrandProductsPage, page: () => const BrandProductsPage()),
  GetPage(
      name: AppRoutes.SubCategoriesPage, page: () => const SubCategoriesPage()),
  GetPage(name: AppRoutes.login, page: () => const LoginPage()),
  GetPage(name: AppRoutes.signup, page: () => const SignupPage()),
  GetPage(name: AppRoutes.home, page: () => const HomePage()),
  GetPage(
      name: AppRoutes.ChildrenBrandProductsPage,
      page: () => const ChildrenBrandProductsPage()),
  GetPage(
      name: AppRoutes.productdetailspage,
      page: () => const ProductDetailsPage()),
  GetPage(name: AppRoutes.brands, page: () => const BrandsPage()),
  GetPage(name: AppRoutes.categoriespage, page: () => CategoriesPage()),
  GetPage(name: AppRoutes.productspage, page: () => const ProductsPage()),
  GetPage(name: AppRoutes.cart, page: () => const CartPage()),
  GetPage(name: AppRoutes.editprofilepage, page: () => const EditProfilePage()),
  GetPage(name: AppRoutes.favouritePage, page: () => const favouritePage()),
  GetPage(name: AppRoutes.OrdersPage, page: () => const OrdersPage()),
  GetPage(name: AppRoutes.RefundPage, page: () => const RefundPage()),
  GetPage(name: AppRoutes.AboutUsPage, page: () => const AboutUsPage()),
  GetPage(name: AppRoutes.SearchPage, page: () => const SearchPage()),
  GetPage(name: AppRoutes.EducationalPage, page: () => const EducationalPage()),
  GetPage(name: AppRoutes.QuotationsPage, page: () => const QuotationsPage()),
  GetPage(name: AppRoutes.AchivementsPage, page: () => const AchivementsPage()),
  GetPage(
      name: AppRoutes.LatestProductsPage,
      page: () => const LatestProductsPage()),
  GetPage(
      name: AppRoutes.OffersProductsPage,
      page: () => const OffersProductsPage()),
  GetPage(name: AppRoutes.ChangeLangPage, page: () => const ChangeLangPage()),
  GetPage(
      name: AppRoutes.PrivacyPolicyPage, page: () => const PrivacyPolicyPage()),
  GetPage(name: AppRoutes.ConcetUsPage, page: () => const ConcetUsPage()),
  GetPage(
      name: AppRoutes.EditPasswordPage, page: () => const EditPasswordPage()),
  GetPage(name: AppRoutes.PointsPage, page: () => const PointsPage()),
  GetPage(name: AppRoutes.BrandsPage, page: () => const BrandsPage()),

//   GetPage(name: AppRoutes.login, page: () => const LoginPage()),
//   GetPage(name: AppRoutes.signup, page: () => const SignupPage()),
//   GetPage(name: AppRoutes.home, page: () => const HomePage()),
//   GetPage(
//       name: AppRoutes.confirmemailauth, page: () => const ConfirmEmailAuth()),
//   GetPage(
//       name: AppRoutes.checkemailforgetpass,
//       page: () => const CheckEmailForgetPass()),
//   GetPage(
//       name: AppRoutes.verfiycodeforgetpass,
//       page: () => const VerfiycodeForgetPass()),
//   GetPage(
//       name: AppRoutes.resetPassForgetPass,
//       page: () => const ResetPassForgetPass()),
//   GetPage(name: AppRoutes.items, page: () => const ItemsPage()),
//   GetPage(name: AppRoutes.itemsdetails, page: () => const ItemsDetails()),
];
