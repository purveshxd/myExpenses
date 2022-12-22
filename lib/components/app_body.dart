import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:myexpenses/widgets/custom_list_tile.dart';
import 'package:myexpenses/widgets/expence_card.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({
    Key? key,
    required this.expensesList,
    required this.totalExpense,
    required this.totalIncome,
    required this.onSlide,
  }) : super(key: key);
  final List expensesList;
  final String totalExpense;
  final String totalIncome;
  final void Function(int) onSlide;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Column(
      // shrinkWrap: true,
      children: [
        // Text(FirebaseAuth.instance.currentUser!.displayName.toString()),
        SizedBox(
            height: height / 4,
            // flex: 1,
            child: ExpenceCard(
                totalExpense: totalExpense, totalIncome: totalIncome)),
        const Text(
          "All Transactions",
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
                child: Slidable(
                  endActionPane: ActionPane(
                    closeThreshold: .5,
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        borderRadius: BorderRadius.circular(15),
                        icon: Icons.delete_rounded,
                        onPressed: (context) {
                          onSlide(index);
                        },
                        backgroundColor: Colors.red,
                      )
                    ],
                  ),
                  child: CustomListTile(
                    expenseTitle: expensesList.elementAt(index)[0],
                    expenseDate: expensesList.elementAt(index)[1],
                    expenseAmt: expensesList.elementAt(index)[2],
                    isExpense: expensesList.elementAt(index)[3],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
