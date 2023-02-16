import 'dart:convert';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
  Post({
    required this.empNo,
    required this.empName,
    required this.empAddressLine1,
    required this.empAddressLine2,
    required this.empAddressLine3,
    required this.departmentCode,
    required this.dateOfJoin,
    required this.dateOfBirth,
    required this.basicSalary,
    required this.isActive,
  });

  String empNo;
  String empName;
  String empAddressLine1;
  String empAddressLine2;
  String empAddressLine3;
  String departmentCode;
  DateTime dateOfJoin;
  DateTime dateOfBirth;
  int basicSalary;
  bool isActive;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    empNo: json["empNo"],
    empName: json["empName"],
    empAddressLine1: json["empAddressLine1"],
    empAddressLine2: json["empAddressLine2"],
    empAddressLine3: json["empAddressLine3"],
    departmentCode: json["departmentCode"],
    dateOfJoin: DateTime.parse(json["dateOfJoin"]),
    dateOfBirth: DateTime.parse(json["dateOfBirth"]),
    basicSalary: json["basicSalary"],
    isActive: json["isActive"],
  );

  Map<String, dynamic> toJson() => {
    "empNo": empNo,
    "empName": empName,
    "empAddressLine1": empAddressLine1,
    "empAddressLine2": empAddressLine2,
    "empAddressLine3": empAddressLine3,
    "departmentCode": departmentCode,
    "dateOfJoin": dateOfJoin.toIso8601String(),
    "dateOfBirth": dateOfBirth.toIso8601String(),
    "basicSalary": basicSalary,
    "isActive": isActive,
  };
}
