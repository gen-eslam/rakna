import 'package:rakna/features/payment/data/model/payment_const_key.dart';

class PaymentRequestModel {
  String token;
  PaymentRequestModel({
    required this.token,
  });

  factory PaymentRequestModel.fromJson(Map<String, dynamic> json) {
    return PaymentRequestModel(
      token: json['token'],
    );
  }
  Map<String, dynamic> toJson() => {
        "token": token,
      };
  static Map<String, dynamic> sendBody({
    required int price,
    required String orderId,
    required String token,
    required String email,
    required String firstName,
    required String lastName,
    required String phone,
  }) {
    return {
      "auth_token": token,
      "amount_cents": "$price",
      "expiration": 3600,
      "order_id": orderId,
      "billing_data": {
        "apartment": "NA",
        "email": email,
        "floor": "NA",
        "first_name": firstName,
        "street": "NA",
        "building": "NA",
        "phone_number": phone,
        "shipping_method": "NA",
        "postal_code": "NA",
        "city": "NA",
        "country": "NA",
        "last_name": lastName,
        "state": "NA"
      },
      "currency": "EGP",
      "integration_id": PaymentConstKey.integrationIdCard,
      "lock_order_when_paid": "false"
    };
  }
}
