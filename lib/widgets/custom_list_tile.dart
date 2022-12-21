import 'package:flutter/material.dart';
import 'package:myexpenses/widgets/in_out_expense.dart';


class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
    required this.expenseTitle,
    required this.expenseDate,
    required this.expenseAmt,
    required this.isExpense,
  }) : super(key: key);
  final String expenseTitle;
  final String expenseDate;
  final int expenseAmt;
  final bool isExpense;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey.shade100,
      ),
      height: 70,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InOutExpenceWidget(isExpense: isExpense),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    expenseTitle,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    expenseDate,
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "₹$expenseAmt",
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


// ListTile(
//       leading: const SizedBox(
//         child: InOutExpenceWidget(isExpense: true),
//       ),
//       title: const Text(
//         "Expenses 1",
//         style: TextStyle(fontWeight: FontWeight.bold),
//       ),
//       subtitle: Text(
//         'Your description about the expense',
//         style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
//       ),
//     );