import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/cart/cart_model.dart';
import 'package:flutter_application_1/cart/db/db_cart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider extends ChangeNotifier {
  double _totalPrice=0.0;
  double get totalPrice=>_totalPrice;
  DbCart db = DbCart();

  late Future<List<Cart>> _cart;
  Future<List<Cart>> get cart => _cart;

  Future<List<Cart>> getData() async {
    _cart = db.getCartList();
     //notifyListeners();
    return _cart;
  }
  void _setPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('total_price',_totalPrice);
    notifyListeners();
  }

   void _getPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _totalPrice = prefs.getDouble('total_price')!;
    notifyListeners();
  }

  void addTotalPrice(double productPrice) {
    _totalPrice = _totalPrice + productPrice;
    _setPrefItems();
    notifyListeners();
  }

  void removeTotalPrice(double productPrice) {
    _totalPrice = _totalPrice - productPrice;
    _setPrefItems();
    notifyListeners();
  }

  double getTotalPrice() {
    _getPrefItems();
    return _totalPrice;
  }
}
