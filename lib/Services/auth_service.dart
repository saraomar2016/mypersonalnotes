import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential?> signInWithGoogle() async {
    try {
      await GoogleSignIn.instance.initialize();

      final googleUser = await GoogleSignIn.instance.authenticate();
      final googleAuth = googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );
      return await _firebaseAuth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw Exception('Firebase auth failed: ${e.message}');
    } on GoogleSignInException catch (e) {
      throw Exception('Google sign in failed: ${e.description}');
    } catch (e) {
      throw Exception('Unexpected sign in error: $e');
    }
  }

  Future<void> signOut() async {
    await GoogleSignIn.instance.signOut();
    await _firebaseAuth.signOut();
  }
}
