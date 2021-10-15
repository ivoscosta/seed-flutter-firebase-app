import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:seed_flutter_app/core/models/user_profile.dart';

import 'auth_repository_interface.dart';

class AuthRepository implements IAuthRepository {
  @override
  Future<User?> signIn(String email, String password) async {
    User? user;
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      user = value.user;
    }).onError((FirebaseAuthException error, stackTrace) {
      throw error.code;
    });
    return user;
  }

  @override
  Future<UserProfile?> getUserProfile(String uid) async {
    UserProfile? userProfile;
    await FirebaseFirestore.instance.doc('users/$uid').get().then((value) {
      if (value.exists) {
        userProfile = UserProfile.fromJson(value.data()!);
        userProfile!.id = value.id;
      }
    }).onError((FirebaseAuthException error, stackTrace) {
      throw error.code;
    });
    return userProfile;
  }

  @override
  Future sendPasswordResetEmail(String? email) async {
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: email ?? '')
        .onError((FirebaseAuthException error, stackTrace) {
      throw error.code;
    });
  }

  @override
  Future<UserCredential> createUserWithEmailAndPassword(
      String email, String password) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .onError((FirebaseAuthException error, stackTrace) {
      throw error.code;
    });
    return userCredential;
  }

  // @override
  // Future createUserProfile(UserProfile userProfile) async {

  // }
}
