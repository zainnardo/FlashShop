import 'package:commapp/models/address_model.dart';

Address $AddressFromJson(Map<String, dynamic> json) => Address(
      city:    json['city']    as String?,
      street:  json['street']  as String?,
      number:  json['number']  as int?,
      zipcode: json['zipcode'] as String?,
    );