import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rakna/core/helper/extensions.dart';
import 'package:rakna/core/helper/keys.dart';
import 'package:rakna/core/networking/dio_helpers.dart';
import 'package:rakna/core/routing/page_name.dart';
import 'package:rakna/core/services/cache_service.dart';
import 'package:rakna/core/theme/manager/colors_manager.dart';
import 'package:rakna/core/theme/manager/text_style_manager.dart';
import 'package:rakna/core/utils/space_Manager.dart';
import 'package:rakna/core/utils/string_manager.dart';
import 'package:rakna/core/widgets/custom_text.dart';
import 'package:rakna/features/garage_details/view/widget/garage_title_and_details.dart';
import 'package:rakna/features/home/view/widgets/search_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: StringManager.appName,
          style: TextStyleManager.textStyle30w700,
        ),
        SizedBox(
          height: AppSpace.s16.h,
        ),
        SearchButton(
          onTap: () => context.push(PageName.kSearchView),
        ),
        SizedBox(
          height: 15.h,
        ),
        CustomText(
          text: "Reservations",
          style: TextStyleManager.textStyle18w600,
        ),
        SizedBox(
          height: 15.h,
        ),
        Expanded(
          child: FutureBuilder(
              future: DioHelper.getData(
                url: "/api/Driver/GetAllReservation",
                token: CacheService.getDataString(key: Keys.token),
              ),
              builder: (context, snapshot) {
                if (snapshot.data?.data.length == 0) {
                  return Center(
                      child: CustomText(
                          text: "No Reservations",
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
                          GarageTitleAndDetails(
                              title: StringManager.garageName,
                              details: snapshot.data?.data[index]
                                  ["GarageLocation"]),
                          GarageTitleAndDetails(
                              title: "Reservation Date",
                              details:
                                  "${snapshot.data?.data[index]["ReservationDate"].split("T")[0]}"),
                          GarageTitleAndDetails(
                              title: "Reservation Time",
                              details:
                                  "${snapshot.data?.data[index]["ReservationDate"].split("T")[1].split(".")[0]}"),
                          GarageTitleAndDetails(
                            title: "Reservation Cost",
                            details:
                                "${snapshot.data?.data[index]["ReservationCost"]}",
                          ),
                          GarageTitleAndDetails(
                              title: "Driver Name",
                              details: snapshot.data?.data[index]
                                  ["DriverName"]),
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
              text: "Parking Section", style: TextStyleManager.textStyle18w600),
        ),
        Expanded(
          child: StatefulBuilder(builder: (context, setState) {
            Future.delayed(const Duration(seconds: 5), () {
              setState(() {
                print("object");
              });
            });

            return FutureBuilder(
                future: DioHelper.getData(
                  url: "/api/Driver/RealTimeParkingSessions",
                  token: CacheService.getDataString(key: Keys.token),
                ),
                builder: (context, snapshot) {
                  if (snapshot.data?.data.length == 0) {
                    return Center(
                        child: CustomText(
                            text: "No Parking Sessions",
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
                            GarageTitleAndDetails(
                                title: "Garage Street",
                                details: snapshot.data?.data[index]
                                    ["GarageStreet"]),
                            GarageTitleAndDetails(
                                title: "Session Start D",
                                details:
                                    "${snapshot.data?.data[index]["SessionStart"].split(" ")[0]}"),
                            GarageTitleAndDetails(
                                title: "Session Start T",
                                details:
                                    "${snapshot.data?.data[index]["SessionStart"].split(" ")[1].split(".")[0]}"),
                            GarageTitleAndDetails(
                                title: "Session Time",
                                details:
                                    "${snapshot.data?.data[index]["SessionTime"].split(".")[0]}"),
                            GarageTitleAndDetails(
                              title: "Session Cost",
                              details:
                                  "${(snapshot.data?.data[index]["SessionPrice"])}"
                                      .substring(0, 5),
                            ),
                            GarageTitleAndDetails(
                              title: "Car Plate",
                              details: snapshot.data?.data[index]["carplate"],
                            ),
                          ]),
                    ),
                    separatorBuilder: (context, index) => VerticalDivider(
                      width: AppSpace.s16.w,
                    ),
                  );
                });
          }),
        ),
      ],
    );
  }
}
