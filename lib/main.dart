import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mypersonalnotes/Screens/login_screen.dart';
import 'package:mypersonalnotes/Screens/splash_screen.dart';
import 'package:mypersonalnotes/Screens/verifymail_screen.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

late final Future<FirebaseApp> _firebaseInitialization;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  _firebaseInitialization = _initializeFirebase();
  runApp(const MyApp());
}

Future<FirebaseApp> _initializeFirebase() async {
  if (Firebase.apps.isNotEmpty) {
    return Firebase.app();
  }

  try {
    return await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } on FirebaseException catch (error) {
    if (error.code == 'duplicate-app') {
      return Firebase.app();
    }

    rethrow;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Personl Notes',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: FutureBuilder<FirebaseApp>(
        future: _firebaseInitialization,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              !snapshot.hasError) {
            final user = FirebaseAuth.instance.currentUser;
            if (user?.emailVerified ?? false) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const VerifymailScreen(),
                ),
              );
            }
            return const LoginScreen();
          }

          if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text(
                    'Firebase failed to start:\n${snapshot.error}',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          }

          return const Scaffold(body: Center(child: SplashScreen()));
        },
      ),
    );
  }
}
