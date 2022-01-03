import 'package:json_annotation/json_annotation.dart';

part 'dia_chi.g.dart';

//Chạy câu lệnh flutter pub run build_runner build trong terminal khi part 'user.g.dart' bị lỗi đỏ
@JsonSerializable(explicitToJson: true) // Nếu không có explicitToJson: true thì ko in được lớp ở trong.

class DiaChi {
  int? id;
  late int khachHangId;
  late String tenNguoiNhan;
  late String phone;
  String? tinhThanhPho;
  String? quanHuyen;
  String? phuongXa;
  late String diaChiChiTiet;

  DiaChi(
      {this.id,
      required this.khachHangId,
      required this.tenNguoiNhan,
      required this.phone,
      this.tinhThanhPho,
      this.quanHuyen,
      this.phuongXa,
      required this.diaChiChiTiet});

  factory DiaChi.fromJson(dynamic json) => _$DiaChiFromJson(json);
  Map<String, dynamic> toJson() => _$DiaChiToJson(this);

  DiaChi.empty() {
    id = -1;
    khachHangId = -1;
    tenNguoiNhan = "";
    phone = "";
    tinhThanhPho = "";
    quanHuyen = "";
    phuongXa = "";
    diaChiChiTiet = "";
  }
}
