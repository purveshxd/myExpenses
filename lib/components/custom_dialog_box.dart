import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myexpenses/widgets/in_out_expense.dart';
import 'package:myexpenses/widgets/input_text_field.dart';

Dialog CustomDialogBox(
    {required TextEditingController expenseTitle,
    required TextEditingController expenseAmt,
    required ValueListenable<Object?> isExpense,
    required}) {
  return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 30),
      child: SizedBox(
        height: 300,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 10.0, top: 5),
                child: Text(
                  "Add Transaction",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // TextField to exter expense title
              InputTextField(
                  obscureText: false,
                  hintText: "Enter Title",
                  textController: expenseTitle,
                  textInputType: TextInputType.text),
              const SizedBox(height: 15),
              // TextField to enter expense amount
              InputTextField(
                  obscureText: false,
                  hintText: "Enter Amount",
                  textController: expenseAmt,
                  textInputType: TextInputType.number),
              const SizedBox(height: 15),
              // Switch button for expense or income selection
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const InOutExpenceWidget(isExpense: false),
                    const Text("Income"),
                    // ValueListenableBuilder(
                    //   valueListenable: isExpense,
                    //   builder: (context, currState, child) {
                    //     return Switch(
                    //       value: currState,
                    //       onChanged: (val) {
                    //         isExpense.value = val;
                    //       },
                    //     );
                    //   },
                    // ),
                    //

                    const Text("Expense"),
                    const InOutExpenceWidget(isExpense: true)
                  ],
                ),
              ),
              const SizedBox(height: 15),
              // Button to show date picker
              MaterialButton(
                height: 55,
                onPressed: () {
                  // showTransactionDatePicker;
                },
                // onPressed: showTransactionDatePicker,
                color: Colors.grey.shade100,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Enter Date",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Container(
                      color: Colors.white,
                      width: 2,
                      height: 55,
                    ),
                    const Spacer(),
                    Text(
                      DateFormat.MMMEd().format(
                        DateTime.now(),
                      ),
                      style: const TextStyle(fontSize: 15),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              const SizedBox(height: 15),

              // Button to add the transaction to the list in home page
              MaterialButton(
                height: 50,
                elevation: 0,
                color: Colors.amber,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                // onPressed: addTransaction,
                onPressed: () {},
                child: const Text(
                  "Add",
                  style: TextStyle(fontSize: 18),
                ),
              )
            ],
          ),
        ),
      ));
}
