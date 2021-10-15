import 'package:seed_flutter_app/core/models/user_profile.dart';

abstract class IProfileRepository {
  Future saveUserProfile(UserProfile userProfile);
}
