import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rakna/core/helper/extensions.dart';
import 'package:rakna/core/theme/manager/text_style_manager.dart';
import 'package:rakna/core/widgets/custom_text.dart';

class AnimatedListViewItem extends StatefulWidget {
  final int index;
  const AnimatedListViewItem({Key? key, required this.index}) : super(key: key);

  @override
  State<AnimatedListViewItem> createState() => _AnimatedListViewItemState();
}

class _AnimatedListViewItemState extends State<AnimatedListViewItem> {
  double screenHeight = 0;
  double screenWidth = 0;

  bool startAnimation = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        startAnimation = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = context.deviceHeight;
    screenWidth = context.deviceWidth;
    return AnimatedContainer(
      width: screenWidth,
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 300 + (widget.index * 200)),
      transform:
          Matrix4.translationValues(startAnimation ? 0 : screenWidth, 0, 0),
      margin: EdgeInsets.only(
        bottom: 12.r,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth / 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                shape: BoxShape.rectangle,
              ),
              child: Image.network(
                "https://static.wikia.nocookie.net/characterprofile/images/c/c8/BotW_Link.png/revision/latest?cb=20170306180639",
                scale: 1 / 1,
                fit: BoxFit.contain,
                height: 60.r,
                width: 60.r,
              ),
            ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomText(
                    text: "Link",
                    style: TextStyleManager.textStyle14w600,
                  ),
                  CustomText(
                    text: "10 garage",
                    style: TextStyleManager.textStyle12w400,
                  )
                ]),
          ],
        ),
      ),
    );
  }
}
