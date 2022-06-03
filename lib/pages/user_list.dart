import 'package:aula1/controller/user_api_controller.dart';
import 'package:aula1/controller/user_search_controller.dart';
import 'package:aula1/models/user_models.dart';
import 'package:aula1/pages/user_page.dart';
import 'package:flutter/material.dart';

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  List<Data> lista = [];

  @override
  void initState() {
    super.initState();
    UserController().getData('').then((value) {
      setState(() {
        lista = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepPurple,
        title: const Text('Lista de Usuarios'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context,
                  delegate: SearchUser());
            },
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: 50,
            alignment: Alignment.bottomCenter,
            width: MediaQuery.of(context).size.width,
            color: Colors.deepPurple,
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: Colors.white,
              ),
              height: MediaQuery.of(context).size.height - 200,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 120,
                      width: 450,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: lista.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              width: 80,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          UserPage(data: lista[index]),
                                    ),
                                  );
                                },
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    lista[index].avatar.toString(),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  height: 500,
                  child: ListView.builder(
                      itemCount: lista.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                lista[index].avatar.toString(),
                              ),
                            ),
                            title: Text(
                              lista[index].firstName.toString(),
                            ),
                            subtitle: Text(
                              lista[index].email.toString(),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
