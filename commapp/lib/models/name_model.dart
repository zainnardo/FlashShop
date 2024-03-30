import 'package:commapp/models/base_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:commapp/models/generators/name_generator.dart';

@JsonSerializable(createToJson: false)
class Name extends BaseModel {
  String? firstname;
  String? lastname;

  Name({this.firstname, this.lastname});
  factory Name.fromJson(Map<String, dynamic> json) => $NameFromJson(json);
  @override
  fromJson(Map<String, dynamic> json) {
    return $NameFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}