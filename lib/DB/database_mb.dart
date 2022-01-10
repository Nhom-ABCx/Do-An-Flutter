import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'package:flutter_application_1/all_page.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart';
// import 'dart:io';

class Db {
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
    String path = join(docCument.path, 'do_an_mb.db');
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
    await db.execute('''
    CREATE TABLE khach_hangs (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        Username  TEXT,
        Email  TEXT,
        Phone  TEXT,
        HoTen  TEXT,
        NgaySinh  TEXT,
        GioiTinh INTEGER,
        DiaChi  TEXT,
        HinhAnh  TEXT,
        created_at TEXT,
        updated_at TEXT,
        deleted_at TEXT
      )
      ''');
  }

  //thêm một item vào trong db cart
  Future<Cart> insertItemCart(Cart cart) async {
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
  Future<bool> ifPrdExitsCart(Cart cart) async {
    var dbclient = await database;
    final raw = await dbclient.rawQuery('SELECT EXISTS(SELECT * FROM cart WHERE productId=?)', [cart.productId]);
    int? exits = Sqflite.firstIntValue(raw);
    return exits == 1;
  }

  // Kiểm tra số lượng tồn vs số lượng giỏ hàng
  Future<bool> checkStocProduct(int soLuongTon, Cart cart) async {
    var dbclient = await database;
    final raw = await dbclient.query('cart', where: 'id=?', whereArgs: [cart.id]);
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
    final raw = await dbclient.query('cart', where: 'id=?', whereArgs: [cart.id]);
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
  //truy van san pham trong gio hang
  Future<Cart> queryItemCart(Cart cart) async{
    var dbclient =await database;
    final raw = await dbclient.query('cart',where :'id=?',whereArgs: [cart.id]);
    final crt =raw.map((e) => Cart.fromMap(e)).toList();
    return crt[0];
  }

  //xoá tất cả các item trong giỏ hàng
  Future<bool> deleteAllCart() async {
    final dbclient = await database;
    // ignore: unrelated_type_equality_checks
    return dbclient.delete('cart') != 0;
  }

  ///thuoc ve table khach hang
  Future<bool> insertItemKH(KhachHang khachHang) async {
    final dbclient = await database;
    final result = await dbclient.insert('khach_hangs', khachHang.toJson());
    return result != 0;
  }

  Future<bool> deleteItemKH(int id) async {
    final dbclient = await database;
    final result = await dbclient.delete('khach_hangs', where: 'id=?', whereArgs: [id]);
    return result != 0;
  }

  Future<int> updateItemKH(KhachHang khachHang) async {
    var dbclient = await database;
    return dbclient.update(
      'khach_hangs',
      khachHang.toJson(),
      where: 'id=?',
      whereArgs: [khachHang.id],
    );
  }

  Future<KhachHang> getItemsKH(int id) async {
    final dbclient = await database;
    var _khachHang = KhachHang.empty();
    List<Map> result = await dbclient.rawQuery("SELECT * FROM khach_hangs WHERE Id=?", [id]);

    if (result.isNotEmpty) {
      _khachHang = KhachHang.fromJson(result.first);
    }
    return _khachHang;
  }

  Future<List<KhachHang>> getAllItemsKH() async {
    final dbclient = await database;

    // final result =
    //     await db.rawQuery('SELECT * FROM $tableNotes ORDER BY $orderBy');

    final result = await dbclient.query("khach_hangs");

    return result.map((json) => KhachHang.fromJson(json)).toList();
  }

  Future<KhachHang> getFirstItemsKH() async {
    final dbclient = await database;
    final result = await dbclient.query("khach_hangs");
    final khachHang = result.map((json) => KhachHang.fromJson(json)).toList();
    if (khachHang.isEmpty) return KhachHang.empty();
    return khachHang[0];
  }

  Future<bool> ifItemExistKH(int id) async {
    final dbclient = await database;
    final result = await dbclient.rawQuery('SELECT EXISTS(SELECT * FROM khach_hangs WHERE id=?)', [id]);

    int? exists = Sqflite.firstIntValue(result);
    return exists == 1;
  }

  Future<KhachHang> insertIfExistItemKH(KhachHang khachHang) async {
    final dbclient = await database;
    if (await ifItemExistKH(khachHang.id!)) {
    } else {
      await dbclient.insert('khach_hangs', khachHang.toJson());
    }
    return khachHang;
  }
}
