import 'package:json_annotation/json_annotation.dart';

part 'user_profile.g.dart';

@JsonSerializable(explicitToJson: true)
class UserProfile {
  String? id;
  String? name;
  String? nameSearch;
  String? email;
  String? phoneNumber;
  String? avatarUrl;
  String? avatarStoragePath;
  List<String>? fcmTokens;
  String? description;
  bool? isAdmin;
  Object? lastAccess;
  Object? createdAt;
  Object? updatedAt;

  UserProfile({
    this.id,
    this.name,
    this.nameSearch,
    this.email,
    this.phoneNumber,
    this.avatarUrl,
    this.avatarStoragePath,
    this.description,
    this.lastAccess,
    this.isAdmin,
    this.createdAt,
    this.fcmTokens,
    this.updatedAt,
  });
  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
  Map<String, dynamic>? toJson() => _$UserProfileToJson(this);
}
