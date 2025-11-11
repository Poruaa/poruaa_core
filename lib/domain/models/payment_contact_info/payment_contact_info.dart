import 'package:poruaa_core/data/services/wallet/dto/payment_contact_info_dto.dart';

class PaymentContactInfo {
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

  PaymentContactInfo({
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

  PaymentContactInfo copyWith({
    int? id,
    int? walletId,
    String? name,
    String? phone,
    String? alternatePhone,
    String? email,
    String? address,
    String? city,
    String? postcode,
    String? country,
    String? state,
    Gender? gender,
    DateTime? dateOfBirth,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return PaymentContactInfo(
      id: id ?? this.id,
      walletId: walletId ?? this.walletId,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      alternatePhone: alternatePhone ?? this.alternatePhone,
      email: email ?? this.email,
      address: address ?? this.address,
      city: city ?? this.city,
      postcode: postcode ?? this.postcode,
      country: country ?? this.country,
      state: state ?? this.state,
      gender: gender ?? this.gender,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory PaymentContactInfo.fromDTO(PaymentContactInfoDTO dto) {
    return PaymentContactInfo(
      id: dto.id,
      walletId: dto.walletId,
      name: dto.name,
      phone: dto.phone,
      alternatePhone: dto.alternatePhone,
      email: dto.email,
      address: dto.address,
      city: dto.city,
      postcode: dto.postcode,
      country: dto.country,
      state: dto.state,
      gender: dto.gender,
      dateOfBirth: dto.dateOfBirth,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
    );
  }

  PaymentContactInfoDTO toDTO() {
    return PaymentContactInfoDTO(
      id: id,
      walletId: walletId,
      name: name,
      phone: phone,
      alternatePhone: alternatePhone,
      email: email,
      address: address,
      city: city,
      postcode: postcode,
      country: country,
      state: state,
      gender: gender,
      dateOfBirth: dateOfBirth,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
