import 'package:hive_flutter/adapters.dart';

part 'user.g.dart';

@HiveType(typeId: 1)
class User {
  User({
    this.name,
    this.age,
    this.address,
    this.image,
  });

  @HiveField(0)
  String? name;

  @HiveField(1)
  int? age;

  @HiveField(2)
  String? address;

  @HiveField(3)
  String? image;
}
