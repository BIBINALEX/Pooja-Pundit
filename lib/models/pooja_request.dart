import 'package:intl/intl.dart';

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
    this.createdAt,
    this.updatedAt,
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
  final String? createdAt;
  final String? updatedAt;

  String get formattedDob => DateFormat('dd MMM yyyy').format(dob);

  Map<String, dynamic> toJson() => {
    'fullname': fullname,
    'dob': DateFormat('yyyy-MM-dd').format(dob),
    'birthStar': birthStar,
    'diety': diety,
    'service': service,
    'notes': notes,
    'crowdPrayer': crowdPrayer,
    if (uid != null) 'uid': uid,
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
      createdAt: json['createdAt']?.toString(),
      updatedAt: json['updatedAt']?.toString(),
    );
  }
}
