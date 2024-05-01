import 'package:b2clients_for_clients/business_to_clients_for_clients_app.dart';
import 'package:b2clients_for_clients/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    name: 'Biss To Cli For Cli',
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const BusinessToClientsForClientsApp());
}
