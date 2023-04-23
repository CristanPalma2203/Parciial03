import 'package:flutter/material.dart';
import 'package:parcial03/api/reqres.dart';
import 'package:parcial03/response.dart';
import 'package:parcial03/user.dart';
import 'dart:math';

class CommunityWidget extends StatefulWidget {
  const CommunityWidget({super.key});

  @override
  _CommunityWidgetState createState() => _CommunityWidgetState();
}

class _CommunityWidgetState extends State<CommunityWidget> {
  List<User> _users = [];
  final randomNum = Random().nextInt(5);
  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    final reqresService = ReqresService();
    final users = await reqresService.getUsers(
        1, 10); // obtener la primera página de usuarios
    Response r1 = users;
    setState(() {
      _users = r1.list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Column(children: [
        for (int i = 0; i < _users.length; i++)
          InkWell(

            child: Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.network(
                      _users[i].avatar,
                      height: 65,
                      width: 65,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _users[i].firstName,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                           _users[i].email ,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Text(
                        Random().nextInt(24).toString()+":"+Random().nextInt(60).toString(),
                        style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFF5DE062),
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 28,
                        height: 27,
                        decoration: BoxDecoration(
                            color: Color(0xFF5DE062),
                            borderRadius: BorderRadius.circular(15)),
                        child: Text(
                          (_users[i].id + Random().nextInt(5)).toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        SizedBox(
          height: 10,
        ),



      ]),
    ));
  }
}
