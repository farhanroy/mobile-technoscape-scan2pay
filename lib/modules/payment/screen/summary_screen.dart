import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../modules.dart';

class SummaryScreen extends GetView<SummaryController> {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        minHeight: 610,
        maxHeight: 610,
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
        panel: const SummaryMainPanel(),
        body: const SummaryBodyPanel(),
      ),
    );
  }
}

class SummaryMainPanel extends StatelessWidget {
  const SummaryMainPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class SummaryBodyPanel extends StatelessWidget {
  const SummaryBodyPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
