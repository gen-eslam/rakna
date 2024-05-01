import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:go_router/go_router.dart';
import 'package:rakna/core/helper/enums.dart';
import 'package:rakna/core/helper/keys.dart';
import 'package:rakna/core/helper/url_luncher.dart';
import 'package:rakna/core/routing/page_name.dart';
import 'package:rakna/core/services/cache_service.dart';
import 'package:rakna/core/widgets/custom_snak_bar.dart';
import 'package:rakna/features/search/data/model/garage_model.dart';

import '../../model/amount_model.dart';
import '../../model/item_list_model.dart';

class PaymentPage extends StatelessWidget {
  final GarageModel garageModel;
  const PaymentPage({
    super.key,
    required this.garageModel,
  });

  @override
  Widget build(BuildContext context) {
    print(DateTime.now());

    var transactionData = getTransactionData();

    return Scaffold(
      body: PaypalCheckoutView(
        sandboxMode: true,
        clientId: Keys.clientID,
        secretKey: Keys.secretID,
        transactions: [
          {
            "amount": transactionData.amountModel.toJson(),
            "description": "The payment transaction description.",
            "item_list": transactionData.itemList.toJson(),
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) {
          log("onSuccess: $params");
          makeReservation(
                  token: CacheService.getDataString(key: Keys.token)!,
                  garageId: garageModel.garageId as int)
              .then((value) {
            ScaffoldMessenger.of(context).showSnackBar(customSnackBar(
                text: "Reservation created successfully",
                colorState: ColorState.sucess));
            context.go(PageName.kHomeLayoutView);
          }).catchError((error) {
            ScaffoldMessenger.of(context).showSnackBar(customSnackBar(
                text: error.toString(), colorState: ColorState.failure));
            Navigator.pop(context);
          });
        },
        onError: (error) {
          log("onError: $error");
          Navigator.pop(context);
        },
        onCancel: () {
          print('cancelled:');
          Navigator.pop(context);
        },
      ),
    );
  }

  // records
  ({AmountModel amountModel, ItemListModel itemList}) getTransactionData() {
    //item list model
    List<OrderItemModel> orderItemModel = [
      // OrderItemModel(
      //   currency: "USD",
      //   name: "Apple",
      //   price: "4",
      //   quantity: 10,
      // ),
      // OrderItemModel(
      //   currency: "USD",
      //   name: "Apple",
      //   price: "5",
      //   quantity: 12,
      // ),
    ];
    ItemListModel itemList = ItemListModel(items: orderItemModel);
    // amount model
    AmountModel amountModel = AmountModel(
      currency: 'USD',
      details: Details(
        shipping: "0",
        shippingDiscount: 0,
        subtotal: "${garageModel.hourPrice}",
      ),
      total: "${garageModel.hourPrice}",
    );
    return (amountModel: amountModel, itemList: itemList);
  }
}
