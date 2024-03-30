import 'package:commapp/models/name_model.dart';

Name $NameFromJson(Map<String, dynamic> json) => Name(
      firstname: json['firstname'] as String?,
      lastname:  json['lastname']  as String?,
  );
