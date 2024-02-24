import 'package:flutter/material.dart';
import 'package:rakna/core/theme/manager/text_style_manager.dart';
import 'package:rakna/core/utils/space_Manager.dart';
import 'package:rakna/core/utils/string_manager.dart';
import 'package:rakna/core/widgets/custom_back_button.dart';
import 'package:rakna/core/widgets/custom_text.dart';
import 'package:rakna/core/widgets/custom_text_form_fieild.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: const Text(StringManager.search),
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.all(AppPadding.p16),
        child: const Column(children: [
          SerchBar(),
        ]),
      ),
    );
  }
}

class SerchBar extends StatelessWidget {
  const SerchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          const Expanded(
            flex: 4,
            child: CustomTextFormFeild(
              text: StringManager.searchByCity,
              prefixIcon: Icons.search,
            ),
          ),
          Expanded(
            flex: 1,
            child: TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                elevation: 0,
              ),
              onPressed: () {},
              child: CustomText(
                text: StringManager.nearestLocation,
                style: TextStyleManager.textStyle12w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
