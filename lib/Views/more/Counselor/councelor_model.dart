import 'package:flutter/material.dart';

class CounselorResponse {
  final bool status;
  final String message;
  final List<Counselor> data;

  CounselorResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CounselorResponse.fromJson(Map<String, dynamic> json) {
    return CounselorResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] != null
          ? List<Counselor>.from(json['data'].map((x) => Counselor.fromJson(x)))
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': List<dynamic>.from(data.map((x) => x.toJson())),
    };
  }
}

class Counselor {
  final String id;
  final String name;
  final String email;
  final String? phone;
  final String specialty;

  Counselor({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    required this.specialty,
  });

  factory Counselor.fromJson(Map<String, dynamic> json) {
    return Counselor(
      id: json['id']?.toString() ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'],
      specialty: json['specialty'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'specialty': specialty,
    };
  }

  String get initials => name
      .split(' ')
      .where((w) => w.isNotEmpty)
      .map((w) => w[0].toUpperCase())
      .take(2)
      .join();

  // Predefined color pairs for avatars (Background, Text)
  static const List<Map<String, Color>> _avatarPalette = [
    {'bg': Color(0xFFCECBF6), 'text': Color(0xFF3C3489)}, // Purple
    {'bg': Color(0xFF9FE1CB), 'text': Color(0xFF085041)}, // Green
    {'bg': Color(0xFFF4C0D1), 'text': Color(0xFF72243E)}, // Pink
    {'bg': Color(0xFFB5D4F4), 'text': Color(0xFF0C447C)}, // Blue
    {'bg': Color(0xFFFFE0B2), 'text': Color(0xFFE65100)}, // Orange
    {'bg': Color(0xFFD1C4E9), 'text': Color(0xFF4527A0)}, // Deep Purple
    {'bg': Color(0xFFF0F4C3), 'text': Color(0xFF827717)}, // Lime
    {'bg': Color(0xFFFFCCBC), 'text': Color(0xFFBF360C)}, // Deep Orange
  ];

  Map<String, Color> getColors() {
    final index = name.hashCode.abs() % _avatarPalette.length;
    return _avatarPalette[index];
  }
}
