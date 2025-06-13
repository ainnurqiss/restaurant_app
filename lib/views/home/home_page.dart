import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_foodly/common/app_style.dart';
import 'package:restaurant_foodly/common/background_container.dart';
import 'package:restaurant_foodly/common/custom_appbar.dart';
import 'package:restaurant_foodly/common/home_tile.dart';
import 'package:restaurant_foodly/constants/constants.dart';
import 'package:restaurant_foodly/views/home/home_tabs.dart';
import 'package:restaurant_foodly/views/home/widget/home_tiles.dart';
import 'package:restaurant_foodly/views/home/widget/orders/cancelled_oders.dart';
import 'package:restaurant_foodly/views/home/widget/orders/delivered_orders.dart';
import 'package:restaurant_foodly/views/home/widget/orders/new_orders.dart';
import 'package:restaurant_foodly/views/home/widget/orders/picked_order.dart';
import 'package:restaurant_foodly/views/home/widget/orders/preparing.dart';
import 'package:restaurant_foodly/views/home/widget/orders/ready_orders.dart';
import 'package:restaurant_foodly/views/home/widget/orders/self_deliveries.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController = TabController(
    length: orderList.length,
    vsync: this,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Secondary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Secondary,
        flexibleSpace: const CustomAppbar(),
      ),

      body: BackGroundContainer(
        child: Column(
          children: [
            SizedBox(height: 15.h),
            const HomeTiles(),
            SizedBox(height: 15.h),

            // Tabs (pill buttons)
            HomeTabs(tabController: _tabController),
            SizedBox(height: 15.h),

            // Tab View (tab contents)
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12.w),
              height: height * 0.7,
              color: Colors.transparent,

              child: TabBarView(
                controller: _tabController,
                children: [
                  NewOrders(),
                  Preparing(),
                  ReadyOrders(),
                  PickedOrders(),
                  SelfDeliveries(),
                  DeliveredOrders(),
                  CancelledOrders(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
