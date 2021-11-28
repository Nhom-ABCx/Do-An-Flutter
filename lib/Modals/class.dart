class SanPham {
  int? id;
  String tensanpham;
  String? mota;
  int? soluongton;
  double? dongia;
  String? hinhanh;
  int? luotmua;
  int? nhacungcapid;
  int? loaisanphamid;
  DateTime? ngaynhap;
  DateTime? ngaycapnhat;
  DateTime? ngayxoa;

//gan` nhu phuong thuc khoi tao
  SanPham({
    this.id,
    required this.tensanpham,
    this.mota,
    this.soluongton,
    this.dongia,
    this.hinhanh,
    this.luotmua,
    this.nhacungcapid,
    this.loaisanphamid,
    this.ngaynhap,
    this.ngaycapnhat,
    this.ngayxoa,
  });
  factory SanPham.fromJson(Map<String, dynamic> json) {
    return SanPham(
      id: json["id"],
      tensanpham: json["TenSanPham"],
      mota: json["MoTa"],
      soluongton: json["SoLuongTon"],
      dongia: json["DonGia"],
      hinhanh: json["HinhAnh"],
      luotmua: json["LuotMua"],
      nhacungcapid: json["NhacungCapId"],
      loaisanphamid: json["LoaiSanPhamId"],
      ngaynhap: json["created_at"],
      ngaycapnhat: json["updated_at"],
    );
  }

  // SanPham.fromJson(Map<String, dynamic> json)
  //     : id = json['Id'],
  //       tensanpham = json['TenSanPham'],
  //       mota = json['MoTa'];
  // Map<String, dynamic> toJson() => {
  //       'Id': id,
  //       'TenSanPham': tensanpham,
  //       'MoTa': mota,
  //     };
}
