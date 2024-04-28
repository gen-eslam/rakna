class PaymentModel {
  String? name;
  String? email;
  String? userUid;
  String? price;
  String? docId;

  PaymentModel({this.name, this.email, this.userUid,this.price ,this.docId});

  PaymentModel.fromJson(Map<String, dynamic> json, [String? id]) {
    name = json['name'];
    email = json['email'];
    price = json['price'];
    userUid = json['userUid'];
    docId = id;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['price'] = price;
    data['email'] = email;
    data['userUid'] = userUid;
    return data;
  }

  @override
  String toString() {
    return 'PaymentModel{name: $name, email: $email, userUid: $userUid, docId: $docId, price: $price}';
  }
}
