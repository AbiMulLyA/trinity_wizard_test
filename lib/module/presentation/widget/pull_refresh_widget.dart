// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PullRefreshComponent extends StatelessWidget {
  const PullRefreshComponent({
    Key? key,
    required this.controller,
    this.scrollController,
    required this.onRefresh,
    required this.child,
    this.primary = false,
    this.distance,
  }) : super(key: key);

  final RefreshController controller;
  final ScrollController? scrollController;
  final void Function() onRefresh;
  final Widget child;
  final bool? primary;
  final double? distance;
  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: false,
      primary: primary,
      header: Platform.isIOS
          ? CustomHeader(
              height: distance ?? 60.0,
              builder: (context, mode) {
                return Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                      child: Center(
                        child: CupertinoActivityIndicator(
                          radius: 14.r,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                );
              },
            )
          : WaterDropMaterialHeader(
              distance: distance ?? 60.0,
              backgroundColor: Colors.grey[50],
              color: Colors.blue,
            ),
      controller: controller,
      scrollController: scrollController,
      onRefresh: () {
        debugPrint('OnRefresh Clicked');
        HapticFeedback.heavyImpact();
        onRefresh();
      },
      physics: const BouncingScrollPhysics(),
      child: child,
    );
  }
}
