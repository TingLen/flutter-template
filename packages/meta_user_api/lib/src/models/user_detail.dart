import 'package:json_annotation/json_annotation.dart';

part 'user_detail.g.dart';

@JsonSerializable()
class UserDetail extends Object {
  @JsonKey(name: 'userId')
  String userId;

  @JsonKey(name: 'realName')
  String realName;

  UserDetail(
    this.userId,
    this.realName,
  );

  factory UserDetail.fromJson(Map<String, dynamic> srcJson) =>
      _$UserDetailFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserDetailToJson(this);
}
