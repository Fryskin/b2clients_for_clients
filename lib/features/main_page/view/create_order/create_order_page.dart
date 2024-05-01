import 'package:b2clients_for_clients/features/entrance/entrance.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CreateOrderPage extends StatefulWidget {
  final dynamic serviceType;
  const CreateOrderPage({super.key, required this.serviceType});

  @override
  State<CreateOrderPage> createState() => _CreateOrderPageState();
}

class _CreateOrderPageState extends State<CreateOrderPage> {
  final _titleController = TextEditingController();
  final _priceController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _priceController.dispose();

    super.dispose();
  }

  // get user account document ID
  Future getDocumentId() async {
    String userUID = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance.collection('orders').add({
      'uid': userUID,
      'title': _titleController.text.trim(),
      'price': int.parse(_priceController.text),
      'serviceTypes': widget.serviceType,
    });
    _titleController.clear();
    _priceController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            TextFormField(
              controller: _titleController,
              maxLength: 20,
              decoration: InputDecoration(
                labelText: 'Tiltle',
                // helperText: 'Helper text',
              ),
            ),
            TextFormField(
                controller: _priceController,
                maxLength: 20,
                decoration: const InputDecoration(
                  labelText: 'Price',
                  // helperText: 'Helper text',
                )),
            SizedBox(
              width: 500.0,
              height: 48,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: ElevatedButton(
                  onPressed: () {
                    getDocumentId();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EntrancePage()),
                    );
                  },
                  style: const ButtonStyle(
                      padding: MaterialStatePropertyAll<EdgeInsets>(
                          EdgeInsets.all(20)),
                      backgroundColor: MaterialStatePropertyAll<Color>(
                          Color.fromARGB(255, 53, 100, 92))),
                  child: const Text(
                    'Create',
                    style: TextStyle(
                      color: Color.fromARGB(255, 232, 218, 174),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
