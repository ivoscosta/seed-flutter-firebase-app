import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:seed_flutter_app/app/modules/profile/repositories/profile_repository_interface.dart';
import 'package:seed_flutter_app/core/models/user_profile.dart';

class ProfileRepository implements IProfileRepository {
  @override
  Future saveUserProfile(UserProfile userProfile) async {
    var _firestore = FirebaseFirestore.instance;
    Map<String, dynamic>? user = userProfile.toJson();

    _firestore
        .runTransaction((transaction) async {
          var userRef = _firestore.collection('users').doc(userProfile.id);
          var userProfileSaved = await userRef.get();

          //atualizando o usuário, cria caso não exista
          transaction.set(userRef, user, SetOptions(merge: true));

          if (!userProfileSaved.exists) {
            //atualizando o contador de usuários em system
            var systemRef = _firestore.doc('system/configs');
            transaction.set(
                systemRef,
                {'usersCounter': FieldValue.increment(1)},
                SetOptions(merge: true));
          }
        })
        .then((value) => value)
        .catchError((e) {
          print("Transaction failed: " + e.toString());
        });
  }
}
