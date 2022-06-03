import 'package:aula1/components/text_form_widget.dart';
import 'package:aula1/components/top_bar.dart';
import 'package:aula1/constants/service_constants.dart';
import 'package:aula1/controller/user_api_controller.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  TextEditingController emailController =
      TextEditingController(text: 'eve.holt@reqres.in');
  TextEditingController passwordController =
      TextEditingController(text: ' "cityslicka');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepPurple,
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          TopBar(),
         Padding(
           padding: const EdgeInsets.all(10.0),
           child: Column(
             children: [
               const Icon(Icons.person, size: 200),
               const SizedBox(height: 10),
               mountAreaEmail(),
               const SizedBox(height: 10),
               mountAreaSenha(),
               const SizedBox(height: 20),
               InkWell(
                 onTap: () {
                   UserController().login(
                     context,
                     emailController.text,
                     passwordController.text,
                   );
                 },
                 child: Container(
                   height: 55,
                   width: double.infinity,
                   alignment: Alignment.center,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(20),
                     color: Colors.deepPurple,
                   ),
                   child: const Text(
                     ServiceConstants.SALVAR,
                     style: TextStyle(
                       color: Colors.white,
                     ),
                   ),
                 ),
               ),
             ],
           ),
         )
        ],
      )
    );
  }

  mountAreaSenha() {
    return TextFormWidget(
      ServiceConstants.SENHA,
      ServiceConstants.DIGITESENHA,
      const Icon(Icons.lock, color: Colors.white),
      controller: passwordController,
      validator: _validarPassword,
    );
  }

  mountAreaEmail() {
    return TextFormWidget(
      ServiceConstants.email,
      ServiceConstants.digiteEmail,
      const Icon(Icons.email),
      controller: emailController,
      validator: _validarEmail,
    );
  }

  String? _validarEmail(String? value) {
    if (value!.isEmpty) {
      return 'campos em branco';
    }
  }

  String? _validarPassword(String? value) {
    if (value!.isEmpty) {
      return 'campos em branco';
    }
  }
}
