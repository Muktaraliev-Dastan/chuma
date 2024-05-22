// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticatedUser _$AuthenticatedUserFromJson(Map<String, dynamic> json) =>
    AuthenticatedUser(
      id: json['id'] as String,
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String? ?? '0905245929',
      pictureURL: json['picture'] as String,
      moneySpend: (json['moneySpend'] as num?)?.toInt() ?? 7000000,
      addresses: (json['addresses'] as List<dynamic>)
          .map((e) => UserAddress.fromJson(e as Map<String, dynamic>))
          .toList(),
      isNew: json['isNew'] as bool,
    );

Map<String, dynamic> _$AuthenticatedUserToJson(AuthenticatedUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'picture': instance.pictureURL,
      'moneySpend': instance.moneySpend,
      'addresses': instance.addresses.map((e) => e.toJson()).toList(),
      'isNew': instance.isNew,
    };

UserAddress _$UserAddressFromJson(Map<String, dynamic> json) => UserAddress(
      id: (json['id'] as num).toInt(),
      type: $enumDecode(_$TypeUserAddressEnumMap, json['type']),
      addressFromMap: json['map_address'] as String,
      locationOrBuildingOrFloor: json['address_details'] as String,
      landmarkOrGate: json['label'] as String,
      notes: json['notes'] as String,
    );

Map<String, dynamic> _$UserAddressToJson(UserAddress instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$TypeUserAddressEnumMap[instance.type]!,
      'map_address': instance.addressFromMap,
      'address_details': instance.locationOrBuildingOrFloor,
      'label': instance.landmarkOrGate,
      'notes': instance.notes,
    };

const _$TypeUserAddressEnumMap = {
  TypeUserAddress.home: 0,
  TypeUserAddress.work: 1,
  TypeUserAddress.other: 2,
};
