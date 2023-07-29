import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scan2pay/widgets/widgets.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../dashboard.dart';

class HistoryScreen extends GetView<DashboardController> {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        minHeight: 570,
        maxHeight: 570,
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
        panel: const HistoryMainPanel(),
        body: const HistoryBodyPanel(),
      ),
    );
  }
}

class HistoryMainPanel extends StatelessWidget {
  const HistoryMainPanel({super.key});

  @override
  Widget build(BuildContext context) {
    List<Tab> myTab = const [
      Tab(
        child: Text('Pembelian',
            style: TextStyle(
              color: Color(0xFF49454F),
              fontSize: 14,
              fontWeight: FontWeight.w700,
            )),
      ),
      Tab(
        child: Text('Tagihan',
            style: TextStyle(
              color: Color(0xFF49454F),
              fontSize: 14,
              fontWeight: FontWeight.w700,
            )),
      ),
    ];

    return DefaultTabController(
      length: myTab.length,
      child: Scaffold(
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(28),
              topRight: Radius.circular(28),
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(9),
            child: Container(
              height: 65,
              padding: const EdgeInsets.only(
                bottom: 16,
                left: 16,
                right: 16,
              ),
              child: TabBar(
                tabs: myTab,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Get.theme.primaryColor,
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return TransactionItem(
                      logo: Image.asset(
                        'assets/images/logo-transaction.png',
                        width: 56,
                        height: 56,
                      ),
                      title: 'Warteg Malabar',
                      date: '28 Juli',
                      amount: '40k',
                      amountColor: const Color(0xFFEF4444),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return TransactionItem(
                      logo: Image.asset(
                        'assets/images/logo-transaction.png',
                        width: 56,
                        height: 56,
                      ),
                      title: 'Warteg Malabar',
                      date: '28 Juli',
                      amount: '40k',
                      amountColor: const Color(0xFF10B981),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class HistoryBodyPanel extends StatelessWidget {
  const HistoryBodyPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF334155),
      padding: const EdgeInsets.only(
        left: 16,
        top: 60,
      ),
      child: const Text(
        'Riwayat Transaksi',
        style: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
