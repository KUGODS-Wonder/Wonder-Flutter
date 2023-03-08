import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:wonder_flutter/app/common/constants.dart';
import 'package:wonder_flutter/app/common/values/app_colors.dart';
import 'package:wonder_flutter/app/common/values/styles/app_text_style.dart';
import 'package:wonder_flutter/app/modules/widgets/app_bottom_navigation_bar.dart';

import '../controllers/event_controller.dart';

class EventView extends GetView<EventController> {
  static double tabIconSize = 30.0;

  const EventView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: Get.height * 0.075),
            Container(
              height: Get.height * 0.2,
              padding: const EdgeInsets.symmetric(horizontal: Constants.defaultHorizontalPadding),
              child: Text(
                '걸어서 기쁨을\n나눠봐요.',
                style: AppTextStyle.eventHeadline,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Constants.defaultHorizontalPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Wonder Walk',
                          style: AppTextStyle.profileTitlesStyle,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  TabBar(
                    controller: controller.tabController,
                    indicatorSize: TabBarIndicatorSize.label,
                    labelColor: AppColors.white,
                    unselectedLabelColor: AppColors.black,
                    indicator: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        color: AppColors.reward80),
                    tabs: controller.eventTabs.map(
                      (eventTab) {
                        return Tab(
                          height: 35,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                eventTab.iconPath,
                                width: tabIconSize,
                                height: tabIconSize,
                              ),
                              const SizedBox(width: 5),
                              Text(eventTab.title),
                            ],
                          )
                        );
                      }
                    ).toList()
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: Constants.defaultHorizontalPadding),
                      decoration: const BoxDecoration(
                        color: AppColors.reward80,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: TabBarView(
                        controller: controller.tabController,
                        children: controller.eventTabs.map(
                          (eventTab) {
                            return Column(
                              children: [
                                Text(
                                  eventTab.comment,
                                  textAlign: TextAlign.center,
                                  style: AppTextStyle.eventCommentStyle,
                                ),
                              ],
                            );
                          }
                        ).toList(),
                      ),
                    ),
                  )
                ],
              )
            )
          ],
        ),
      ),
      bottomNavigationBar: AppBottomNavigationBar(currentIndex: 0),
    );
  }
}