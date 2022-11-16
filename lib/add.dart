import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:counter_7/models.dart';
import 'package:counter_7/drawer.dart';

class AddBudget extends StatefulWidget {
  const AddBudget({super.key});

  @override
  State<AddBudget> createState() => _AddBudgetState();
}

class _AddBudgetState extends State<AddBudget> {
  List<String> listKind = [
    "Pemasukan",
    "Pengeluaran"
  ];
  final _formKey = GlobalKey<FormState>();
  String title = "";
  int nominal = 0;
  String? kind;

  void submitForm(BuildContext context) {
    if(!_formKey.currentState!.validate()) {
      return;
    }

    final newBudget = Budget(title, nominal, kind!);
    Provider.of<BudgetModel>(context, listen: false).add(newBudget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Budget'),
      ),
      drawer: const LabDrawer(),
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
                // Menggunakan padding sebesar 8 pixels
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Contoh: Ngopi Cantik",
                    labelText: "Judul",
                    // Menambahkan icon agar lebih intuitif
                    icon: const Icon(Icons.title),
                    // Menambahkan circular border agar lebih rapi
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  // Menambahkan behavior saat nama diketik 
                  onChanged: (String? value) {
                    setState(() {
                        title = value!;
                    });
                  },
                  // Menambahkan behavior saat data disimpan
                  onSaved: (String? value) {
                    setState(() {
                        title = value!;
                    });
                  },
                  // Validator sebagai validasi form
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                        return 'Nama lengkap tidak boleh kosong!';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 16,),
              Padding(
                // Menggunakan padding sebesar 8 pixels
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Contoh: 69420",
                    labelText: "Nominal",
                    // Menambahkan icon agar lebih intuitif
                    icon: const Icon(Icons.title),
                    // Menambahkan circular border agar lebih rapi
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  // Menambahkan behavior saat nama diketik 
                  onChanged: (String? value) {
                    setState(() {
                        nominal = int.parse(value!);
                    });
                  },
                  // Menambahkan behavior saat data disimpan
                  onSaved: (String? value) {
                    setState(() {
                        nominal = int.parse(value!);
                    });
                  },
                  // Validator sebagai validasi form
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Nilai tidak boleh kosong!';
                    } else if (int.tryParse(value) == null) {
                      return 'Nilai harus valid!';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 16,),
              DropdownButtonFormField(
                value: kind,
                icon: const Icon(Icons.arrow_drop_down),
                hint: const Text("Pilih jenis"),
                items: listKind.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    kind = newValue!;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Pilih salah satu jenis!";
                  }

                  return null;
                },
              ),
              const Spacer(), // Beri jarak dengan Button
              TextButton(
                onPressed: () => submitForm(context),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    foregroundColor: MaterialStateProperty.all(Colors.white)),
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("Simpan"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}