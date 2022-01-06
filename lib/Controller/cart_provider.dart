import 'package:flutter/cupertino.dart';
import '../Modals/cart_model.dart';
import 'package:flutter_application_1/DB/database_mb.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider extends ChangeNotifier {
  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;
  Db db = Db();

  List<Cart> _cart = [];
  List<Cart> get cart => _cart;

  Future<List<Cart>> getData() async {
    _cart = await db.getCartList();
    print("getCartData");
    return _cart;
  }

  void _setPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('total_price', _totalPrice);
    notifyListeners();
  }

  //da~ fix
  void _getPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _totalPrice = prefs.getDouble('total_price') ?? 0.0;
  }

  void addTotalPrice(double productPrice) {
    _totalPrice = _totalPrice + productPrice;
    _setPrefItems();
    notifyListeners();
  }

  void removeTotalPrice(double productPrice) {
    _totalPrice = _totalPrice - productPrice;
    if (_totalPrice < 0) _totalPrice = 0;

    _setPrefItems();
    notifyListeners();
  }

  double getTotalPrice() {
    print("gettotal");
    _getPrefItems();
    return _totalPrice;
  }

  //so luong
  int _quantity = 1;
  int get quantity => _quantity;
  void addQuantity() {
    _quantity++;
    notifyListeners();
  }

  void removeQuantity() {
    if (_quantity > 1) {
      _quantity--;
    }
    notifyListeners();
  }

  void setQuantity(int value) {
    _quantity = value;
    notifyListeners();
  }

  int getQuantity() => _quantity;

  //xoá total price
  Future<bool> deleteAllCart() {
    print("deleteAllCart");
    _totalPrice = 0;
    _setPrefItems();
    notifyListeners();
    return db.deleteAllCart();
  }
}
