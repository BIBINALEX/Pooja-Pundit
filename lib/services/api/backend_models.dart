import '../../models/pooja_request.dart';

class Pandit {
  const Pandit({
    required this.id,
    required this.userId,
    required this.name,
    required this.specialization,
    required this.isOnline,
    this.lastSeenAt,
  });

  final int id;
  final String userId;
  final String name;
  final String specialization;
  final bool isOnline;
  final String? lastSeenAt;

  factory Pandit.fromJson(Map<String, dynamic> json) => Pandit(
    id: _int(json['id']),
    userId: '${json['userId'] ?? ''}',
    name: '${json['name'] ?? ''}',
    specialization: '${json['specialization'] ?? ''}',
    isOnline: json['isOnline'] == true,
    lastSeenAt: json['lastSeenAt']?.toString(),
  );
}

class User {
  const User({
    required this.id,
    required this.firebaseUid,
    this.email,
    this.displayName,
    this.photoUrl,
    required this.role,
  });

  final String id;
  final String firebaseUid;
  final String? email;
  final String? displayName;
  final String? photoUrl;
  final String role;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: '${json['id'] ?? ''}',
    firebaseUid: '${json['firebaseUid'] ?? ''}',
    email: json['email']?.toString(),
    displayName: json['displayName']?.toString(),
    photoUrl: json['photoUrl']?.toString(),
    role: '${json['role'] ?? 'user'}',
  );
}

class PanditSignInResult {
  const PanditSignInResult({required this.user, required this.pandit});

  final User user;
  final Pandit pandit;
}

PoojaRequest bookingFromJson(Object? value) {
  final map = value is Map
      ? Map<String, dynamic>.from(value)
      : <String, dynamic>{};
  return PoojaRequest.fromJson(map);
}

Map<String, dynamic> jsonMap(Object? value) =>
    value is Map ? Map<String, dynamic>.from(value) : <String, dynamic>{};

int _int(Object? value) =>
    value is num ? value.toInt() : int.tryParse('$value') ?? 0;
