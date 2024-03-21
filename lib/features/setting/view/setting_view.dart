import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rakna/core/helper/keys.dart';
import 'package:rakna/core/routing/page_name.dart';
import 'package:rakna/core/services/cache_service.dart';
import 'package:rakna/core/theme/manager/colors_manager.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              CacheService.removeData(key: Keys.token);
              context.go(PageName.kLoginView);
            },
            icon: const Icon(
              Icons.exit_to_app,
              color: ColorsManager.pinkClr,
            ),
          ),
        ],
      ),
    );
  }
}
