import 'package:flutter/material.dart';
import 'package:myexpenses/widgets/in_out_expense.dart';


class ExpenceCard extends StatelessWidget {
  const ExpenceCard({
    Key? key,
    required this.totalExpense,
    required this.totalIncome,
  }) : super(key: key);

  final String totalExpense;
  final String totalIncome;

  @override
  Widget build(BuildContext context) {
    int balanceAmount = int.parse(totalIncome) - int.parse(totalExpense);
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Balance",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black38,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                // total balance left
                "₹$balanceAmount",
                style:
                    const TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  const InOutExpenceWidget(isExpense: true),
                  Text(
                    // expenses
                    "₹$totalExpense",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  const InOutExpenceWidget(
                    isExpense: false,
                  ),
                  Text(
                    // income
                    "₹$totalIncome",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
