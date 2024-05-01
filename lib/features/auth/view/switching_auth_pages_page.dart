import 'package:b2clients_for_clients/features/auth/auth.dart';

import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  // INITIAL PAGE STATES
  bool showLoginPage = true;
  bool showLoginPage2 = true;
  bool showRegisterPage = false;
  bool showUpdatePasswordPage = false;

// METHOD FOR SWITCHING LOGIN AND REGISTER PAGES STATES
  void toggleScreensLoginAndRegister() {
    setState(() {
      showLoginPage = !showLoginPage;
      showRegisterPage = !showRegisterPage;
    });
  }

// METHOD FOR SWITCHING LOGIN AND UPDATE_PASSWORD PAGES STATES
  void toggleScreensLoginAndUpdatePassword() {
    setState(() {
      showLoginPage2 = !showLoginPage2;
      showUpdatePasswordPage = !showUpdatePasswordPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    // CONDITION FOR LOGIN PAGE
    if (showLoginPage && !showRegisterPage && !showUpdatePasswordPage) {
      return LoginPage(
        showRegisterPage: toggleScreensLoginAndRegister,
        showUpdatePasswordPage: toggleScreensLoginAndUpdatePassword,
      );
    }
    // CONDITION FOR REGISTER PAGE
    if (!showLoginPage && showRegisterPage) {
      return RegisterPage(
        showLoginPage: toggleScreensLoginAndRegister,
      );
    }
    // CONDITION FOR UPDATE PASSWORD PAGE
    if (!showLoginPage2 && showUpdatePasswordPage) {
      return UpdatePasswordPage(
        showLoginPage2: toggleScreensLoginAndUpdatePassword,
      );
    }
    // CONDITIONS FOR LOGIN PAGE
    if (showLoginPage2 && !showUpdatePasswordPage) {
      return LoginPage(
        showRegisterPage: toggleScreensLoginAndRegister,
        showUpdatePasswordPage: toggleScreensLoginAndUpdatePassword,
      );
    } else {
      return LoginPage(
        showRegisterPage: toggleScreensLoginAndRegister,
        showUpdatePasswordPage: toggleScreensLoginAndUpdatePassword,
      );
    }
  }
}
