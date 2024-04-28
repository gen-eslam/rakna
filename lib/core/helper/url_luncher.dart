import 'package:flutter/material.dart';
import 'dart:io';

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
