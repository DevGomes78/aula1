import 'dart:convert';
import 'package:aula1/constants/service_constantas_api.dart';
import 'package:aula1/pages/user_list.dart';
import 'package:flutter/material.dart';
import 'package:aula1/models/user_models.dart';
import 'package:http/http.dart' as http;

class UserController {
  List<Data> lista = [];

  Future<List<Data>> getData(String query) async {
    var BaseUrl = Uri.parse(ServiceConstantsApi.APIURL);
    var response = await http.get(BaseUrl);
    if (response.statusCode == 200) {
      var decodeJson = jsonDecode(response.body);
      decodeJson['data'].forEach((item) => lista.add(Data.fromJson(item)));
      if (query.length > 1) {
        lista = lista
            .where(
              (item) => item.firstName!.toLowerCase().contains(
                    query.toLowerCase(),
                  ),
            )
            .toList();
      }

      return lista;
    } else {
      throw Exception(ServiceConstantsApi.ExceptionError);
    }
  }

  Future<void> login(context, String email, String password) async {
    if (email.isNotEmpty && password.isNotEmpty) {
      final response =
          await http.post(Uri.parse(ServiceConstantsApi.APILOGINURL), body: {
        'email': email,
        'password': password,
      });
      if (response.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserList(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(ServiceConstantsApi.snackbarError),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(ServiceConstantsApi.snackbarError1),
        ),
      );
    }
  }
}
