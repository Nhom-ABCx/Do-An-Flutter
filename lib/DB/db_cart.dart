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

  Future insertItems(Cart cart) async {
    var dbclient = await database;
    await dbclient.insert('cart', cart.toMap());
    return cart;
  }

  Future<int> deleteCart(int id) async {
    var dbclient = await database;
    return await dbclient.delete('cart', where: 'id=?', whereArgs: [id]);
  }

  Future<List<Cart>> getCartList() async {
    var dbclient = await database;
    final query = await dbclient.query('cart');
    return query.map((e) => Cart.fromMap(e)).toList();
  }

  Future<int> updateCart(Cart cart) async {
    var dbclient = await database;
    return dbclient.update(
      'cart',
      cart.toMap(),
      where: 'id=?',
      whereArgs: [cart.id],
    );
  }

  //select cart co ton tai san pham chua
  Future<bool> ifPrdExits(Cart cart) async{
    var dbclient= await database ;
    final raw= await dbclient.rawQuery('SELECT EXISTS(SELECT * FROM cart WHERE productId=?)',[cart.productId]);
    int? exits=Sqflite.firstIntValue(raw);
    return exits==1;
  }

  Future<int> updateQuantity(Cart cart) async{
    var dbclient=await database;
    final raw=await dbclient.query('cart',where: 'id=?',whereArgs: [cart.id]);
    final crt= raw.map((e) => Cart.fromMap(e)).toList();
    int quantity=crt[0].quantity;
    quantity++;
    int newPrice = quantity * crt[0].inintPrice;
    return await dbclient.rawUpdate('''
      UPDATE cart
      SET productPrice=?,quantity=?
      WHERE id=?
    ''',[newPrice, quantity,cart.id]);
    // return updateCart(Cart(
    //   id: cart.id,
    //   productId: cart.productId,
    //   productName: cart.productName,
    //   inintPrice: cart.inintPrice,
    //   productPrice: newPrice,
    //   quantity: quantity,
    //   productImg: cart.productImg
    // ));
  }

  Future<bool> deleteAllCart() async {
    final dbclient = await database;
    // ignore: unrelated_type_equality_checks
    return dbclient.delete('cart')!=0;
  }
}
