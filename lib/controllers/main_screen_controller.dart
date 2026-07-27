import 'package:e_commerce_app/controllers/Auth_controller/auth_controller.dart';
import 'package:e_commerce_app/models/cart_model.dart';
import 'package:e_commerce_app/models/shoe_model.dart';
import 'package:e_commerce_app/services/api_service.dart';
import 'package:e_commerce_app/utils/constants/api_constants.dart';
import 'package:e_commerce_app/utils/constants/assets_constant.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreenController extends GetxController
    with GetTickerProviderStateMixin {
  final AuthController authController = Get.find<AuthController>();

  final TextEditingController searchQuery = TextEditingController();

  // BASE URL
  final String url = "${ApiConstants.baseUrl}/uploads/";


  // BottomNavBar
  final PageController pageController = PageController();
  RxInt selectedIndex = 0.obs;

  void changePage(int index) {
    if (index != 1) {
      searchQuery.clear();
      filteredItems.assignAll(shoeList);
    }
    selectedIndex.value = index;
  }

  void nextPage(index) {
    pageController.jumpToPage(index);
  }

  // HOMESCREEN -----------------
  // TabBarView on HomeScreen
  late TabController tabController;
  final RxBool isLoading = true.obs;

  // ALL SHOES
  final RxList<Data> shoeList = <Data>[].obs;
  final List<Data> menShoes = [];
  final List<Data> womenShoes = [];
  final List<Data> kidsShoes = [];
  final RxList<String> wishlistIds = <String>[].obs;
  final RxList<Data> wishlistItems = <Data>[].obs;
  final RxList<Cart> cartItems = <Cart>[].obs;

  // FOR FILTER
  final List brands = [
    [Images.nike, 'nike'],
    [Images.adidas, 'adidas'],
    [Images.asics, 'asics'],
    [Images.puma, 'puma'],
  ];
  var selectedBrand = (-1).obs;

  // SEARCH FUNCTION
  final RxList filteredItems = [].obs;
  final RxList filtereByBrandItems = [].obs;

  var priceRange = const RangeValues(50, 300).obs;

  static late SharedPreferences prefs;
  static late String? token;
  static late String? email;
  static late String? firstName;



  static Future<void> getCurrentUser() async {
    prefs = await SharedPreferences.getInstance();

    token = prefs.getString("token");

    email = prefs.getString("email");

    firstName = prefs.getString("firstName");

  }

  Future<void> fetchAllShoes() async {
    try {
      isLoading(true);
      var result = await ApiService.getAllShoes();

      ShoeModel model = ShoeModel.fromJson(result);

      List<Data> shoes = model.data!;

      shoeList.value = shoes;
      filteredItems.assignAll(shoeList);
      filtereByBrandItems.assignAll(shoeList);

      menShoes.addAll(shoeList.where((shoe) => shoe.category == "Men"));
      womenShoes.addAll(shoeList.where((shoe) => shoe.category == "Women"));
      kidsShoes.addAll(shoeList.where((shoe) => shoe.category == "Kids"));
    } catch (e) {
      throw Exception(e);
    } finally {
      isLoading(false);
    }
  }

  void toggleLike(Data shoe) async {
    shoe.isLiked.value = !shoe.isLiked.value;
  }

  Future<void> getWishlist() async {
    try {
      final result = await ApiService.getWishlist();

      print(result["wishlist"]);

      wishlistIds.assignAll(result["wishlist"].cast<String>());

      wishlistItems.assignAll(
        shoeList.where((shoe) => wishlistIds.contains(shoe.id.toString())),
      );

      print(wishlistItems);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> syncLikedStates() async {
    shoeList.assignAll(
      shoeList.map((shoe) {
        shoe.isLiked.value = wishlistIds.contains(shoe.id.toString());
        return shoe;
      }).toList(),
    );
  }

  void getData() async {
    try {
      // GET ALL SHOES
      await fetchAllShoes();

      // GET WISHLIST ITEMS
      await getWishlist();

      // Sync Like
      await syncLikedStates();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> removeWishlistItem(int shoeId, Data shoe) async {
    // final index = wishlistItems.indexOf(shoeId);
    wishlistItems.removeWhere((shoe) => shoe.id! == shoeId);
    await ApiService.toggleLike(shoeId);
    await getWishlist();
    toggleLike(shoe);
  }

  Future<void> addFromWishlistToCart(
    int shoeId,
    String selectedSize,
    Data shoe,
  ) async {
    try {
      final result = await ApiService.addToCart(shoeId, selectedSize);
      CartModel model = CartModel.fromJson(result);
      cartItems.value = model.cart!;
      wishlistItems.removeWhere((shoe) => shoe.id! == shoeId);
      await ApiService.toggleLike(shoeId);
      await getWishlist();
      toggleLike(shoe);
    } catch (e) {
      throw Exception(e);
    }
  }

  // CART
  String get orderSummary {
    RxInt subTotal = 0.obs;
    if (cartItems.isEmpty) {
      subTotal.value = 0;
    } else {
      for (var item in cartItems) {
        print(item.quantity);
        print(item.price!);
        subTotal.value += (item.price! * item.quantity!);
      }
    }
    return subTotal.value.toString();
  }

  Future<void> addToCart(int shoeId, String selectedSize) async {
    try {
      final result = await ApiService.addToCart(shoeId, selectedSize);
      CartModel model = CartModel.fromJson(result);
      cartItems.value = model.cart!;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> getCartItems() async {
    try {
      final result = await ApiService.getCartItems();

      CartModel model = CartModel.fromJson(result);

      cartItems.value = model.cart ?? [];
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> deleteCartItem(int shoeId, String selectedSize) async {
    try {
      final result = await ApiService.deleteCartItem(shoeId, selectedSize);
      CartModel model = CartModel.fromJson(result);
      cartItems.value = model.cart!;
      cartItems.refresh();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> updateCartItem(
    int shoeId,
    String selectedSize,
    String action,
  ) async {
    try {
      final result = await ApiService.updateCartItem(
        shoeId,
        selectedSize,
        action,
      );
      CartModel model = CartModel.fromJson(result);
      cartItems.value = model.cart!;
    } catch (e) {
      throw Exception(e);
    }
  }

  // BY TEXTFIELD
  void filterSearch(String query) {
    if (query.isEmpty) {
      filteredItems.assignAll(shoeList);
    } else {
      filteredItems.value = shoeList
          .where(
            (shoe) =>
                shoe.name!.toLowerCase().contains(query.toLowerCase()) ||
                shoe.brand!.toLowerCase().contains(query.toLowerCase()) ||
                shoe.category!.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    }
  }

  //  BY BUTTON
  void filterbyPrice(RangeValues range) {
    priceRange.value = range;
    if (filtereByBrandItems.isEmpty) {
      filteredItems.assignAll(
        shoeList
            .where(
              (shoe) =>
                  range.start.toInt() <= shoe.price! &&
                  shoe.price! <= range.end.toInt(),
            )
            .toList(),
      );
    } else {
      filteredItems.assignAll(
        filtereByBrandItems
            .where(
              (shoe) =>
                  range.start.toInt() <= shoe.price! &&
                  shoe.price! <= range.end.toInt(),
            )
            .toList(),
      );
    }
  }

  void filterbyBrand(String? brand) {
    if (brand == null) {
      filteredItems.assignAll(shoeList);
    } else {
      filteredItems.assignAll(
        shoeList.where((shoe) => shoe.brand!.toLowerCase() == brand).toList(),
      );
    }

    priceRange.value = RangeValues(50, 300);
    filtereByBrandItems.assignAll(filteredItems);
  }

  // Truncate text with specified Max Length
  String truncateWithEllipsis(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    }
    return '${text.substring(0, maxLength)}...';
  }

  @override
  void onInit() {
    super.onInit();
    
    getData();
    getCartItems();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void onReady() {
    getCurrentUser();
    super.onReady();
  }

  @override
  void onClose() {
    
    selectedIndex.close();
    pageController.dispose();

    shoeList.close();
    selectedBrand.close();
    menShoes.clear();
    womenShoes.clear();
    kidsShoes.clear();
    wishlistIds.close();
    wishlistItems.close();
    cartItems.close();
    filteredItems.close();
    filtereByBrandItems.close();
    tabController.dispose();
    super.onClose();
  }
}
