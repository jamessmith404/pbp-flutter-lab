import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:counter_7/models.dart';
import 'package:counter_7/drawer.dart';

class BudgetList extends StatefulWidget {
  const BudgetList({super.key});

  @override
  State<BudgetList> createState() => _BudgetListState();
}

class _BudgetListState extends State<BudgetList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: const Text('Form Budget'),
      ),
      drawer: const LabDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<BudgetModel>(builder: (context, value, child) {
          return ListView.builder( // Scrolling Widget
            itemCount: value.budgets.length, // banyak barang di List
            itemBuilder: ((context, index) {
              var item = value.budgets[index];

              return Card(
                elevation: 0,
                color: Theme.of(context).colorScheme.surfaceVariant,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.title, style: const TextStyle(fontSize: 24)),
                      const SizedBox(
                        width: 300,
                        height: 60,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(item.nominal.toString()),
                          Text(item.kind),
                        ],),
                    ],
                  ),
                ),
              );
            }),
          );
        }),
      )
    );
  }
}