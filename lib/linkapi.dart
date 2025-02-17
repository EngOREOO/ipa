class Applink {
  static const String server = "https://elmahdy-techno-light.com/api";

  static const String imagesloc = "$server/uploads";
  static const String imagesCat = "$imagesloc/categories";
  static const String imagestips = "$imagesloc/tips";

// ############## images ################

  static const String test = "$server/test.php";

// ############## Auth ################
  static const String login = "$server/login";

  static const String signup = "$server/register";
  static const String products = "$server/products?per_page=30";
  static const String latestproducts = "$server/latest/products/?per_page=30";
  static const String offersproducts = "$server/offers/products/?per_page=30";
  static const String brandproducts = "$server/brand/products";
  static const String childrenbrandproducts = "$server/brand/category/products";
  static const String categories = "$server/categories";
  static const String productdetails = "$server/product";
  static const String editprofile = "$server/edit-info";
  static const String editpassword = "$server/edit-password";
  static const String ads = "$server/ads";
  static const String addtocart = "$server/add-to-cart";
  static const String removefromcart = "$server/remove-from-cart";
  static const String getusercart = "$server/get/user-cart";
  static const String makeorder = "$server/make/order";
  static const String addtofavourite = "$server/product/add/fav";
  static const String getfavourite = "$server/list-favs";
  static const String removefavourite = "$server/remove-fav";
  static const String getorders = "$server/list-orders";
  static const String cartqty = "$server/cart-qty";
  static const String educations = "$server/educations";
  static const String quotations = "$server/quotations";
  static const String search = "$server/search/product?name=";
  static const String getpoints = "$server/user/points";
  static const String generatecodepoints = "$server/user/generate-code";
  static const String allbrands = "$server/brands";
}
