enum Gender {
  male,
  female,
  other,
}

class PaymentContactInfoDTO {
  final int? id;
  final int walletId;

  final String name;
  final String phone;
  final String? alternatePhone;
  final String email;
  final String address;

  final String city;
  final String postcode;
  final String country;
  final String? state;

  final Gender gender;

  final DateTime? dateOfBirth;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  PaymentContactInfoDTO({
    this.id,
    required this.walletId,
    required this.name,
    required this.phone,
    this.alternatePhone,
    required this.email,
    required this.address,
    required this.city,
    required this.postcode,
    required this.country,
    this.state,
    required this.gender,
    this.dateOfBirth,
    this.createdAt,
    this.updatedAt,
  });

  factory PaymentContactInfoDTO.fromJson(Map<String, dynamic> json) {
    DateTime? parseDateTime(dynamic value) {
      if (value is String) {
        return DateTime.tryParse(value)?.toLocal();
      }
      return null;
    }

    Gender parseGender(String value) {
      switch (value.toLowerCase()) {
        case 'male':
          return Gender.male;
        case 'female':
          return Gender.female;
        case 'other':
          return Gender.other;
        default:
          return Gender.other;
      }
    }

    return PaymentContactInfoDTO(
      id: json['id'] as int?,
      walletId: json['wallet_id'] as int,
      name: json['name'] as String,
      phone: json['phone'] as String,
      alternatePhone: json['alternate_phone'] as String?,
      email: json['email'] as String,
      address: json['address'] as String,
      city: json['city'] as String,
      postcode: json['postcode'] as String,
      country: json['country'] as String,
      state: json['state'] as String?,
      gender: parseGender(json['gender'] as String),
      dateOfBirth: parseDateTime(json['date_of_birth']),
      createdAt: parseDateTime(json['created_at']),
      updatedAt: parseDateTime(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    String? formatDateTime(DateTime? date) {
      if (date == null) return null;
      return date.toUtc().toIso8601String();
    }

    return {
      'id': id,
      'wallet_id': walletId,
      'name': name,
      'phone': phone,
      'alternate_phone': alternatePhone,
      'email': email,
      'address': address,
      'city': city,
      'postcode': postcode,
      'country': country,
      'state': state,
      'gender': gender.name,
      'date_of_birth': formatDateTime(dateOfBirth),
      'created_at': formatDateTime(createdAt),
      'updated_at': formatDateTime(updatedAt),
    };
  }

  @override
  String toString() {
    return 'PaymentContactInfoDTO(id: $id, walletId: $walletId, name: $name, '
        'phone: $phone, alternatePhone: $alternatePhone, email: $email, '
        'address: $address, city: $city, postcode: $postcode, country: $country, '
        'state: $state, gender: $gender, dateOfBirth: $dateOfBirth, '
        'createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}
