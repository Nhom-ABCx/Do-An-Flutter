import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io' ;
import '../cart_model.dart';

class DbCart {
  static Database? _db;
  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }

    _db = await initDatabase();
    return _db!;
  }

  initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'cart.db');
    var db = await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
    return db;
  }

  _onCreate(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    //final boolType = 'BOOLEAN NOT NULL';
    const integerType = 'INTEGER NOT NULL';
    await db.execute(
        'CREATE TABLE  $tableCart (id $idType, productName $textType, productPrice $integerType ,quantity $integerType, productImg $textType )');
  }
  //them san pham vao database 
  Future<Cart> insert(Cart cart) async {
    final dbclient = await db;
    await dbclient.insert(tableCart, cart.toMap());
    return cart;
  }
  //xoa san pham
  Future<int> deletePrdCart(int id) async{
    final dbclient=await db;
    return dbclient.delete(tableCart,
      where: 'id= ?',
      whereArgs: [id]
    );
  }
  Future<List<Cart>> getCartList() async {
    final dbclient = await db;
    final  queryResult = await dbclient.query(tableCart);
    return queryResult.map((e) => Cart.fromMap(e)).toList();
  }
}