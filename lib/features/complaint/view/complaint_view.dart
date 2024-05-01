import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rakna/core/helper/enums.dart';
import 'package:rakna/core/helper/extensions.dart';
import 'package:rakna/core/helper/keys.dart';
import 'package:rakna/core/networking/dio_helpers.dart';
import 'package:rakna/core/services/cache_service.dart';
import 'package:rakna/core/theme/manager/colors_manager.dart';
import 'package:rakna/core/theme/manager/text_style_manager.dart';
import 'package:rakna/core/utils/space_Manager.dart';
import 'package:rakna/core/widgets/custom_snak_bar.dart';
import 'package:rakna/core/widgets/custom_text.dart';

class ComplaintScreen extends StatefulWidget {
  const ComplaintScreen({super.key});

  @override
  State<ComplaintScreen> createState() => _ComplaintScreenState();
}

class _ComplaintScreenState extends State<ComplaintScreen> {
  final scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: CustomText(
          text: "Complaint",
          style: TextStyleManager.textStyle18w600,
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              TextEditingController controller = TextEditingController();
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        backgroundColor: ColorsManager.darkBlue,
                        content: TextField(
                          controller: controller,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Enter Complaint",
                          ),
                          maxLines: 5,
                        ),
                        title: const Text("Make Complaint"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                if (controller.text.isNotEmpty) {
                                  DioHelper.postData(
                                      token: CacheService.getDataString(
                                          key: Keys.token),
                                      url: "/api/Report/CreateReport",
                                      data: {
                                        "ReportMessage": controller.text
                                      }).then((value) {
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      customSnackBar(
                                          text: "Complaint Sent Successfully",
                                          colorState: ColorState.sucess),
                                    );
                                  });
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    customSnackBar(
                                        text: "Enter Complaint",
                                        colorState: ColorState.warning),
                                  );
                                }
                              },
                              child: const Text("Send"))
                        ],
                      ));
            },
            child: CustomText(
              text: "Make Complaint",
              style: TextStyleManager.textStyle12w400,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "Unsolved Complaints",
              style: TextStyleManager.textStyle18w600,
            ),
            SizedBox(
              height: 15.h,
            ),
            Expanded(
              child: FutureBuilder(
                  future: DioHelper.getData(
                    url: "/api/Driver/UnsolvedReports",
                    token: CacheService.getDataString(key: Keys.token),
                  ),
                  builder: (context, snapshot) {
                    if (snapshot.data?.data.length == 0) {
                      return Center(
                          child: CustomText(
                              text: "No Unsolved Complaints",
                              style: TextStyleManager.textStyle18w600));
                    }
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return ListView.separated(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: snapshot.data?.data.length,
                      itemBuilder: (context, index) => Container(
                        width: context.deviceWidth * 0.9,
                        padding: EdgeInsetsDirectional.all(20.r),
                        decoration: BoxDecoration(
                          color: ColorsManager.bluishClr.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomText(
                                  text: snapshot
                                      .data!.data[index]["ReportMessage"]
                                      .toString()
                                      .substring(4),
                                  style: TextStyleManager.textStyle18w600),
                            ]),
                      ),
                      separatorBuilder: (context, index) => VerticalDivider(
                        width: AppSpace.s16.w,
                      ),
                    );
                  }),
            ),
            Padding(
              padding: EdgeInsetsDirectional.symmetric(vertical: 20.r),
              child: CustomText(
                  text: "Solved Complaints",
                  style: TextStyleManager.textStyle18w600),
            ),
            Expanded(
              child: FutureBuilder(
                  future: DioHelper.getData(
                    url: "/api/Driver/solvedReports",
                    token: CacheService.getDataString(key: Keys.token),
                  ),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: CustomText(
                            text: "No Solved Complaints",
                            style: TextStyleManager.textStyle18w600),
                      );
                    } else if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      return Center(
                          child: CustomText(
                              text: "No Solved Complaints",
                              style: TextStyleManager.textStyle18w600));
                    } else {
                      return ListView.separated(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemCount: snapshot.data?.data.length,
                        itemBuilder: (context, index) => Container(
                          width: context.deviceWidth * 0.9,
                          padding: EdgeInsetsDirectional.all(20.r),
                          decoration: BoxDecoration(
                            color: ColorsManager.bluishClr.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: []),
                        ),
                        separatorBuilder: (context, index) => VerticalDivider(
                          width: AppSpace.s16.w,
                        ),
                      );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
