
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/cart/cart_model.dart';
import 'package:flutter_application_1/cart/db/db_cart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider extends ChangeNotifier{

  DbCart db=DbCart();
  int _counter=0;
  double _totalPrice=0.0;

  int get counter =>_counter;
  double get  totalPrice=>_totalPrice;

  late Future <List<CartModel>> _cart;
  Future<List<CartModel>> get cart=>_cart;

  Future<List<CartModel>> getData () async{
    _cart=db.getCartList();
    return _cart;
  }

  void _setPrefItems() async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    prefs.setInt('cart_item',_counter );
    prefs.setDouble('total_price', _totalPrice);
    notifyListeners();
  }

    void _getPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counter=  prefs.getInt('cart_item')??0;
    _totalPrice = prefs.getDouble('total_price')??0.0;
    notifyListeners();
  }

   void addTotalPrice(double productPrice) {
    _totalPrice+=productPrice;
    _setPrefItems();
    notifyListeners();
  }

  void removeTotalPrice(double productPrice) {
     _totalPrice -= productPrice;
    _setPrefItems();
    notifyListeners();
  }

  double getTotalPrice() {
    _getPrefItems();
    return _totalPrice;
  }
  void addCounter(){
    _counter++;
    _setPrefItems();
    notifyListeners();
  }
  void removeCounter(){
    _counter--;
     _setPrefItems();
    notifyListeners();
  }
  int getCounter(){
    _getPrefItems();
    return _counter;
  }
}