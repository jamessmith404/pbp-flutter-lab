import 'dart:collection';

import 'package:flutter/material.dart';

class Budget {
  const Budget(this.title, this.nominal, this.kind);

  final String title, kind;
  final int nominal;
}

class BudgetModel extends ChangeNotifier {
  final List<Budget> _budgets = []; // using List data type

  // An unmodifiable view of the items in the cart.
  UnmodifiableListView<Budget> get budgets => UnmodifiableListView(_budgets);

  void add(Budget budget) {
    _budgets.add(budget);
  }
}