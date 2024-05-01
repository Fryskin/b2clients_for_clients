import 'package:b2clients_for_clients/features/main_page/utils/utils.dart';
import 'package:b2clients_for_clients/features/main_page/view/create_order/create_order_page.dart';
import 'package:b2clients_for_clients/features/main_page/widgets/view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  Utils utils = Utils();
  String userUID = FirebaseAuth.instance.currentUser!.uid;
  // document IDs
  List<String> documentIDs = [];

  // get document IDs
  Future getDocumentIDs() async {
    await FirebaseFirestore.instance
        .collection('orders')
        .where('uid', isEqualTo: userUID)
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              print(document.reference.id);
              documentIDs.add(document.reference.id);
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 245, 248),
      appBar: AppBar(
        title: const Text('Guga'),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: getDocumentIDs(),
                builder: (context, snapshot) {
                  return ListView.builder(
                      itemCount: documentIDs.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: GetOrderDataWidget(
                                  documentID: documentIDs[index],
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Card(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const CreateOrderPage(
                                          serviceType: {
                                            'tiling_work': false,
                                            'floor_repair': true
                                          },
                                        )),
                              );
                            },
                            child: const Text('FLOOR REPAIR'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const CreateOrderPage(
                                          serviceType: {
                                            'tiling_work': true,
                                            'floor_repair': false
                                          },
                                        )),
                              );
                            },
                            child: const Text('TILING WORK'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
