import 'package:b2clients_for_clients/router/router.dart';
import 'package:flutter/material.dart';

class BusinessToClientsForClientsApp extends StatelessWidget {
  const BusinessToClientsForClientsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Business To Clients for Clients',

      routes: routes,
      // initialRoute: '',
      // home: const MainPage(),
    );
  }
}
