import 'package:flutter_application_1/all_page.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ct_hoa_don.g.dart';

//Chạy câu lệnh flutter pub run build_runner watch trong terminal khi part 'user.g.dart' bị lỗi đỏ
@JsonSerializable(
    explicitToJson:
        true) // Nếu không có explicitToJson: true thì ko in được lớp ở trong.
class CT_HoaDon {
  int? HoaDonId;
  late int SanPhamId;
  int? SoLuong;
  double? GiaBan;
  double? GiaGiam;
  double? ThanhTien;
  int? Star;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  SanPham? sanPham;

  CT_HoaDon(
      {this.HoaDonId,
      required this.SanPhamId,
      this.SoLuong,
      this.GiaBan,
      this.GiaGiam,
      this.ThanhTien,
      this.Star,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
       this.sanPham,
      });
  factory CT_HoaDon.fromJson(dynamic json) => _$CT_HoaDonFromJson(json);
  Map<String, dynamic> toJson() => _$CT_HoaDonToJson(this);
}
