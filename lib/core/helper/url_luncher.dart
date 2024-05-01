import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:url_launcher/url_launcher.dart';

//com.google.android.gm
void openEmailApp(BuildContext context) async {
  const url = 'com.google.android.gm';
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("WhatsApp not installed")));
  }
}

Future<void> makeReservation(
    {required String token, required int garageId}) async {
  var headersList = {
    'Accept': '*/*',
    'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
    'Authorization': 'Bearer ',
    'Content-Type': 'application/json'
  };
  var url = Uri.parse(
      'https://raknaapi.azurewebsites.net/api/Driver/MakeReservation');

  var body = {
    "GarageId": 32,
    "dateTime":
        "${DateTime.now().toString().split(" ")[0]}T${DateTime.now().toString().split(" ")[1].substring(0, 12)}Z"
  };

  var req = http.Request('POST', url);
  req.headers.addAll(headersList);
  req.body = json.encode(body);

  var res = await req.send();
  final resBody = await res.stream.bytesToString();

  if (res.statusCode >= 200 && res.statusCode < 300) {
    print(resBody);
  } else {
    print(res.reasonPhrase);
  }
}
