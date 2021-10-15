import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Routers {
  static goToSignIn(BuildContext context) {
    if (FirebaseAuth.instance.currentUser == null)
      return Navigator.pushNamed(context, '/auth');
    else
      goToEditProfile(context);
  }

  static goToSignUp(BuildContext context) {
    return Navigator.pushNamed(context, '/auth/signup');
  }

  static goToForgotPassword(BuildContext context, String email) {
    return Navigator.pushNamed(context, '/auth/forgot_password',
        arguments: email);
  }

  static goToEditProfile(BuildContext context) {
    return Navigator.pushNamed(context, '/profile/edit');
  }

  static goToSearch(BuildContext context) {
    return Navigator.pushNamed(context, '/search');
  }
}
