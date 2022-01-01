import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io';
import '../Modals/cart_model.dart';

class DbCart {
  static Database? _db;

  Future<Database> get database async {
    if (_db != null) {
      return _db!;
    }

    _db = await initDatabase();
    return _db!;
  }

  initDatabase() async {
    Directory docCument = await getApplicationDocumentsDirectory();
    String path = join(docCument.path, 'cart.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE cart (
        id INTEGER PRIMARY KEY ,
        productId INTEGER,
        productName  TEXT,
        inintPrice INTEGER,
        productPrice INTEGER,
        quantity INTEGER,
        productImg TEXT
      )
     ''');
  }

  //thêm một item vào trong db cart
  Future insertItems(Cart cart) async {
    var dbclient = await database;
    await dbclient.insert('cart', cart.toMap());
    return cart;
  }

  //xoá item trong db cart
  Future<int> deleteCart(int id) async {
    var dbclient = await database;
    return await dbclient.delete('cart', where: 'id=?', whereArgs: [id]);
  }

  //lấy ra toàn bộ các item trong db cart
  Future<List<Cart>> getCartList() async {
    var dbclient = await database;
    final query = await dbclient.query('cart');
    return query.map((e) => Cart.fromMap(e)).toList();
  }

  //update giỏ hàng
  Future<int> updateCart(Cart cart) async {
    var dbclient = await database;
    return dbclient.update(
      'cart',
      cart.toMap(),
      where: 'id=?',
      whereArgs: [cart.id],
    );
  }

  //kiểm tra sản phảm đã tồn tại trong giỏ hàng chưa
  Future<bool> ifPrdExits(Cart cart) async {
    var dbclient = await database;
    final raw = await dbclient.rawQuery(
        'SELECT EXISTS(SELECT * FROM cart WHERE productId=?)',
        [cart.productId]);
    int? exits = Sqflite.firstIntValue(raw);
    return exits == 1;
  }

  // Kiểm tra số lượng tồn vs số lượng giỏ hàng
  Future<bool> checkStocProduct(int soLuongTon, Cart cart) async {
    var dbclient = await database;
    final raw =
        await dbclient.query('cart', where: 'id=?', whereArgs: [cart.id]);
    final crt = raw.map((e) => Cart.fromMap(e)).toList();
    int quantity = crt[0].quantity;
    if (soLuongTon > quantity) {
      return true;
    }
    return false;
  }

  // update số lượng khi sản phẩm đã có trong giỏ hàng
  Future<int> updateQuantity(Cart cart) async {
    var dbclient = await database;
    final raw =await dbclient.query('cart', where: 'id=?', whereArgs: [cart.id]);
    final crt = raw.map((e) => Cart.fromMap(e)).toList();
    int quantity = crt[0].quantity;
    quantity++;
    int newPrice = quantity * crt[0].inintPrice;
    return await dbclient.rawUpdate('''
      UPDATE cart
      SET productPrice=?,quantity=?
      WHERE id=?
    ''', [newPrice, quantity, cart.id]);
  }

  //xoá tất cả các item trong giỏ hàng
  Future<bool> deleteAllCart() async {
    final dbclient = await database;
    // ignore: unrelated_type_equality_checks
    return dbclient.delete('cart') != 0;
  }
}
