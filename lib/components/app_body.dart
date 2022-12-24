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
      children: [
        SizedBox(
          height: height / 4,
          child:
              ExpenceCard(totalExpense: totalExpense, totalIncome: totalIncome),
        ),
        SizedBox(
          height: height - (height / 4),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "All Transactions",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                // height: height,
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
              ),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        )
      ],
    );
  }
}
