import 'package:counter_7/add.dart';
import 'package:counter_7/list.dart';
import 'package:counter_7/main.dart';
import 'package:flutter/material.dart';

class LabDrawer extends StatefulWidget {
  const LabDrawer({super.key});

  @override
  State<LabDrawer> createState() => _LabDrawerState();
}

class _LabDrawerState extends State<LabDrawer> {
  // root from drawer
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          ListTile(
            title: const Text("counter-7"),
            onTap: () {
              Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => const MyHomePage(title: "Program Counter"),
                ), 
              );
            },
          ),
          ListTile(
            title: const Text("Tambah Budget"),
            onTap: () {
              Navigator.push(
                context, MaterialPageRoute(builder: (context) => const AddBudget()),
              );
            },
          ),
          ListTile(
            title: const Text("Data Budget"),
            onTap: () {
              Navigator.push(
                context, MaterialPageRoute(builder: (context) => const BudgetList()),
              );
            },
          ),
        ]
      )
    );
  }

}