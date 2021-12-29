import 'package:flutter_application_1/all_page.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io';

class DB_KhachHang {
  static Database? _db;

  Future<Database> get database async {
    if (_db != null) {
      return _db!;
    }

    _db = await initDatabase();
    return _db!;
  }

  Future<Database> initDatabase() async {
    Directory docCument = await getApplicationDocumentsDirectory();
    String path = join(docCument.path, 'khach_hangs.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  _onCreate(Database db, int version) async {
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

  Future<bool> insertItem(KhachHang khachHang) async {
    final dbclient = await database;
    final result = await dbclient.insert('khach_hangs', khachHang.toJson());
    return result != 0;
  }

  Future<bool> deleteItem(int id) async {
    final dbclient = await database;
    final result = await dbclient.delete('khach_hangs', where: 'id=?', whereArgs: [id]);
    return result != 0;
  }

  Future<KhachHang> getItems(int id) async {
    final dbclient = await database;
    var _khachHang = KhachHang.empty();
    List<Map> result = await dbclient.rawQuery("SELECT * FROM khach_hangs WHERE Id=?", [id]);

    if (result.isNotEmpty) {
      _khachHang = KhachHang.fromJson(result.first);
    }
    return _khachHang;
  }

  Future<List<KhachHang>> getAllItems() async {
    final dbclient = await database;

    // final result =
    //     await db.rawQuery('SELECT * FROM $tableNotes ORDER BY $orderBy');

    final result = await dbclient.query("khach_hangs");

    return result.map((json) => KhachHang.fromJson(json)).toList();
  }

  Future<KhachHang> getFirstItems() async {
    final dbclient = await database;
    final result = await dbclient.query("khach_hangs");
    final khachHang = result.map((json) => KhachHang.fromJson(json)).toList();
    if (khachHang.isEmpty) return KhachHang.empty();
    return khachHang[0];
  }

  Future<bool> ifItemExist(int id) async {
    final dbclient = await database;
    final result =
        await dbclient.rawQuery('SELECT EXISTS(SELECT * FROM khach_hangs WHERE id=?)', [id]);

    int? exists = Sqflite.firstIntValue(result);
    return exists == 1;
  }

  Future<KhachHang> insertIfExistItem(KhachHang khachHang) async {
    final dbclient = await database;
    if (await ifItemExist(khachHang.id!)) {
    } else {
      await dbclient.insert('khach_hangs', khachHang.toJson());
    }
    return khachHang;
  }
}
