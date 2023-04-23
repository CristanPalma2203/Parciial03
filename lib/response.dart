import 'package:parcial03/user.dart';

class Response {
  int page;
  List<User> list;

  Response({
    required this.page,
    required this.list,
  });

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      page: json['page'],
      list: (json['data'] as List).map((userJson) => User.fromJson(userJson)).toList(),
    );
  }
}