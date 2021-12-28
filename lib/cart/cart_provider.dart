import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/cart/cart_model.dart';
import 'package:flutter_application_1/cart/db/db_cart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider extends ChangeNotifier {
  
  List<Cart> itemCart=[];
  double _totalPrice=0.0;

  void addItem(Cart cart){
    itemCart.add(cart);
    _totalPrice+=cart.productPrice;
    notifyListeners();
  }
  void removeItem(Cart cart){
    _totalPrice-=cart.productPrice;
    itemCart.remove(cart);
    notifyListeners();
  }
  
  double get gettotalPrice=>_totalPrice;
  List<Cart> get getCartItems=>itemCart;
  // DbCart db = DbCart();

  // late Future<List<Cart>> _cart;
  // Future<List<Cart>> get cart => _cart;

  // Future<List<Cart>> getData() async {
  //   _cart = db.getCartList();
  //    notifyListeners();
  //   return cart;
  // }

  //  deleteCartItem(int id) {
  //     db.deletePrdCart(id);
  //    notifyListeners();
  // }
  // final List<Cart> items=[];

  // void addItem(Cart cart){
  //   items.add(cart);
  //   notifyListeners();
  // }
  // void removeItem(int id){
  //   items.removeAt(id);
  //   notifyListeners();
  // }
  // void _setPrefItems() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.clear();
  //   //prefs.setDouble('total_price', _totalPrice);
  //   notifyListeners();
  // }

  // _getPrefItems() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   _totalPrice = prefs.getDouble('total_price')??0.0;
  //   notifyListeners();
  //   //return _totalPrice;
  // }

  // void addTotalPrice(double productPrice) {
  //   _totalPrice = _totalPrice + productPrice;
  //   _setPrefItems();
  //   notifyListeners();
  // }

  // void removeTotalPrice(double productPrice) {
  //   _totalPrice = _totalPrice - productPrice;
  //   _setPrefItems();
  //   notifyListeners();
  // }

  // double getTotalPrice() {
  //   _getPrefItems();
  //   return _totalPrice;
  // }
}
