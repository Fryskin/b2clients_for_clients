import 'package:b2clients_for_clients/features/auth/auth.dart';
import 'package:b2clients_for_clients/features/main_page/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EntrancePage extends StatelessWidget {
  const EntrancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // return const HomePage();
            return const MainHomePage();
          } else {
            return const AuthPage();
          }
        },
      ),
    );
  }
}
