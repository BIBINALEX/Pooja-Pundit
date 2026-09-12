import 'package:intl/intl.dart';

enum BookingStatus {
  pending,
  offered,
  accepted,
  ongoing,
  rejected,
  expired,
  noPanditAvailable;

  static BookingStatus fromJson(Object? value) {
    final raw = value?.toString().trim();
    switch (raw) {
      case 'PENDING':
        return BookingStatus.pending;
      case 'OFFERED':
        return BookingStatus.offered;
      case 'ACCEPTED':
        return BookingStatus.accepted;
      case 'ONGOING':
        return BookingStatus.ongoing;
      case 'REJECTED':
        return BookingStatus.rejected;
      case 'EXPIRED':
        return BookingStatus.expired;
      case 'NO_PANDIT_AVAILABLE':
        return BookingStatus.noPanditAvailable;
      default:
        return BookingStatus.pending;
    }
  }

  @override
  String toString() {
    switch (this) {
      case BookingStatus.pending:
        return 'PENDING';
      case BookingStatus.offered:
        return 'OFFERED';
      case BookingStatus.accepted:
        return 'ACCEPTED';
      case BookingStatus.ongoing:
        return 'ONGOING';
      case BookingStatus.rejected:
        return 'REJECTED';
      case BookingStatus.expired:
        return 'EXPIRED';
      case BookingStatus.noPanditAvailable:
        return 'NO_PANDIT_AVAILABLE';
    }
  }
}

class TokenPair {
  const TokenPair({
    required this.accessToken,
    required this.refreshToken,
    this.expiresIn,
    this.tokenType = 'Bearer',
  });

  final String accessToken;
  final String refreshToken;
  final String? expiresIn;
  final String tokenType;

  factory TokenPair.fromJson(Map<String, dynamic> json) => TokenPair(
    accessToken: '${json['accessToken'] ?? ''}',
    refreshToken: '${json['refreshToken'] ?? ''}',
    expiresIn: json['expiresIn']?.toString(),
    tokenType: '${json['tokenType'] ?? 'Bearer'}',
  );
}

class Pandit {
  const Pandit({
    required this.id,
    required this.userId,
    required this.name,
    required this.specialization,
    required this.isOnline,
    this.lastSeenAt,
    this.dob,
    this.email,
    this.phone,
    this.gender,
    this.bio,
    this.language,
  });

  final int id;
  final String userId;
  final String name;
  final String specialization;
  final bool isOnline;
  final String? lastSeenAt;
  final String? dob;
  final String? email;
  final String? phone;
  final String? gender;
  final String? bio;
  final String? language;

  factory Pandit.fromJson(Map<String, dynamic> json) => Pandit(
    id: _int(json['id']),
    userId: '${json['userId'] ?? ''}',
    name: '${json['name'] ?? ''}',
    specialization: '${json['specialization'] ?? ''}',
    isOnline: json['isOnline'] == true,
    lastSeenAt: json['lastSeenAt']?.toString(),
    dob: json['dob']?.toString(),
    email: json['email']?.toString(),
    phone: json['phone']?.toString(),
    gender: json['gender']?.toString(),
    bio: json['bio']?.toString(),
    language: json['language']?.toString(),
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
    this.createdAt,
    this.updatedAt,
    this.phone,
    this.dob,
    this.gender,
    this.bio,
    this.language,
  });

  final String id;
  final String firebaseUid;
  final String? email;
  final String? displayName;
  final String? photoUrl;
  final String role;
  final String? createdAt;
  final String? updatedAt;
  final String? phone;
  final String? dob;
  final String? gender;
  final String? bio;
  final String? language;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: '${json['id'] ?? ''}',
    firebaseUid: '${json['firebaseUid'] ?? ''}',
    email: json['email']?.toString(),
    displayName: json['displayName']?.toString(),
    photoUrl: json['photoUrl']?.toString(),
    role: '${json['role'] ?? 'user'}',
    createdAt: json['createdAt']?.toString(),
    updatedAt: json['updatedAt']?.toString(),
    phone: json['phone']?.toString(),
    dob: json['dob']?.toString(),
    gender: json['gender']?.toString(),
    bio: json['bio']?.toString(),
    language: json['language']?.toString(),
  );
}

