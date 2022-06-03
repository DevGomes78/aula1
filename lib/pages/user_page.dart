import 'package:aula1/components/top_bar.dart';
import 'package:aula1/models/user_models.dart';
import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  Data data;
  UserPage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User page'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 200,
            child: CircleAvatar(
              maxRadius: 90,
              backgroundImage: NetworkImage(
                data.avatar.toString(),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(data.firstName.toString(),),
        ],
      ),
    );
  }
}
