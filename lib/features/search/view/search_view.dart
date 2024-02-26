import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rakna/core/theme/manager/colors_manager.dart';
import 'package:rakna/core/theme/manager/text_style_manager.dart';
import 'package:rakna/core/utils/space_Manager.dart';
import 'package:rakna/core/utils/string_manager.dart';
import 'package:rakna/core/widgets/custom_back_button.dart';
import 'package:rakna/core/widgets/custom_text.dart';
import 'package:rakna/features/search/view/widget/list_view_item.dart';
import 'package:rakna/features/search/view/widget/search_bar.dart';

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
        child: Column(children: [
          const SerchBar(),
          SizedBox(
            height: 15.r,
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      const ListViewItem(),
                      Visibility(
                        visible: false,
                        child: Container(
                          padding: EdgeInsetsDirectional.all(20.r),
                          height: 300.r,
                          child: ListView.separated(
                              itemBuilder: (context, index) =>
                                  const ListViewItem(),
                              separatorBuilder: (context, index) =>
                                  SizedBox(height: 10.r),
                              itemCount: 5),
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 10.r,
                  );
                },
                itemCount: 10),
          ),
        ]),
      ),
    );
  }
}