class UserRecord {
  const UserRecord({
    required this.id,
    required this.firebaseUid,
    this.email,
    this.displayName,
    this.photoUrl,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String firebaseUid;
  final String? email;
  final String? displayName;
  final String? photoUrl;
  final String role;
  final String createdAt;
  final String updatedAt;

  factory UserRecord.fromJson(Map<String, dynamic> json) => UserRecord(
    id: '${json['id'] ?? ''}',
    firebaseUid: '${json['firebaseUid'] ?? ''}',
    email: json['email']?.toString(),
    displayName: json['displayName']?.toString(),
    photoUrl: json['photoUrl']?.toString(),
    role: '${json['role'] ?? 'user'}',
    createdAt: json['createdAt']?.toString() ?? '',
    updatedAt: json['updatedAt']?.toString() ?? '',
  );
}

class BookingPandit {
  const BookingPandit({
    required this.id,
    required this.name,
    required this.specialization,
  });

  final int id;
  final String name;
  final String specialization;

  factory BookingPandit.fromJson(Map<String, dynamic> json) => BookingPandit(
    id: _int(json['id']),
    name: '${json['name'] ?? ''}',
    specialization: '${json['specialization'] ?? ''}',
  );
}

class Booking {
  const Booking({
    required this.id,
    required this.uid,
    required this.fullname,
    required this.dob,
    required this.birthStar,
    required this.diety,
    required this.service,
    required this.notes,
    required this.crowdPrayer,
    required this.status,
    required this.panditId,
    required this.offeredAt,
    required this.acceptedAt,
    required this.createdAt,
    required this.updatedAt,
    this.pandit,
  });

  final int id;
  final String uid;
  final String fullname;
  final String dob;
  final String birthStar;
  final String diety;
  final String service;
  final String notes;
  final bool crowdPrayer;
  final BookingStatus status;
  final int? panditId;
  final String? offeredAt;
  final String? acceptedAt;
  final String createdAt;
  final String updatedAt;
  final BookingPandit? pandit;

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
    id: _int(json['id']),
    uid: '${json['uid'] ?? 'guest'}',
    fullname: '${json['fullname'] ?? ''}',
    dob: '${json['dob'] ?? ''}',
    birthStar: '${json['birthStar'] ?? ''}',
    diety: '${json['diety'] ?? ''}',
    service: '${json['service'] ?? ''}',
    notes: '${json['notes'] ?? ''}',
    crowdPrayer: json['crowdPrayer'] == true,
    status: BookingStatus.fromJson(json['status']),
    panditId: json['panditId'] is num
        ? (json['panditId'] as num).toInt()
        : int.tryParse('${json['panditId']}'),
    offeredAt: json['offeredAt']?.toString(),
    acceptedAt: json['acceptedAt']?.toString(),
    createdAt: json['createdAt']?.toString() ?? '',
    updatedAt: json['updatedAt']?.toString() ?? '',
    pandit: json['pandit'] is Map
        ? BookingPandit.fromJson(jsonMap(json['pandit']))
        : null,
  );
}

class Diety {
  const Diety({
    required this.id,
    required this.did,
    required this.name,
    required this.description,
  });

  final int id;
  final String did;
  final String name;
  final String description;

  factory Diety.fromJson(Map<String, dynamic> json) => Diety(
    id: _int(json['id']),
    did: '${json['did'] ?? ''}',
    name: '${json['name'] ?? ''}',
    description: '${json['description'] ?? ''}',
  );
}

class ServiceItem {
  const ServiceItem({
    required this.id,
    required this.sid,
    required this.name,
    required this.description,
    required this.cost,
  });

  final int id;
  final String sid;
  final String name;
  final String description;
  final String cost;

  factory ServiceItem.fromJson(Map<String, dynamic> json) => ServiceItem(
    id: _int(json['id']),
    sid: '${json['sid'] ?? ''}',
    name: '${json['name'] ?? ''}',
    description: '${json['description'] ?? ''}',
    cost: '${json['cost'] ?? '0'}',
  );
}

class BirthStar {
  const BirthStar({required this.id, required this.star});

  final int id;
  final String star;

  factory BirthStar.fromJson(Map<String, dynamic> json) =>
      BirthStar(id: _int(json['id']), star: '${json['star'] ?? ''}');
}

class PanditSignInResult {
  const PanditSignInResult({
    required this.user,
    required this.pandit,
    required this.accessToken,
    this.refreshToken = '',
    this.expiresIn,
    this.tokenType = 'Bearer',
    this.profileComplete,
    this.missingFields = const [],
  });

  final User user;
  final Pandit? pandit;
  final String accessToken;
  final String refreshToken;
  final String? expiresIn;
  final String tokenType;
  final bool? profileComplete;
  final List<String> missingFields;

  bool get requiresProfileCompletion {
    if (profileComplete == false || missingFields.isNotEmpty) return true;
    if (pandit == null) return true;
    final values = [
      pandit!.name,
      pandit!.dob ?? user.dob,
      user.email ?? pandit!.email,
      user.phone ?? pandit!.phone,
      user.gender ?? pandit!.gender,
      user.bio ?? pandit!.bio,
      pandit!.specialization,
      user.language ?? pandit!.language,
    ];

    return values.any(_isMissingProfileValue);
  }

