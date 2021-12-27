
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io' as io;
import '../cart_model.dart';

class DbCart {

  static Database? _db;
  Future<Database?> get db async{
    if(_db !=null){
      return _db!;
    }

    
    _db = await initDatabase();
  }   

 initDatabase() async{
  io.Directory documentDirectory= await getApplicationDocumentsDirectory();
  String  path =join(documentDirectory.path,'cart.db');
  var db =await openDatabase(path,version: 1, onCreate: _onCreate,); 
  return db;
}

_onCreate(Database db,int version) async{
  await db.execute(
    'CREATE TABLE  cart (id  INTEGER PRIMARY KEY autoincrement, productId VARCHAR  UNIQUE, productName TEXT, productPrice INTEGER ,quantity INTEGER, productImg TEXT )'
  );
}
  Future<CartModel> insert( CartModel cart) async{
    var dbclient= await  db;
    await dbclient?.insert('cart', cart.toMap());
     return cart;
  }
  Future<List<CartModel>> getCartList() async {
    var dbclient = await db;
    final List<Map<String,Object?>> queryResult =await dbclient!.query('cart');
    return queryResult.map((e) => CartModel.fromMap(e)).toList();
  }

}