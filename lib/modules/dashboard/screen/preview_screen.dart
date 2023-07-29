import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../widgets/widgets.dart';
import '../dashboard.dart';

class PreviewScreen extends GetView<PreviewController> {
  const PreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        minHeight: 420,
        maxHeight: 510,
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
        panel: const PreviewMainPanel(),
        body: const PreviewBodyPanel(),
      ),
    );
  }
}

class PreviewMainPanel extends StatelessWidget {
  const PreviewMainPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Tagihan',
            style: TextStyle(
              color: Color(0xFF0F172A),
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 18,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: const Color(0xFFCBD5E1),
                width: 1,
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFEF08A),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Icon(
                        Icons.warning_rounded,
                        color: Color(0xFFFACC15),
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'IDR 150.000,-',
                          style: TextStyle(
                            color: Color(0xFF0F172A),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Bayar sebelum tanggal 30 Juli',
                          style: TextStyle(
                            color: Color(0xFF64748B),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_vert_rounded,
                        color: Color(0xFF64748B),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color(0xFFCBD5E1),
                        width: 1,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                CommonButton(
                  titleColor: const Color(0xFF334155),
                  color: Get.theme.primaryColor,
                  title: 'Bayar',
                  onTap: () {},
                )
              ],
            ),
          ),
          const SizedBox(height: 28),
          const Text(
            'Eksplor Scan2Pay',
            style: TextStyle(
              color: Color(0xFF0F172A),
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 20),
          ExplorList(
            icon: const Icon(
              Icons.check_circle_rounded,
              color: Color(0xFF292D32),
            ),
            title: 'Trust Score',
            amount: '100',
            arrowTap: () {},
          ),
          const SizedBox(height: 14),
          ExplorList(
            icon: const Icon(
              Icons.payment_rounded,
              color: Color(0xFF292D32),
            ),
            title: 'Skema Tagihan',
            amount: 'Bulanan',
            arrowTap: () {},
          ),
        ],
      ),
    );
  }
}

class ExplorList extends StatelessWidget {
  const ExplorList({
    super.key,
    required this.icon,
    required this.title,
    required this.amount,
    required this.arrowTap,
  });

  final Icon icon;
  final String title, amount;
  final VoidCallback arrowTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFCBD5E1),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          icon,
          const SizedBox(width: 18),
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Text(
            amount,
            style: const TextStyle(
              color: Color(0xFF64748B),
              fontSize: 11,
              fontWeight: FontWeight.w400,
            ),
          ),
          IconButton(
            onPressed: arrowTap,
            icon: const Icon(Icons.arrow_forward_ios_rounded),
          )
        ],
      ),
    );
  }
}

class PreviewBodyPanel extends StatelessWidget {
  const PreviewBodyPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color(0xFF334155),
        padding: EdgeInsets.only(
          left: 16,
          top: 60,
          bottom: Get.height * 0.7,
        ),
        child: ListView.builder(
            shrinkWrap: false,
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: ((context, index) {
              return const CommonBanner(
                title: 'Scan2Pay',
                amount: 'IDR 1.000.000,-',
                totalAmount: 'IDR 1.000.000,-',
                limitAmount: 'IDR 1.000.000,-',
              );
            })));
  }
}
