import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mypersonalnotes/Constants/dialogs.dart' as dialogs;

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
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1488F2), Color(0xFF7B2FF7), Color(0xFFFF3CAC)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Container(
              width: 400,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.92),
                borderRadius: BorderRadius.circular(28),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.18),
                    blurRadius: 25,
                    offset: const Offset(0, 12),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Please verify your mail'),
                  TextButton(
                    onPressed: () async {
                      try {
                        final user = FirebaseAuth.instance.currentUser;

                        if (user == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('No logged in user found'),
                            ),
                          );
                          return;
                        }

                        await user.reload();

                        if (user != null && !user.emailVerified) {
                          final ver = user.sendEmailVerification();
                          ver.onError(
                            (error) {
                                  dialogs.showErrorDialog(
                                    context,
                                    'Error',
                                    'An error occurred while sending the verification email. Please try again later.',
                                  );
                                }
                                as FutureOr<void> Function(
                                  Object error,
                                  StackTrace stackTrace,
                                ),
                          );
                          ver.then((value) {
                            dialogs.showInfoDialog(
                              context,
                              'Verification Email Sent',
                              'A verification email has been sent to your email address. Please check your inbox and follow the instructions to verify your email.',
                            );
                          });
                        } else {
                          dialogs.showInfoDialog(
                            context,
                            'Email Already Verified',
                            'Your email address is already verified.',
                          );
                        }
                      } catch (e) {
                        dialogs.showErrorDialog(
                          context,
                          'Error',
                          'An error occurred while sending the verification email. Please try again later.',
                        );
                      }
                    },
                    child: const Text('Resend Email'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
