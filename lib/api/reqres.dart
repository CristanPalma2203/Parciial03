import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:parcial03/response.dart';

class ReqresService {
  final baseUrl = "https://reqres.in/api/";
  Future<Response> getUsers(int page, int per_page) async {
    var url = Uri.parse(baseUrl + "users?page=$page&per_page=$per_page");
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      return Response.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load users');
    }
  }
}
