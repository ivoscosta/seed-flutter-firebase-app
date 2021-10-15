import 'package:firebase_auth/firebase_auth.dart';
import 'package:seed_flutter_app/core/models/user_profile.dart';

abstract class IAuthRepository {
  Future<User?> signIn(String email, String password);
  Future<UserProfile?> getUserProfile(String uid);
  Future sendPasswordResetEmail(String? email);
  Future<UserCredential> createUserWithEmailAndPassword(
      String email, String password);
}
