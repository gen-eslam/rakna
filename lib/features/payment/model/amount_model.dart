class AmountModel {
  String? total;
  String? currency;
  Details? details;

  AmountModel(
      {required this.total, required this.currency, required this.details});

  AmountModel.fromJson(Map<String, dynamic> json) {
    total = json["total"];
    currency = json["currency"];
    details =
        json["details"] == null ? null : Details.fromJson(json["details"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["total"] = total;
    data["currency"] = currency;
    if (details != null) {
      data["details"] = details?.toJson();
    }
    return data;
  }
}

class Details {
  String? subtotal;
  String? shipping;
  int? shippingDiscount;

  Details({this.subtotal, this.shipping, this.shippingDiscount});

  Details.fromJson(Map<String, dynamic> json) {
    subtotal = json["subtotal"];
    shipping = json["shipping"];
    shippingDiscount = json["shipping_discount"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["subtotal"] = subtotal;
    data["shipping"] = shipping;
    data["shipping_discount"] = shippingDiscount;
    return data;
  }
}
