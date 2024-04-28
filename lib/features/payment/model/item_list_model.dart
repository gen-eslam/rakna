class ItemListModel {
  List<OrderItemModel>? items;

  ItemListModel({this.items});

  ItemListModel.fromJson(Map<String, dynamic> json) {
    items = json["items"] == null
        ? null
        : (json["items"] as List)
            .map((e) => OrderItemModel.fromJson(e))
            .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (items != null) {
      data["items"] = items?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class OrderItemModel {
  String? name;
  int? quantity;
  String? price;
  String? currency;

  OrderItemModel({this.name, this.quantity, this.price, this.currency});

  OrderItemModel.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    quantity = json["quantity"];
    price = json["price"];
    currency = json["currency"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["quantity"] = quantity;
    data["price"] = price;
    data["currency"] = currency;
    return data;
  }
}
