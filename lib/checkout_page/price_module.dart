import 'package:flutter/material.dart';

class PriceModule extends StatelessWidget {
  final List<String> durations;
  final List<String> prices;

  const PriceModule({super.key, required this.durations, required this.prices});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        durations.length,
        (index) => Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(durations[index], style: const TextStyle(fontSize: 16)),
              Text(prices[index], style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentMethodButton extends StatelessWidget {
  final String text;
  final Color color;

  const PaymentMethodButton({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(text, style: const TextStyle(color: Colors.white)),
    );
  }
}