  factory PanditSignInResult.fromJson(Map<String, dynamic> json) {
    final tokenPair = TokenPair.fromJson(json);
    return PanditSignInResult(
      user: User.fromJson(jsonMap(json['user'])),
      pandit: json['pandit'] is Map
          ? Pandit.fromJson(jsonMap(json['pandit']))
          : null,
      accessToken: tokenPair.accessToken,
      refreshToken: tokenPair.refreshToken,
      expiresIn: tokenPair.expiresIn,
      tokenType: tokenPair.tokenType,
      profileComplete: json['profileComplete'] as bool?,
      missingFields: json['missingFields'] is List
          ? (json['missingFields'] as List)
                .map((field) => field.toString())
                .toList()
          : const [],
    );
  }
}

bool _isMissingProfileValue(Object? value) {
  if (value == null || value.toString().trim().isEmpty) return true;
  final normalized = value.toString().trim().toLowerCase();
  return normalized == 'unspecified' || normalized == '1900-01-01';
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

class PoojaRequest {
  const PoojaRequest({
    this.id,
    required this.fullname,
    required this.dob,
    required this.birthStar,
    required this.diety,
    required this.service,
    required this.notes,
    required this.crowdPrayer,
    this.uid,
    this.status = 'PENDING',
    this.panditId,
    this.offeredAt,
    this.acceptedAt,
    this.completedAt,
    this.createdAt,
    this.updatedAt,
    this.pandit,
  });

  final int? id;
  final String fullname;
  final DateTime dob;
  final String birthStar;
  final String diety;
  final String service;
  final String notes;
  final bool crowdPrayer;
  final String? uid;
  final String status;
  final int? panditId;
  final String? offeredAt;
  final String? acceptedAt;
  final String? completedAt;
  final String? createdAt;
  final String? updatedAt;
  final BookingPandit? pandit;

  String get formattedDob => DateFormat('dd MMM yyyy').format(dob);

  Map<String, dynamic> toJson() => {
    'fullname': fullname,
    'dob': DateFormat('yyyy-MM-dd').format(dob),
    'birthStar': birthStar,
    'diety': diety,
    'service': service,
    'notes': notes,
    'crowdPrayer': crowdPrayer,
  };

  factory PoojaRequest.fromJson(Map<String, dynamic> json) {
    final rawDob = json['dob']?.toString();
    late final DateTime parsedDob;

    if (rawDob == null || rawDob.isEmpty) {
      parsedDob = DateTime.now();
    } else {
      parsedDob =
          DateTime.tryParse(rawDob) ??
          DateFormat('dd-MM-yyyy').parseLoose(rawDob);
    }

    return PoojaRequest(
      id: json['id'] is num
          ? (json['id'] as num).toInt()
          : int.tryParse('${json['id']}'),
      fullname: json['fullname']?.toString() ?? 'Unknown',
      dob: parsedDob,
      birthStar: json['birthStar']?.toString() ?? 'N/A',
      diety: json['diety']?.toString() ?? 'N/A',
      service: json['service']?.toString() ?? 'Pooja',
      notes: json['notes']?.toString() ?? '',
      crowdPrayer: json['crowdPrayer'] == true,
      uid: json['uid']?.toString(),
      status: json['status']?.toString() ?? 'PENDING',
      panditId: json['panditId'] is num
          ? (json['panditId'] as num).toInt()
          : int.tryParse('${json['panditId']}'),
      offeredAt: json['offeredAt']?.toString(),
      acceptedAt: json['acceptedAt']?.toString(),
      completedAt: json['completedAt']?.toString(),
      createdAt: json['createdAt']?.toString(),
      updatedAt: json['updatedAt']?.toString(),
      pandit: json['pandit'] is Map
          ? BookingPandit.fromJson(jsonMap(json['pandit']))
          : null,
    );
  }
}

class PaginatedBookings {
  const PaginatedBookings({required this.bookings, required this.pagination});

  final List<PoojaRequest> bookings;
  final BookingPagination pagination;
}

class BookingPagination {
  const BookingPagination({
    required this.page,
    required this.pageSize,
    required this.total,
    required this.totalPages,
  });

  final int page;
  final int pageSize;
  final int total;
  final int totalPages;

  factory BookingPagination.fromJson(Object? value) {
    final json = jsonMap(value);
    return BookingPagination(
      page: _int(json['page']),
      pageSize: _int(json['pageSize']),
      total: _int(json['total']),
      totalPages: _int(json['totalPages']),
    );
  }
}
