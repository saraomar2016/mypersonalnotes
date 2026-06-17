import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerifymailScreen extends StatefulWidget {
  const VerifymailScreen({super.key});

  @override
  State<VerifymailScreen> createState() => _VerifymailScreenState();
}

class _VerifymailScreenState extends State<VerifymailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1488F2), Color(0xFF7B2FF7), Color(0xFFFF3CAC)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                Text('Please verify your mail'),
                TextButton(
                  onPressed: () {
                    final user = FirebaseAuth.instance.currentUser;
                    user?.sendEmailVerification();
                  },
                  child: const Text('Resend Email'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
