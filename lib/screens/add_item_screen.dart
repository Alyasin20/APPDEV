import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../database/inventory_database.dart';
import '../models/item_model.dart';

class AddItemScreen extends StatefulWidget {
  @override
  _AddItemScreenState createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final _nameController = TextEditingController();
  DateTime? _selectedDate;

  Future<void> _addItem() async {
    if (_nameController.text.isEmpty || _selectedDate == null) return;

    final item = Item(
      name: _nameController.text,
      expiryDate: DateFormat('yyyy-MM-dd').format(_selectedDate!),
    );
    await InventoryDatabase.instance.insertItem(item);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Item')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Item Name'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                );
                setState(() => _selectedDate = date);
              },
              child: Text(
                _selectedDate == null
                    ? 'Select Expiry Date'
                    : 'Expiry Date: ${DateFormat('yyyy-MM-dd').format(_selectedDate!)}',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addItem,
              child: Text('Add Item'),
            ),
          ],
        ),
      ),
    );
  }
}
