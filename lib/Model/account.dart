import 'base_model.dart';

class Account extends BaseModel<Account> {
  String? message;
  String? token;
  User? user;

  Account({this.message, this.token, this.user});

  @override
  Account fromJson(Map<String, dynamic> json) => Account(
        message: json['message'],
        token: json['token'],
        user: json['user'] != null ? User.fromJson(json['user']) : null,
      );
  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['token'] = token;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  int? loaiTaiKhoanId;
  String? username;
  String? email;
  String? phone;
  String? hoTen;
  String? ngaySinh;
  int? gioiTinh;
  String? diaChi;
  String? hinhAnh;

  User({
    this.id,
    this.loaiTaiKhoanId,
    this.username,
    this.email,
    this.phone,
    this.hoTen,
    this.ngaySinh,
    this.gioiTinh,
    this.diaChi,
    this.hinhAnh,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    loaiTaiKhoanId = json['LoaiTaiKhoanId'];
    username = json['Username'];
    email = json['Email'];
    phone = json['Phone'];
    hoTen = json['HoTen'];
    ngaySinh = json['NgaySinh'];
    gioiTinh = json['GioiTinh'];
    diaChi = json['DiaChi'];
    hinhAnh = json['HinhAnh'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['LoaiTaiKhoanId'] = loaiTaiKhoanId;
    data['Username'] = username;
    data['Email'] = email;
    data['Phone'] = phone;
    data['HoTen'] = hoTen;
    data['NgaySinh'] = ngaySinh;
    data['GioiTinh'] = gioiTinh;
    data['DiaChi'] = diaChi;
    data['HinhAnh'] = hinhAnh;

    return data;
  }
}
