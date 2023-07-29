import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem(
      {super.key,
      required this.logo,
      required this.title,
      required this.date,
      required this.amount});

  final Image logo;
  final String title, date, amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.only(
        left: 12,
        top: 8,
        bottom: 8,
        right: 24,
      ),
      height: 72,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: const Color(0xFFCBD5E1),
          width: 2.0,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: logo,
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                    color: Color(0xFF0F172A),
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                date,
                style: const TextStyle(
                    color: Color(0xFF49454F),
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          const Spacer(),
          Text(
            amount,
            style: const TextStyle(
                color: Color(0xFF10B981),
                fontSize: 11,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
