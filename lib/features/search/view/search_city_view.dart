import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rakna/core/utils/space_Manager.dart';
import 'package:rakna/core/utils/string_manager.dart';
import 'package:rakna/core/widgets/custom_back_button.dart';
import 'package:rakna/core/widgets/custom_error.dart';
import 'package:rakna/core/widgets/custom_loading.dart';
import 'package:rakna/features/search/logic/cubit/search_cubit.dart';
import 'package:rakna/features/search/view/widget/list_view_item.dart';
import 'package:rakna/features/search/view/widget/search_bar.dart';

class SearchCityView extends StatelessWidget {
  const SearchCityView({super.key});

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
            child: BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state is SearchSuccess) {
                  return ListView.separated(
                      itemBuilder: (context, index) {
                        return ListViewItem(
                          cityGarageModel: state.garages[index],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 10.r,
                        );
                      },
                      itemCount: state.garages.length);
                } else if (state is SearchError) {
                  return CustomError(errorMessage: state.message);
                } else {
                  return const CustomLoading();
                }
              },
            ),
          ),
        ]),
      ),
    );
  }
}
