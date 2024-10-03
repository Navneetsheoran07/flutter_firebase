import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../ViewModels/UserViewModel.dart';
import '../model/MyData.dart';
import 'DataListScreen.dart';


class MyDataScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _valueController,
              decoration: InputDecoration(labelText: 'Value'),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: () async {
                final id = DateTime.now().millisecondsSinceEpoch.toString();
                final name = _nameController.text;
                final value = int.tryParse(_valueController.text) ?? 0;
                final data = MyData(id: id, name: name, value: value);

                await Provider.of<MyDataViewModel>(context, listen: false).addData(data);

                // Show toast notification
                Fluttertoast.showToast(
                  msg: "Data added successfully",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );

                // Clear text fields
                _nameController.clear();
                _valueController.clear();
              },
              child: Text('Add Data'),
            ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DataListScreen()),
            );
          },
          child: Text('Show Data'),),
          ],
        ),
      ),
    );
  }
}
