class OrderRegistrationModel {
  int id;
  OrderRegistrationModel({
    required this.id,
  });
  factory OrderRegistrationModel.fromJson(Map<String, dynamic> json) {
    return OrderRegistrationModel(
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
      };

  static Map<String, dynamic> sendBody(
      {required int price, required String token}) {
    return {
      'auth_token': token,
      "delivery_needed": "false",
      "amount_cents": "${price * 100}",
      "currency": "EGP",
      "items": [],
    };
  }
}
