

class CartModel {
  late final int? id;
  final String? productId;
  final String? productName;
  final int? productPrice;
  final int? quantity;
  final String? productImg;

  CartModel({
   this.id,
    required this.productId,
    required this.productName,
    required this.productPrice,
    required this.quantity,
    required this.productImg
  });

  CartModel.fromMap(Map<dynamic,dynamic> res)
  :id=res['id'],
  productId=res['productId'],
  productName=res['productName'],
  productPrice=res['productPrice'],
  quantity=res['quantity'],
  productImg=res['productImg'];
  
  Map<String,Object?> toMap(){
    return {
        'id':id,
        'productId':productId,
        'productName':productName,
        'productPrice': productPrice,
        'quantity':quantity,
        'productImg':productImg
    };
  }
}
