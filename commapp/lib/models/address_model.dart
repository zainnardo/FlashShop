import 'package:commapp/models/base_model.dart';
import 'package:commapp/models/generators/address_generator.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(createToJson: false)
class Address extends BaseModel {
  String? city;
  String? street;
  int? number;
  String? zipcode;

  Address({this.city, this.street, this.number, this.zipcode});

  factory Address.fromJson(Map<String, dynamic> json) =>
      $AddressFromJson(json);

  @override
  fromJson(Map<String, dynamic> json) {
    return $AddressFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}