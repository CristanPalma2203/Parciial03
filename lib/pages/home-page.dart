import 'package:flutter/material.dart';
import 'package:parcial03/widget/nombres.dart';
import 'package:parcial03/widget/chats.dart';
import 'package:parcial03/widget/apellidos.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3, // Se ha cambiado la longitud del controlador a 3
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "WhatsApp",
            style: TextStyle(
              fontSize: 21,
            ),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt_outlined)),
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Container(
                color: Color(0xCD056C63),
                child: TabBar(
                  isScrollable: true,
                  indicatorColor: Colors.white,
                  indicatorWeight: 4,
                  labelStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  tabs: [
                    Container(
                      width: 105,
                      child: Tab(
                        child: Row(
                          children: [
                            Icon(Icons.groups),
                            SizedBox(width: 20),
                            Text("Datos"),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 80,
                      child: Tab(
                        child: Row(
                          children: [
                            Text("Nombres"),
                            SizedBox(
                              width: 4,
                            ),

                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 80,
                      child: Tab(
                        child: Row(
                          children: [
                            Text("Apellidos"),
                            SizedBox(
                              width: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: TabBarView(
                children: [
                  CommunityWidget(),
                  ChatsWidget(),
                  StatusWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}