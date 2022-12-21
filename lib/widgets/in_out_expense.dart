import 'package:flutter/material.dart';

class InOutExpenceWidget extends StatelessWidget {
  const InOutExpenceWidget({
    Key? key,
    required this.isExpense,
  }) : super(key: key);

  final bool isExpense;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isExpense ? Colors.red.shade200 : Colors.green.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Icon(
          isExpense ? Icons.arrow_upward_rounded : Icons.arrow_downward_rounded,
          color: isExpense ? Colors.red.shade700 : Colors.green.shade700,
        ),
      ),
    );
  }
}
