
import 'package:flutter/material.dart';
import 'package:myexpenses/widgets/custom_list_tile.dart';
import 'package:myexpenses/widgets/expence_card.dart';


class BodyWidget extends StatelessWidget {
  const BodyWidget({
    Key? key,
    required this.expensesList,
    required this.totalExpense,
    required this.totalIncome,
  }) : super(key: key);
  final List expensesList;

  final String totalExpense;
  final String totalIncome;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Column(
      // shrinkWrap: true,
      children: [
        SizedBox(
            height: height / 4,
            // flex: 1,
            child: ExpenceCard(
                totalExpense: totalExpense, totalIncome: totalIncome)),
        const Text(
          "All Expenses",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: height / 2,
          // flex: 3,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: expensesList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomListTile(
                  expenseTitle: expensesList.elementAt(index)[0],
                  expenseDate: expensesList.elementAt(index)[1],
                  expenseAmt: expensesList.elementAt(index)[2],
                  isExpense: expensesList.elementAt(index)[3],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
