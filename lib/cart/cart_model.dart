
final String tableCart='cart';
class CartFields{
  static String id='_id';
  static String productName='productName';
  static String productPrice='productPrice';
  static String quantity='quantity';
  static String productImg='productImg';
}
class Cart {
  final int? id;
 
  final String productName;
  final int inintPrice;
  final int productPrice;
  final int quantity;
  final String productImg;

  Cart({
    this.id,
    required this.productName,
    required this.inintPrice,
    required this.productPrice,
    required this.quantity,
    required this.productImg
  });

  Cart.fromMap(Map<dynamic,dynamic> json)
   :id=json['id'],
  productName=json['productName'],
  inintPrice=json['inintPrice'],
  productPrice=json['productPrice'],
  quantity=json['quantity'],
  productImg=json['productImg'];
  
  Map<String,Object?> toMap(){
    return {
        'id':id,
        'productName':productName,
        'inintPrice':inintPrice,
        'productPrice': productPrice,
        'quantity':quantity,
        'productImg':productImg
    };
  }
  // Map<String, Object?> toJson()=>{
  //   CartFields.id:id,
  //   CartFields.productName:productName,
  //   CartFields.productPrice:productPrice,
  //   CartFields.quantity:quantity,
  //   CartFields.productImg:productImg
  // };
  // Cart copy({
  //   int? id,
  //   String? productName,
  //   int? productPrice,
  //   int? quantity,
  //   String? productImg,
  // })=>Cart(id: id?? this.id,
  //   productName: productName?? this.productName,
  //   productPrice: productPrice??this.productPrice,
  //   quantity: quantity??this.quantity,
  //   productImg: productImg??this.productImg
  // );
}
