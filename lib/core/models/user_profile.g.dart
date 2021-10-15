// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  return UserProfile(
    id: json['id'] as String?,
    name: json['name'] as String?,
    nameSearch: json['nameSearch'] as String?,
    email: json['email'] as String?,
    phoneNumber: json['phoneNumber'] as String?,
    avatarUrl: json['avatarUrl'] as String?,
    avatarStoragePath: json['avatarStoragePath'] as String?,
    description: json['description'] as String?,
    lastAccess: json['lastAccess'],
    isAdmin: json['isAdmin'] as bool?,
    createdAt: json['createdAt'],
    fcmTokens:
        (json['fcmTokens'] as List<dynamic>?)?.map((e) => e as String).toList(),
    updatedAt: json['updatedAt'],
  );
}

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nameSearch': instance.nameSearch,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'avatarUrl': instance.avatarUrl,
      'avatarStoragePath': instance.avatarStoragePath,
      'fcmTokens': instance.fcmTokens,
      'description': instance.description,
      'isAdmin': instance.isAdmin,
      'lastAccess': instance.lastAccess,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
