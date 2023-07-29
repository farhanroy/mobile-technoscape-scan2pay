import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../widgets/widgets.dart';
import '../controller/dashboard_controller.dart';
import '../controller/profile_controller.dart';

class HomeScreen extends GetView<HomeScreen> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        minHeight: 420,
        maxHeight: 550,
        borderRadius: BorderRadiusGeometry.lerp(
          const BorderRadius.only(
            topLeft: Radius.circular(28),
            topRight: Radius.circular(28),
          ),
          const BorderRadius.only(
            topLeft: Radius.circular(28),
            topRight: Radius.circular(28),
          ),
          1,
        ),
        panel: HomeMainPanel(),
        body: HomeBodyPanel(),
      ),
    );
  }
}

class HomeBodyPanel extends StatelessWidget {
  HomeBodyPanel({super.key});

  final profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return profileController.obx((state) {
        return Container(
          color: const Color(0xFF334155),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  const SizedBox(width: 12),
                   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Halo,",
                        style: TextStyle(
                            color: Color(0xFF94A3B8),
                            fontSize: 11,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 8,),
                      Text(
                        state?.name ?? "",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 50),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Limit Transaksi Tersisa',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "IDR ${state?.limitCredit ?? 0},-",
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Get.theme.primaryColor),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      }
    );
  }
}

class HomeMainPanel extends StatelessWidget {
  HomeMainPanel({super.key});

  final dashboardController = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'Transaksi Terkini',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 20),
          dashboardController.obx((state) {
              return ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state?.length ?? 0,
                itemBuilder: (context, index) {
                  return TransactionItem(
                    logo: Image.asset('assets/images/logo-transaction.png'),
                    title: dashboardController.userId.value != state![index].senderId ? state[index].sender!.name! : state[index].receiver!.name!,
                    date: DateFormat.yMMM().format(state[index].createdAt),
                    amount: "${state[index].amount / 1000}k",
                    amountColor: dashboardController.userId.value != state[index].senderId ? const Color(0xFF10B981) : Colors.redAccent,
                  );
                },
              );
            },
            onEmpty: Container(),
          ),
        ],
      ),
    );
  }
}
